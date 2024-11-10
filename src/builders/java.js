'use strict'

const { sep } = require('path')
const Base = require('./base')

const TYPES = {
  address:    'TreeNode',
  chunk:      'String',
  elements: 'Array(TreeNode)',
  index: 'Int32',
  max: 'Int32'
}

class Builder extends Base {
  constructor (...args) {
    super(...args)
    this._labels = new Set()
  }

  _tab () {
    return '  '
  }

  _quote (string) {
    string = string.replace(/\\/g, '\\\\')
      .replace(/"/g, '\\"')
      .replace(/#\{/g, '\\#{')
      .replace(/\x07/g, '\\a')
      .replace(/\x08/g, '\\b')
      .replace(/\t/g, '\\t')
      .replace(/\n/g, '\\n')
      .replace(/\v/g, '\\v')
      .replace(/\f/g, '\\f')
      .replace(/\r/g, '\\r')
      .replace(/\x1b/g, '\\e')
    return '"' + string + '"'
  }

  comment (lines) {
    return lines.map((line) => '# ' + line)
  }

  package_ (name, actions, block) {
    this._grammarName = name

    this._newBuffer('cr', 'Actions')
    this._template('java', 'Actions.cr', { actions })

    this._newBuffer('cr', 'CacheRecord')
    this._template('java', 'CacheRecord.cr')

    block()
  }

  syntaxNodeClass_ () {
    let name = 'TreeNode'

    this._newBuffer('cr', name)
    this._template('java', 'TreeNode.cr', { name })

    return name
  }

  grammarModule_ (block) {
    this._newBuffer('cr', 'Grammar')

    this._line('require "./Actions"')
    this._line('require "./CacheRecord"')
    this._newline()

    this._line('abstract class Grammar', false)
    this._indent(() => {
      this.assign_(this.nullNode_(), 'TreeNode.new')
      this._newline()

      this._line('property input_size : Int32')
      this._line('property @offset : Int32')
      this._line('property failure : Int32')
      this._line('property input : String')
      this._line('property expected : Array(Array(String))')
      this._line('property cache : Hash(Symbol, Hash(Int32, CacheRecord))')
      this._line('property actions : Actions?')
      this._newline()
      block()

      this._line('end', false)
    })
  }

  compileRegex_ (charClass, name) {
    let regex  = charClass.regex,
        source = regex.source.replace(/^\^/, '\\A')

    this.assign_('@@' + name, '/' + this._quote(source) + '/')
    charClass.constName = name
  }

  parserClass_ (root) {
    this._newBuffer('cr', 'ParseError')
    this._template('java', 'ParseError.cr')

    let grammar = this._quote(this._grammarName)
    let name = this._grammarName.replace(/\./g, '')
    this._newBuffer('cr', name)
    this._template('java', 'Parser.cr', { grammar, root, name })
  }

  class_ (name, parent, block) {
    this._newline()
    this._line('class ' + name + ' < ' + parent, false)
    this._scope(block, name)
    this._line('end', false)
  }

  constructor_ (args, block) {
    this._line('def initialize(text : String, @offset : Int32, elements : Array(TreeNode))', false)
    this._indent(() => {
      this._line('super(text, @offset, elements)')
      block()
    })
    this._line('end', false)
  }

  method_ (name, args, block) {
    this._newline()
    this._line('def ' + name + ' : TreeNode', false)
    this._scope(block)
    this._line('end', false)
  }

  cache_ (name, block) {
    this._labels.add(name)

    let temp = this.localVars_({ address: this.nullNode_(), index: '@offset' }),
        address = temp.address,
    @offset  = temp.index

    this.assign_('rule : Hash(Int32, CacheRecord) ', 'cache[:' + name + ']')
    this.if_('rule', () => {
      this.assign_('rule', '{} of Int32 => CacheRecord')
      this.assign('cache[:' + name + ']', 'rule')
    })
    this.if_('rule.has_key?(@offset)', () => {
      this.assign_('r@offset', 'rule[@offset]')
      this.assign_(address, 'r@offset.node')
      this.assign_('@offset', 'r@offset.tail')
    }, () => {
      block(address)
      this.assign('rule[' + @offset + ']', 'CacheRecord.new(' + address + ', @offset)')
    })
    this._return(address)
  }

  attribute_ (name, value) {
    this._labels.add(name)
    this.assign('labelled[:' + name + ']', 'value')
  }

  localVars_ (vars) {
    let names = {}
    for (let name in vars)
      names[name] = this.localVar_(name, vars[name])
    return names
  }

  localVar_ (name, value) {
    let varName = this._varName(name)

    if (value === undefined) value = this.nullNode_()
    this.assign_(varName + ' : ' + TYPES[name], value)

    return varName
  }

  chunk_ (length) {
    let input = 'input',
      ofs = '@offset',
        temp  = this.localVars_({ chunk: this.null_(), max: ofs + ' + ' + length })

    this.if_(temp.max + ' <= inputSize', () => {
      this._line(temp.chunk + ' = ' + input + '[' + ofs + '...' + temp.max + ']')
    })
    return temp.chunk
  }

  syntaxNode_ (address, start, end, elements, action, nodeClass) {
    let args

    if (action) {
      action = 'actions.' + action
      args   = ['input', start, end]
    } else {
      action = (nodeClass || 'TreeNode') + '.new'
      args = ['input[' + start + '...' + end + ']', start]
    }
    args.push(elements || this.emptyList_())

    this.assign_(address, action + '(' + args.join(', ') + ')')
    this.assign_('@offset', end)
  }

  ifNode_ (address, block, else_) {
    this.if_(address + ' != ' + this.nullNode_(), block, else_)
  }

  unlessNode_ (address, block, else_) {
    this.if_(address + ' == ' + this.nullNode_(), block, else_)
  }

  ifNull_ (elements, block, else_) {
    this.if_(elements, block, else_)
  }

  extendNode_ (address, nodeType) {
    // TODO
  }

  failure_ (address, expected) {
    let rule = this._quote(this._grammarName + '::' + this._ruleName)
    expected = this._quote(expected)

    this.assign_(address, this.nullNode_())

    this.if_('@offset > @failure', () => {
      this.assign_('@failure', '@offset')
      this.assign_('@expected', 'Array(Array(String)).new')
    })
    this.if_('@offset == @failure', () => {
      this.append_('@expected', '[ ' + rule + ', ' + expected + ' ]')
    })
  }

  jump_ (address, rule) {
    this.assign_(address, '_read_' + rule)
  }

  _conditional (kwd, condition, block, else_) {
    this._line(kwd + ' ' + condition, false)
    this._indent(block)
    if (else_) {
      this._line('else', false)
      this._indent(else_)
    }
    this._line('end', false)
  }

  if_ (condition, block, else_) {
    this._conditional('if', condition, block, else_)
  }

  loop_ (block) {
    this._conditional('while', 'true', block)
  }

  break_ () {
    this._line('break')
  }

  sizeInRange_ (address, [min, max]) {
    if (max === -1) {
      return address + '.size >= ' + min
    } else if (max === 0) {
      return address + '.size == ' + min
    } else {
      return address + '.size >= ' + min + ' && ' + address + '.size <= ' + max
    }
  }

  stringMatch_ (expression, string) {
    return expression + ' && ' + expression + ' == ' + this._quote(string)
  }

  stringMatchCI_ (expression, string) {
    return expression + ' && ' + expression + '.downcase == ' + this._quote(string) + '.downcase)'
  }

  regexMatch_ (regex, string) {
    return string + ' && ' + regex + ' =~ ' + string
  }

  arrayLookup_(expression, @offset) {
    return expression + '[' + @offset + ']'
  }

  append_ (list, value, index) {
    if (index === undefined)
      this._line(list + ' << ' + value)
    else
      this._line(list + 'insert(' + index + ', ' + value + ')')
  }

  hasChars_ () {
    return '@offset < inputSize'
  }

  nullNode_ () {
    return '@@FAILURE'
  }

  @offset_() {
  return '@offset'
  }

  emptyList_ (size) {
  return 'Array(TreeNode).new(' + (size || '') + ')'
  }

  _emptyString () {
    return '""'
  }

  null_ () {
  return 'nil'
  }
}

module.exports = Builder
