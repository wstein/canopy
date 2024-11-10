'use strict'

const { readFileSync } = require('fs')
const { basename, dirname, join } = require('path')
const handlebars = require('handlebars')

class Scope {
  constructor (parentScope, name, parentName) {
    if (name) {
      this.name = name
      this.parent = parentName
    } else if (parentScope) {
      this.name = parentScope.name
      this.parent = parentScope.parent
    }
    this.methodSeparator = ''
    this._varIndex = {}
  }

  varName (name) {
    this._varIndex[name] = this._varIndex[name] || 0
    let varName = name + this._varIndex[name]
    this._varIndex[name] += 1

    return varName
  }
}

class Base {
  static create(outputPath) {
    return new this(outputPath)
  }

  constructor(outputPath) {
    this._outputPath  = outputPath
    this._semicolon = true
    this._indentLevel = 0

    this._buffers = new Map()
    this._currentBuffer = null

    this._stack = [new Scope()]
    this._currentScope = this._stack[0]
  }

  serialize () {
    return this._buffers
  }

  attributes_ (names) {}

  compileRegex_ (charClass, name) {}

  rule_ (name, block) {
    this._ruleName = name
    block()
  }

  assign_ (name, value) {
    this._line(name + ' = ' + value)
  }

  pass_ () {}

  _tab () {
    return '  '
  }

  _newBuffer (ext, name = null) {
    if (name) {
      this._currentBuffer = join(this._outputPath, name + '.' + ext)
    } else {
      this._currentBuffer = join(this._outputPath + '.' + ext)
    }
    let buffer = this._initBuffer(this._currentBuffer)
    this._buffers.set(this._currentBuffer, buffer)
  }

  _initBuffer (pathname) {
    return ''
  }

  _template (lang, name, args) {
    let pathname = join(__dirname, '..', '..', 'templates', lang, name),
        template = handlebars.compile(readFileSync(pathname, 'utf8')),
        result   = template(args).replace(/\s*$/, '')

    for (let line of result.split(/\n/))
      this._line(line, false)
  }

  _write (string) {
    let name = this._currentBuffer
    this._buffers.set(name, this._buffers.get(name) + string)
  }

  _indent (block) {
    this._indentLevel += 1
    block()
    this._indentLevel -= 1
  }

  _scope (block, name, parentName, indent) {
    let parent = this._stack[this._stack.length - 1]
    let scope = new Scope(parent, name, parentName)
    this._stack.push(scope)
    this._currentScope = scope

    if (indent !== false) {
      this._indent(block)
    } else {
      block()
    }
    this._stack.pop()
    this._currentScope = parent
  }

  _varName (name) {
    return this._currentScope.varName(name)
  }

  _line(source, semicolon = this._semicolon) {
    let i = this._indentLevel

    if (source.length > 0) {
      while (i--) this._write(this._tab())
      this._write(source)
      if (semicolon) this._write(';')
    }
    this._newline()
  }

  _newline () {
    this._write('\n')
  }

  _return (expression) {
    this._line('return ' + expression)
  }
}

module.exports = Base
