# This file was generated from examples/canopy/lisp.peg
# See https://canopy.jcoglan.com/ for documentation

require "./Actions"
require "./CacheRecord"

abstract class Grammar
  @@FAILURE = TreeNode.new

  property input_size : Int32
  property offset : Int32
  property failure : Int32
  property input : String
  property expected : Array(Array(String))
  property cache : Hash(Symbol, Hash(Int32, CacheRecord))
  property actions : Actions?

  @@REGEX_1 = /"\\A[1-9]"/
  @@REGEX_2 = /"\\A[0-9]"/
  @@REGEX_3 = /"\\A[^\"]"/
  @@REGEX_4 = /"\\A[\\s]"/
  def initialize(@input : String, @actions : Actions?)
    @input_size = input.size
    @offset = 0
    @failure = -1
    @expected = Array(Array(String)).new
    @cache = Hash(Symbol, Hash(Int32, CacheRecord)).new
  end
  def _read_program : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:program]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:program] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new()
      address1 = nil
      while true
        address1 = _read_cell
        if address1 != @@FAILURE
          elements0 << address1
        else
          break
        end
      end
      if elements0.size >= 1
        address0 = TreeNode.new(input[index1...@offset], index1, elements0)
      else
        address0 = @@FAILURE
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_cell : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:cell]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:cell] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(3)
      address1 : Nil | TreeNode = @@FAILURE
      index2 = @offset
      elements1 = Array(TreeNode).new()
      address2 = nil
      while true
        address2 = _read_space
        if address2 != @@FAILURE
          elements1 << address2
        else
          break
        end
      end
      if elements1.size >= 0
        address1 = TreeNode.new(input[index2...@offset], index2, elements1)
      else
        address1 = @@FAILURE
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address3 : Nil | TreeNode = @@FAILURE
        index3 = @offset
        address3 = _read_list
        if address3 == @@FAILURE
          @offset = index3
          address3 = _read_atom
          if address3 == @@FAILURE
            @offset = index3
          end
        end
        if address3 != @@FAILURE
          elements0.insert(1, address3)
          address4 : Nil | TreeNode = @@FAILURE
          index4 = @offset
          elements2 = Array(TreeNode).new()
          address5 = nil
          while true
            address5 = _read_space
            if address5 != @@FAILURE
              elements2 << address5
            else
              break
            end
          end
          if elements2.size >= 0
            address4 = TreeNode.new(input[index4...@offset], index4, elements2)
          else
            address4 = @@FAILURE
          end
          if address4 != @@FAILURE
            elements0.insert(2, address4)
          else
            elements0 = nil
            @offset = index1
          end
        else
          elements0 = nil
          @offset = index1
        end
      else
        elements0 = nil
        @offset = index1
      end
      if elements0.nil?
        address0 = @@FAILURE
      else
        address0 = TreeNode1.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_list : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:list]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:list] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(3)
      address1 : Nil | TreeNode = @@FAILURE
      chunk0 = nil
      max0 = @offset + 1
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0 == "("
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyLisp::list", "\"(\"" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        elements1 = Array(TreeNode).new()
        address3 = nil
        while true
          address3 = _read_cell
          if address3 != @@FAILURE
            elements1 << address3
          else
            break
          end
        end
        if elements1.size >= 1
          address2 = TreeNode.new(input[index2...@offset], index2, elements1)
        else
          address2 = @@FAILURE
        end
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address4 : Nil | TreeNode = @@FAILURE
          chunk1 = nil
          max1 = @offset + 1
          if max1 <= input_size
            chunk1 = input[@offset...max1]
          end
          if chunk1 && chunk1 == ")"
            address4 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address4 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "CanopyLisp::list", "\")\"" ]
            end
          end
          if address4 != @@FAILURE
            elements0.insert(2, address4)
          else
            elements0 = nil
            @offset = index1
          end
        else
          elements0 = nil
          @offset = index1
        end
      else
        elements0 = nil
        @offset = index1
      end
      if elements0.nil?
        address0 = @@FAILURE
      else
        address0 = TreeNode2.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_atom : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:atom]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:atom] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      address0 = _read_boolean_
      if address0 == @@FAILURE
        @offset = index1
        address0 = _read_integer
        if address0 == @@FAILURE
          @offset = index1
          address0 = _read_string
          if address0 == @@FAILURE
            @offset = index1
            address0 = _read_symbol
            if address0 == @@FAILURE
              @offset = index1
            end
          end
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_boolean_ : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:boolean_]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:boolean_] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      chunk0 = nil
      max0 = @offset + 2
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0 == "#t"
        address0 = TreeNode.new(input[@offset...@offset + 2], @offset, Array(TreeNode).new())
        @offset = @offset + 2
      else
        address0 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyLisp::boolean_", "\"#t\"" ]
        end
      end
      if address0 == @@FAILURE
        @offset = index1
        chunk1 = nil
        max1 = @offset + 2
        if max1 <= input_size
          chunk1 = input[@offset...max1]
        end
        if chunk1 && chunk1 == "#f"
          address0 = TreeNode.new(input[@offset...@offset + 2], @offset, Array(TreeNode).new())
          @offset = @offset + 2
        else
          address0 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "CanopyLisp::boolean_", "\"#f\"" ]
          end
        end
        if address0 == @@FAILURE
          @offset = index1
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_integer : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:integer]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:integer] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      chunk0 = nil
      max0 = @offset + 1
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && @@REGEX_1 =~ chunk0
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyLisp::integer", "[1-9]" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        elements1 = Array(TreeNode).new()
        address3 = nil
        while true
          chunk1 = nil
          max1 = @offset + 1
          if max1 <= input_size
            chunk1 = input[@offset...max1]
          end
          if chunk1 && @@REGEX_2 =~ chunk1
            address3 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address3 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "CanopyLisp::integer", "[0-9]" ]
            end
          end
          if address3 != @@FAILURE
            elements1 << address3
          else
            break
          end
        end
        if elements1.size >= 0
          address2 = TreeNode.new(input[index2...@offset], index2, elements1)
        else
          address2 = @@FAILURE
        end
        if address2 != @@FAILURE
          elements0.insert(1, address2)
        else
          elements0 = nil
          @offset = index1
        end
      else
        elements0 = nil
        @offset = index1
      end
      if elements0.nil?
        address0 = @@FAILURE
      else
        address0 = TreeNode.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_string : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:string]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:string] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(3)
      address1 : Nil | TreeNode = @@FAILURE
      chunk0 = nil
      max0 = @offset + 1
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0 == "\""
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyLisp::string", "\"\\\"\"" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        elements1 = Array(TreeNode).new()
        address3 = nil
        while true
          index3 = @offset
          index4 = @offset
          elements2 = Array(TreeNode).new(2)
          address4 : Nil | TreeNode = @@FAILURE
          chunk1 = nil
          max1 = @offset + 1
          if max1 <= input_size
            chunk1 = input[@offset...max1]
          end
          if chunk1 && chunk1 == "\\"
            address4 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address4 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "CanopyLisp::string", "\"\\\\\"" ]
            end
          end
          if address4 != @@FAILURE
            elements2.insert(0, address4)
            address5 : Nil | TreeNode = @@FAILURE
            if @offset < input_size
              address5 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address5 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyLisp::string", "<any char>" ]
              end
            end
            if address5 != @@FAILURE
              elements2.insert(1, address5)
            else
              elements2 = nil
              @offset = index4
            end
          else
            elements2 = nil
            @offset = index4
          end
          if elements2.nil?
            address3 = @@FAILURE
          else
            address3 = TreeNode.new(input[index4...@offset], index4, elements2)
          end
          if address3 == @@FAILURE
            @offset = index3
            chunk2 = nil
            max2 = @offset + 1
            if max2 <= input_size
              chunk2 = input[@offset...max2]
            end
            if chunk2 && @@REGEX_3 =~ chunk2
              address3 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address3 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyLisp::string", "[^\"]" ]
              end
            end
            if address3 == @@FAILURE
              @offset = index3
            end
          end
          if address3 != @@FAILURE
            elements1 << address3
          else
            break
          end
        end
        if elements1.size >= 0
          address2 = TreeNode.new(input[index2...@offset], index2, elements1)
        else
          address2 = @@FAILURE
        end
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address6 : Nil | TreeNode = @@FAILURE
          chunk3 = nil
          max3 = @offset + 1
          if max3 <= input_size
            chunk3 = input[@offset...max3]
          end
          if chunk3 && chunk3 == "\""
            address6 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address6 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "CanopyLisp::string", "\"\\\"\"" ]
            end
          end
          if address6 != @@FAILURE
            elements0.insert(2, address6)
          else
            elements0 = nil
            @offset = index1
          end
        else
          elements0 = nil
          @offset = index1
        end
      else
        elements0 = nil
        @offset = index1
      end
      if elements0.nil?
        address0 = @@FAILURE
      else
        address0 = TreeNode.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_symbol : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:symbol]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:symbol] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new()
      address1 = nil
      while true
        index2 = @offset
        elements1 = Array(TreeNode).new(2)
        address2 : Nil | TreeNode = @@FAILURE
        index3 = @offset
        address2 = _read_delimiter
        @offset = index3
        if address2 == @@FAILURE
          address2 = TreeNode.new(input[@offset...@offset], @offset, Array(TreeNode).new())
        else
          address2 = @@FAILURE
        end
        if address2 != @@FAILURE
          elements1.insert(0, address2)
          address3 : Nil | TreeNode = @@FAILURE
          if @offset < input_size
            address3 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address3 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "CanopyLisp::symbol", "<any char>" ]
            end
          end
          if address3 != @@FAILURE
            elements1.insert(1, address3)
          else
            elements1 = nil
            @offset = index2
          end
        else
          elements1 = nil
          @offset = index2
        end
        if elements1.nil?
          address1 = @@FAILURE
        else
          address1 = TreeNode.new(input[index2...@offset], index2, elements1)
        end
        if address1 != @@FAILURE
          elements0 << address1
        else
          break
        end
      end
      if elements0.size >= 1
        address0 = TreeNode.new(input[index1...@offset], index1, elements0)
      else
        address0 = @@FAILURE
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_space : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:space]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:space] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      chunk0 = nil
      max0 = @offset + 1
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && @@REGEX_4 =~ chunk0
        address0 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address0 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyLisp::space", "[\\s]" ]
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_paren : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:paren]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:paren] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      chunk0 = nil
      max0 = @offset + 1
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0 == "("
        address0 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address0 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyLisp::paren", "\"(\"" ]
        end
      end
      if address0 == @@FAILURE
        @offset = index1
        chunk1 = nil
        max1 = @offset + 1
        if max1 <= input_size
          chunk1 = input[@offset...max1]
        end
        if chunk1 && chunk1 == ")"
          address0 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address0 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "CanopyLisp::paren", "\")\"" ]
          end
        end
        if address0 == @@FAILURE
          @offset = index1
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_delimiter : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:delimiter]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:delimiter] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      address0 = _read_paren
      if address0 == @@FAILURE
        @offset = index1
        address0 = _read_space
        if address0 == @@FAILURE
          @offset = index1
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end
  end
