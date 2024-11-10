# This file was generated from examples/canopy/json.peg
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

  @@REGEX_1 = /"\\A[^\"]"/
  @@REGEX_2 = /"\\A[1-9]"/
  @@REGEX_3 = /"\\A[0-9]"/
  @@REGEX_4 = /"\\A[0-9]"/
  @@REGEX_5 = /"\\A[0-9]"/
  @@REGEX_6 = /"\\A[\\s]"/

  def _read_document : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:document]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:document] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(3)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read___
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        address2 = _read_object
        if address2 == @@FAILURE
          @offset = index2
          address2 = _read_array
          if address2 == @@FAILURE
            @offset = index2
          end
        end
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address3 : Nil | TreeNode = @@FAILURE
          address3 = _read___
          if address3 != @@FAILURE
            elements0.insert(2, address3)
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

  def _read_object : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:object]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:object] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      index2 = @offset
      elements0 = Array(TreeNode).new(4)
      address1 : Nil | TreeNode = @@FAILURE
      chunk0 = nil
      max0 = @offset + 1
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0 == "{"
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyJson::object", "\"{\"" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        address2 = _read_pair
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address3 : Nil | TreeNode = @@FAILURE
          index3 = @offset
          elements1 = Array(TreeNode).new()
          address4 = nil
          while true
            index4 = @offset
            elements2 = Array(TreeNode).new(2)
            address5 : Nil | TreeNode = @@FAILURE
            chunk1 = nil
            max1 = @offset + 1
            if max1 <= input_size
              chunk1 = input[@offset...max1]
            end
            if chunk1 && chunk1 == ","
              address5 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address5 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyJson::object", "\",\"" ]
              end
            end
            if address5 != @@FAILURE
              elements2.insert(0, address5)
              address6 : Nil | TreeNode = @@FAILURE
              address6 = _read_pair
              if address6 != @@FAILURE
                elements2.insert(1, address6)
              else
                elements2 = nil
                @offset = index4
              end
            else
              elements2 = nil
              @offset = index4
            end
            if elements2.nil?
              address4 = @@FAILURE
            else
              address4 = TreeNode3.new(input[index4...@offset], index4, elements2)
            end
            if address4 != @@FAILURE
              elements1 << address4
            else
              break
            end
          end
          if elements1.size >= 0
            address3 = TreeNode.new(input[index3...@offset], index3, elements1)
          else
            address3 = @@FAILURE
          end
          if address3 != @@FAILURE
            elements0.insert(2, address3)
            address7 : Nil | TreeNode = @@FAILURE
            chunk2 = nil
            max2 = @offset + 1
            if max2 <= input_size
              chunk2 = input[@offset...max2]
            end
            if chunk2 && chunk2 == "}"
              address7 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address7 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyJson::object", "\"}\"" ]
              end
            end
            if address7 != @@FAILURE
              elements0.insert(3, address7)
            else
              elements0 = nil
              @offset = index2
            end
          else
            elements0 = nil
            @offset = index2
          end
        else
          elements0 = nil
          @offset = index2
        end
      else
        elements0 = nil
        @offset = index2
      end
      if elements0.nil?
        address0 = @@FAILURE
      else
        address0 = TreeNode2.new(input[index2...@offset], index2, elements0)
      end
      if address0 == @@FAILURE
        @offset = index1
        index5 = @offset
        elements3 = Array(TreeNode).new(3)
        address8 : Nil | TreeNode = @@FAILURE
        chunk3 = nil
        max3 = @offset + 1
        if max3 <= input_size
          chunk3 = input[@offset...max3]
        end
        if chunk3 && chunk3 == "{"
          address8 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address8 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "CanopyJson::object", "\"{\"" ]
          end
        end
        if address8 != @@FAILURE
          elements3.insert(0, address8)
          address9 : Nil | TreeNode = @@FAILURE
          address9 = _read___
          if address9 != @@FAILURE
            elements3.insert(1, address9)
            address10 : Nil | TreeNode = @@FAILURE
            chunk4 = nil
            max4 = @offset + 1
            if max4 <= input_size
              chunk4 = input[@offset...max4]
            end
            if chunk4 && chunk4 == "}"
              address10 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address10 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyJson::object", "\"}\"" ]
              end
            end
            if address10 != @@FAILURE
              elements3.insert(2, address10)
            else
              elements3 = nil
              @offset = index5
            end
          else
            elements3 = nil
            @offset = index5
          end
        else
          elements3 = nil
          @offset = index5
        end
        if elements3.nil?
          address0 = @@FAILURE
        else
          address0 = TreeNode4.new(input[index5...@offset], index5, elements3)
        end
        if address0 == @@FAILURE
          @offset = index1
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_pair : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:pair]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:pair] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(5)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read___
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        address2 = _read_string
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address3 : Nil | TreeNode = @@FAILURE
          address3 = _read___
          if address3 != @@FAILURE
            elements0.insert(2, address3)
            address4 : Nil | TreeNode = @@FAILURE
            chunk0 = nil
            max0 = @offset + 1
            if max0 <= input_size
              chunk0 = input[@offset...max0]
            end
            if chunk0 && chunk0 == ":"
              address4 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address4 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyJson::pair", "\":\"" ]
              end
            end
            if address4 != @@FAILURE
              elements0.insert(3, address4)
              address5 : Nil | TreeNode = @@FAILURE
              address5 = _read_value
              if address5 != @@FAILURE
                elements0.insert(4, address5)
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
        address0 = TreeNode5.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_array : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:array]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:array] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      index2 = @offset
      elements0 = Array(TreeNode).new(4)
      address1 : Nil | TreeNode = @@FAILURE
      chunk0 = nil
      max0 = @offset + 1
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0 == "["
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyJson::array", "\"[\"" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        address2 = _read_value
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address3 : Nil | TreeNode = @@FAILURE
          index3 = @offset
          elements1 = Array(TreeNode).new()
          address4 = nil
          while true
            index4 = @offset
            elements2 = Array(TreeNode).new(2)
            address5 : Nil | TreeNode = @@FAILURE
            chunk1 = nil
            max1 = @offset + 1
            if max1 <= input_size
              chunk1 = input[@offset...max1]
            end
            if chunk1 && chunk1 == ","
              address5 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address5 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyJson::array", "\",\"" ]
              end
            end
            if address5 != @@FAILURE
              elements2.insert(0, address5)
              address6 : Nil | TreeNode = @@FAILURE
              address6 = _read_value
              if address6 != @@FAILURE
                elements2.insert(1, address6)
              else
                elements2 = nil
                @offset = index4
              end
            else
              elements2 = nil
              @offset = index4
            end
            if elements2.nil?
              address4 = @@FAILURE
            else
              address4 = TreeNode7.new(input[index4...@offset], index4, elements2)
            end
            if address4 != @@FAILURE
              elements1 << address4
            else
              break
            end
          end
          if elements1.size >= 0
            address3 = TreeNode.new(input[index3...@offset], index3, elements1)
          else
            address3 = @@FAILURE
          end
          if address3 != @@FAILURE
            elements0.insert(2, address3)
            address7 : Nil | TreeNode = @@FAILURE
            chunk2 = nil
            max2 = @offset + 1
            if max2 <= input_size
              chunk2 = input[@offset...max2]
            end
            if chunk2 && chunk2 == "]"
              address7 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address7 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyJson::array", "\"]\"" ]
              end
            end
            if address7 != @@FAILURE
              elements0.insert(3, address7)
            else
              elements0 = nil
              @offset = index2
            end
          else
            elements0 = nil
            @offset = index2
          end
        else
          elements0 = nil
          @offset = index2
        end
      else
        elements0 = nil
        @offset = index2
      end
      if elements0.nil?
        address0 = @@FAILURE
      else
        address0 = TreeNode6.new(input[index2...@offset], index2, elements0)
      end
      if address0 == @@FAILURE
        @offset = index1
        index5 = @offset
        elements3 = Array(TreeNode).new(3)
        address8 : Nil | TreeNode = @@FAILURE
        chunk3 = nil
        max3 = @offset + 1
        if max3 <= input_size
          chunk3 = input[@offset...max3]
        end
        if chunk3 && chunk3 == "["
          address8 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address8 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "CanopyJson::array", "\"[\"" ]
          end
        end
        if address8 != @@FAILURE
          elements3.insert(0, address8)
          address9 : Nil | TreeNode = @@FAILURE
          address9 = _read___
          if address9 != @@FAILURE
            elements3.insert(1, address9)
            address10 : Nil | TreeNode = @@FAILURE
            chunk4 = nil
            max4 = @offset + 1
            if max4 <= input_size
              chunk4 = input[@offset...max4]
            end
            if chunk4 && chunk4 == "]"
              address10 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address10 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyJson::array", "\"]\"" ]
              end
            end
            if address10 != @@FAILURE
              elements3.insert(2, address10)
            else
              elements3 = nil
              @offset = index5
            end
          else
            elements3 = nil
            @offset = index5
          end
        else
          elements3 = nil
          @offset = index5
        end
        if elements3.nil?
          address0 = @@FAILURE
        else
          address0 = TreeNode8.new(input[index5...@offset], index5, elements3)
        end
        if address0 == @@FAILURE
          @offset = index1
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_value : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:value]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:value] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(3)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read___
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        address2 = _read_object
        if address2 == @@FAILURE
          @offset = index2
          address2 = _read_array
          if address2 == @@FAILURE
            @offset = index2
            address2 = _read_string
            if address2 == @@FAILURE
              @offset = index2
              address2 = _read_number
              if address2 == @@FAILURE
                @offset = index2
                address2 = _read_boolean_
                if address2 == @@FAILURE
                  @offset = index2
                  address2 = _read_null_
                  if address2 == @@FAILURE
                    @offset = index2
                  end
                end
              end
            end
          end
        end
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address3 : Nil | TreeNode = @@FAILURE
          address3 = _read___
          if address3 != @@FAILURE
            elements0.insert(2, address3)
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
        address0 = TreeNode9.new(input[index1...@offset], index1, elements0)
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
          @expected << [ "CanopyJson::string", "'\"'" ]
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
              @expected << [ "CanopyJson::string", "\"\\\\\"" ]
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
                @expected << [ "CanopyJson::string", "<any char>" ]
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
            if chunk2 && @@REGEX_1 =~ chunk2
              address3 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address3 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyJson::string", "[^\"]" ]
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
              @expected << [ "CanopyJson::string", "'\"'" ]
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

  def _read_number : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:number]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:number] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(4)
      address1 : Nil | TreeNode = @@FAILURE
      index2 = @offset
      chunk0 = nil
      max0 = @offset + 1
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0 == "-"
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyJson::number", "\"-\"" ]
        end
      end
      if address1 == @@FAILURE
        address1 = TreeNode.new(input[index2...index2], index2, Array(TreeNode).new())
        @offset = index2
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index3 = @offset
        chunk1 = nil
        max1 = @offset + 1
        if max1 <= input_size
          chunk1 = input[@offset...max1]
        end
        if chunk1 && chunk1 == "0"
          address2 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address2 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "CanopyJson::number", "\"0\"" ]
          end
        end
        if address2 == @@FAILURE
          @offset = index3
          index4 = @offset
          elements1 = Array(TreeNode).new(2)
          address3 : Nil | TreeNode = @@FAILURE
          chunk2 = nil
          max2 = @offset + 1
          if max2 <= input_size
            chunk2 = input[@offset...max2]
          end
          if chunk2 && @@REGEX_2 =~ chunk2
            address3 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address3 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "CanopyJson::number", "[1-9]" ]
            end
          end
          if address3 != @@FAILURE
            elements1.insert(0, address3)
            address4 : Nil | TreeNode = @@FAILURE
            index5 = @offset
            elements2 = Array(TreeNode).new()
            address5 = nil
            while true
              chunk3 = nil
              max3 = @offset + 1
              if max3 <= input_size
                chunk3 = input[@offset...max3]
              end
              if chunk3 && @@REGEX_3 =~ chunk3
                address5 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                @offset = @offset + 1
              else
                address5 = @@FAILURE
                if @offset > @failure
                  @failure = @offset
                  @expected = Array(Array(String)).new
                end
                if @offset == @failure
                  @expected << [ "CanopyJson::number", "[0-9]" ]
                end
              end
              if address5 != @@FAILURE
                elements2 << address5
              else
                break
              end
            end
            if elements2.size >= 0
              address4 = TreeNode.new(input[index5...@offset], index5, elements2)
            else
              address4 = @@FAILURE
            end
            if address4 != @@FAILURE
              elements1.insert(1, address4)
            else
              elements1 = nil
              @offset = index4
            end
          else
            elements1 = nil
            @offset = index4
          end
          if elements1.nil?
            address2 = @@FAILURE
          else
            address2 = TreeNode.new(input[index4...@offset], index4, elements1)
          end
          if address2 == @@FAILURE
            @offset = index3
          end
        end
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address6 : Nil | TreeNode = @@FAILURE
          index6 = @offset
          index7 = @offset
          elements3 = Array(TreeNode).new(2)
          address7 : Nil | TreeNode = @@FAILURE
          chunk4 = nil
          max4 = @offset + 1
          if max4 <= input_size
            chunk4 = input[@offset...max4]
          end
          if chunk4 && chunk4 == "."
            address7 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address7 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "CanopyJson::number", "\".\"" ]
            end
          end
          if address7 != @@FAILURE
            elements3.insert(0, address7)
            address8 : Nil | TreeNode = @@FAILURE
            index8 = @offset
            elements4 = Array(TreeNode).new()
            address9 = nil
            while true
              chunk5 = nil
              max5 = @offset + 1
              if max5 <= input_size
                chunk5 = input[@offset...max5]
              end
              if chunk5 && @@REGEX_4 =~ chunk5
                address9 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                @offset = @offset + 1
              else
                address9 = @@FAILURE
                if @offset > @failure
                  @failure = @offset
                  @expected = Array(Array(String)).new
                end
                if @offset == @failure
                  @expected << [ "CanopyJson::number", "[0-9]" ]
                end
              end
              if address9 != @@FAILURE
                elements4 << address9
              else
                break
              end
            end
            if elements4.size >= 1
              address8 = TreeNode.new(input[index8...@offset], index8, elements4)
            else
              address8 = @@FAILURE
            end
            if address8 != @@FAILURE
              elements3.insert(1, address8)
            else
              elements3 = nil
              @offset = index7
            end
          else
            elements3 = nil
            @offset = index7
          end
          if elements3.nil?
            address6 = @@FAILURE
          else
            address6 = TreeNode.new(input[index7...@offset], index7, elements3)
          end
          if address6 == @@FAILURE
            address6 = TreeNode.new(input[index6...index6], index6, Array(TreeNode).new())
            @offset = index6
          end
          if address6 != @@FAILURE
            elements0.insert(2, address6)
            address10 : Nil | TreeNode = @@FAILURE
            index9 = @offset
            index10 = @offset
            elements5 = Array(TreeNode).new(3)
            address11 : Nil | TreeNode = @@FAILURE
            index11 = @offset
            chunk6 = nil
            max6 = @offset + 1
            if max6 <= input_size
              chunk6 = input[@offset...max6]
            end
            if chunk6 && chunk6 == "e"
              address11 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address11 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "CanopyJson::number", "\"e\"" ]
              end
            end
            if address11 == @@FAILURE
              @offset = index11
              chunk7 = nil
              max7 = @offset + 1
              if max7 <= input_size
                chunk7 = input[@offset...max7]
              end
              if chunk7 && chunk7 == "E"
                address11 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                @offset = @offset + 1
              else
                address11 = @@FAILURE
                if @offset > @failure
                  @failure = @offset
                  @expected = Array(Array(String)).new
                end
                if @offset == @failure
                  @expected << [ "CanopyJson::number", "\"E\"" ]
                end
              end
              if address11 == @@FAILURE
                @offset = index11
              end
            end
            if address11 != @@FAILURE
              elements5.insert(0, address11)
              address12 : Nil | TreeNode = @@FAILURE
              index12 = @offset
              chunk8 = nil
              max8 = @offset + 1
              if max8 <= input_size
                chunk8 = input[@offset...max8]
              end
              if chunk8 && chunk8 == "+"
                address12 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                @offset = @offset + 1
              else
                address12 = @@FAILURE
                if @offset > @failure
                  @failure = @offset
                  @expected = Array(Array(String)).new
                end
                if @offset == @failure
                  @expected << [ "CanopyJson::number", "\"+\"" ]
                end
              end
              if address12 == @@FAILURE
                @offset = index12
                chunk9 = nil
                max9 = @offset + 1
                if max9 <= input_size
                  chunk9 = input[@offset...max9]
                end
                if chunk9 && chunk9 == "-"
                  address12 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                  @offset = @offset + 1
                else
                  address12 = @@FAILURE
                  if @offset > @failure
                    @failure = @offset
                    @expected = Array(Array(String)).new
                  end
                  if @offset == @failure
                    @expected << [ "CanopyJson::number", "\"-\"" ]
                  end
                end
                if address12 == @@FAILURE
                  @offset = index12
                  chunk10 = nil
                  max10 = @offset + 0
                  if max10 <= input_size
                    chunk10 = input[@offset...max10]
                  end
                  if chunk10 && chunk10 == ""
                    address12 = TreeNode.new(input[@offset...@offset + 0], @offset, Array(TreeNode).new())
                    @offset = @offset + 0
                  else
                    address12 = @@FAILURE
                    if @offset > @failure
                      @failure = @offset
                      @expected = Array(Array(String)).new
                    end
                    if @offset == @failure
                      @expected << [ "CanopyJson::number", "\"\"" ]
                    end
                  end
                  if address12 == @@FAILURE
                    @offset = index12
                  end
                end
              end
              if address12 != @@FAILURE
                elements5.insert(1, address12)
                address13 : Nil | TreeNode = @@FAILURE
                index13 = @offset
                elements6 = Array(TreeNode).new()
                address14 = nil
                while true
                  chunk11 = nil
                  max11 = @offset + 1
                  if max11 <= input_size
                    chunk11 = input[@offset...max11]
                  end
                  if chunk11 && @@REGEX_5 =~ chunk11
                    address14 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                    @offset = @offset + 1
                  else
                    address14 = @@FAILURE
                    if @offset > @failure
                      @failure = @offset
                      @expected = Array(Array(String)).new
                    end
                    if @offset == @failure
                      @expected << [ "CanopyJson::number", "[0-9]" ]
                    end
                  end
                  if address14 != @@FAILURE
                    elements6 << address14
                  else
                    break
                  end
                end
                if elements6.size >= 1
                  address13 = TreeNode.new(input[index13...@offset], index13, elements6)
                else
                  address13 = @@FAILURE
                end
                if address13 != @@FAILURE
                  elements5.insert(2, address13)
                else
                  elements5 = nil
                  @offset = index10
                end
              else
                elements5 = nil
                @offset = index10
              end
            else
              elements5 = nil
              @offset = index10
            end
            if elements5.nil?
              address10 = @@FAILURE
            else
              address10 = TreeNode.new(input[index10...@offset], index10, elements5)
            end
            if address10 == @@FAILURE
              address10 = TreeNode.new(input[index9...index9], index9, Array(TreeNode).new())
              @offset = index9
            end
            if address10 != @@FAILURE
              elements0.insert(3, address10)
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
      max0 = @offset + 4
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0 == "true"
        address0 = TreeNode.new(input[@offset...@offset + 4], @offset, Array(TreeNode).new())
        @offset = @offset + 4
      else
        address0 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyJson::boolean_", "\"true\"" ]
        end
      end
      if address0 == @@FAILURE
        @offset = index1
        chunk1 = nil
        max1 = @offset + 5
        if max1 <= input_size
          chunk1 = input[@offset...max1]
        end
        if chunk1 && chunk1 == "false"
          address0 = TreeNode.new(input[@offset...@offset + 5], @offset, Array(TreeNode).new())
          @offset = @offset + 5
        else
          address0 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "CanopyJson::boolean_", "\"false\"" ]
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

  def _read_null_ : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:null_]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:null_] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      chunk0 = nil
      max0 = @offset + 4
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0 == "null"
        address0 = TreeNode.new(input[@offset...@offset + 4], @offset, Array(TreeNode).new())
        @offset = @offset + 4
      else
        address0 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "CanopyJson::null_", "\"null\"" ]
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read___ : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:__]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:__] = rule
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
        chunk0 = nil
        max0 = @offset + 1
        if max0 <= input_size
          chunk0 = input[@offset...max0]
        end
        if chunk0 && @@REGEX_6 =~ chunk0
          address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address1 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "CanopyJson::__", "[\\s]" ]
          end
        end
        if address1 != @@FAILURE
          elements0 << address1
        else
          break
        end
      end
      if elements0.size >= 0
        address0 = TreeNode.new(input[index1...@offset], index1, elements0)
      else
        address0 = @@FAILURE
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end
  end
