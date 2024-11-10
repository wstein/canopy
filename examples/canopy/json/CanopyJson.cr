# This file was generated from examples/canopy/json.peg
# See https://canopy.jcoglan.com/ for documentation

require "./Grammar.cr"
require "./TreeNode.cr"
require "./CacheRecord.cr"
require "./Actions.cr"
require "./ParseError.cr"

class CanopyJson < Grammar
  def initialize(@input : String, @actions : Actions?)
    @input_size = @input.size
    @offset = 0
    @cache = Hash(Symbol, Hash(Int32, CacheRecord)).new
    @failure = 0
    @expected = Array(Array(String)).new
  end

  def self.parse(input : String, actions : Actions? = nil) : TreeNode
    parser = CanopyJson.new(input, actions)
    parser.parse
  end

  def self.format_error(input : String, offset : Int32, expected : Array(Array(String))) : String
    lines = input.split("\n")
    line_no = 0
    position = 0

    while position <= offset
      position += lines[line_no].size + 1
      line_no += 1
    end

    line = lines[line_no - 1]
    message = "Line #{line_no}: expected one of:\n\n"

    expected.each do |pair|
      message += "    - #{pair[1]} from #{pair[0]}\n"
    end

    number = line_no.to_s
    while number.size < 6
      number = " " + number
    end
    message += "\n#{number} | #{line}\n"

    position -= line.size + 10

    while position < offset
      message += " "
      position += 1
    end
    message + "^"
  end

  def parse : TreeNode
    tree = _read_document()
    if tree != @@FAILURE && @offset == @input_size
      return tree
    end
    if @expected.empty?
      @failure = @offset
      @expected << ["CanopyJson", "<EOF>"]
    end
    raise ParseError.new(self.class.format_error(@input, @failure, @expected))
  end
end

