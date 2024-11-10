# This file was generated from examples/canopy/peg.peg
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
  @@REGEX_2 = /"\\A[^']"/
  @@REGEX_3 = /"\\A[^`]"/
  @@REGEX_4 = /"\\A[^\\]]"/
  @@REGEX_5 = /"\\A[a-zA-Z_]"/
  @@REGEX_6 = /"\\A[a-zA-Z0-9_]"/
  @@REGEX_7 = /"\\A[\\s]"/
  @@REGEX_8 = /"\\A[^\\n]"/

  def _read_grammar : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:grammar]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:grammar] = rule
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
      elements1 = Array(TreeNode).new()
      address2 = nil
      while true
        address2 = _read___
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
        address3 = _read_grammar_name
        if address3 != @@FAILURE
          elements0.insert(1, address3)
          address4 : Nil | TreeNode = @@FAILURE
          index3 = @offset
          elements2 = Array(TreeNode).new()
          address5 = nil
          while true
            index4 = @offset
            elements3 = Array(TreeNode).new(2)
            address6 : Nil | TreeNode = @@FAILURE
            index5 = @offset
            elements4 = Array(TreeNode).new()
            address7 = nil
            while true
              address7 = _read___
              if address7 != @@FAILURE
                elements4 << address7
              else
                break
              end
            end
            if elements4.size >= 0
              address6 = TreeNode.new(input[index5...@offset], index5, elements4)
            else
              address6 = @@FAILURE
            end
            if address6 != @@FAILURE
              elements3.insert(0, address6)
              address8 : Nil | TreeNode = @@FAILURE
              address8 = _read_grammar_rule
              if address8 != @@FAILURE
                elements3.insert(1, address8)
              else
                elements3 = nil
                @offset = index4
              end
            else
              elements3 = nil
              @offset = index4
            end
            if elements3.nil?
              address5 = @@FAILURE
            else
              address5 = TreeNode2.new(input[index4...@offset], index4, elements3)
            end
            if address5 != @@FAILURE
              elements2 << address5
            else
              break
            end
          end
          if elements2.size >= 1
            address4 = TreeNode.new(input[index3...@offset], index3, elements2)
          else
            address4 = @@FAILURE
          end
          if address4 != @@FAILURE
            elements0.insert(2, address4)
            address9 : Nil | TreeNode = @@FAILURE
            index6 = @offset
            elements5 = Array(TreeNode).new()
            address10 = nil
            while true
              address10 = _read___
              if address10 != @@FAILURE
                elements5 << address10
              else
                break
              end
            end
            if elements5.size >= 0
              address9 = TreeNode.new(input[index6...@offset], index6, elements5)
            else
              address9 = @@FAILURE
            end
            if address9 != @@FAILURE
              elements0.insert(3, address9)
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
        address0 = TreeNode1.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_grammar_name : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:grammar_name]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:grammar_name] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(4)
      address1 : Nil | TreeNode = @@FAILURE
      chunk0 = nil
      max0 = @offset + 7
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0.downcase == "grammar".downcase)
        address1 = TreeNode.new(input[@offset...@offset + 7], @offset, Array(TreeNode).new())
        @offset = @offset + 7
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "Canopy.PEG::grammar_name", "`grammar`" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        chunk1 = nil
        max1 = @offset + 1
        if max1 <= input_size
          chunk1 = input[@offset...max1]
        end
        if chunk1 && chunk1 == ":"
          address2 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address2 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "Canopy.PEG::grammar_name", "\":\"" ]
          end
        end
        if address2 == @@FAILURE
          address2 = TreeNode.new(input[index2...index2], index2, Array(TreeNode).new())
          @offset = index2
        end
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address3 : Nil | TreeNode = @@FAILURE
          index3 = @offset
          elements1 = Array(TreeNode).new()
          address4 = nil
          while true
            address4 = _read___
            if address4 != @@FAILURE
              elements1 << address4
            else
              break
            end
          end
          if elements1.size >= 1
            address3 = TreeNode.new(input[index3...@offset], index3, elements1)
          else
            address3 = @@FAILURE
          end
          if address3 != @@FAILURE
            elements0.insert(2, address3)
            address5 : Nil | TreeNode = @@FAILURE
            address5 = _read_object_identifier
            if address5 != @@FAILURE
              elements0.insert(3, address5)
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
        address0 = TreeNode3.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_grammar_rule : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:grammar_rule]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:grammar_rule] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(3)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read_identifier
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        address2 = _read_assignment
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address3 : Nil | TreeNode = @@FAILURE
          address3 = _read_parsing_expression
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
        address0 = TreeNode4.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_assignment : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:assignment]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:assignment] = rule
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
        address2 = _read___
        if address2 != @@FAILURE
          elements1 << address2
        else
          break
        end
      end
      if elements1.size >= 1
        address1 = TreeNode.new(input[index2...@offset], index2, elements1)
      else
        address1 = @@FAILURE
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address3 : Nil | TreeNode = @@FAILURE
        chunk0 = nil
        max0 = @offset + 2
        if max0 <= input_size
          chunk0 = input[@offset...max0]
        end
        if chunk0 && chunk0 == "<-"
          address3 = TreeNode.new(input[@offset...@offset + 2], @offset, Array(TreeNode).new())
          @offset = @offset + 2
        else
          address3 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "Canopy.PEG::assignment", "\"<-\"" ]
          end
        end
        if address3 != @@FAILURE
          elements0.insert(1, address3)
          address4 : Nil | TreeNode = @@FAILURE
          index3 = @offset
          elements2 = Array(TreeNode).new()
          address5 = nil
          while true
            address5 = _read___
            if address5 != @@FAILURE
              elements2 << address5
            else
              break
            end
          end
          if elements2.size >= 1
            address4 = TreeNode.new(input[index3...@offset], index3, elements2)
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
        address0 = TreeNode.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_parsing_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:parsing_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:parsing_expression] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      address0 = _read_choice_expression
      if address0 == @@FAILURE
        @offset = index1
        address0 = _read_choice_part
        if address0 == @@FAILURE
          @offset = index1
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_parenthesised_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:parenthesised_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:parenthesised_expression] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(5)
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
          @expected << [ "Canopy.PEG::parenthesised_expression", "\"(\"" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        elements1 = Array(TreeNode).new()
        address3 = nil
        while true
          address3 = _read___
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
          address4 : Nil | TreeNode = @@FAILURE
          address4 = _read_parsing_expression
          if address4 != @@FAILURE
            elements0.insert(2, address4)
            address5 : Nil | TreeNode = @@FAILURE
            index3 = @offset
            elements2 = Array(TreeNode).new()
            address6 = nil
            while true
              address6 = _read___
              if address6 != @@FAILURE
                elements2 << address6
              else
                break
              end
            end
            if elements2.size >= 0
              address5 = TreeNode.new(input[index3...@offset], index3, elements2)
            else
              address5 = @@FAILURE
            end
            if address5 != @@FAILURE
              elements0.insert(3, address5)
              address7 : Nil | TreeNode = @@FAILURE
              chunk1 = nil
              max1 = @offset + 1
              if max1 <= input_size
                chunk1 = input[@offset...max1]
              end
              if chunk1 && chunk1 == ")"
                address7 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                @offset = @offset + 1
              else
                address7 = @@FAILURE
                if @offset > @failure
                  @failure = @offset
                  @expected = Array(Array(String)).new
                end
                if @offset == @failure
                  @expected << [ "Canopy.PEG::parenthesised_expression", "\")\"" ]
                end
              end
              if address7 != @@FAILURE
                elements0.insert(4, address7)
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

  def _read_choice_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:choice_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:choice_expression] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read_choice_part
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        elements1 = Array(TreeNode).new()
        address3 = nil
        while true
          index3 = @offset
          elements2 = Array(TreeNode).new(4)
          address4 : Nil | TreeNode = @@FAILURE
          index4 = @offset
          elements3 = Array(TreeNode).new()
          address5 = nil
          while true
            address5 = _read___
            if address5 != @@FAILURE
              elements3 << address5
            else
              break
            end
          end
          if elements3.size >= 1
            address4 = TreeNode.new(input[index4...@offset], index4, elements3)
          else
            address4 = @@FAILURE
          end
          if address4 != @@FAILURE
            elements2.insert(0, address4)
            address6 : Nil | TreeNode = @@FAILURE
            chunk0 = nil
            max0 = @offset + 1
            if max0 <= input_size
              chunk0 = input[@offset...max0]
            end
            if chunk0 && chunk0 == "/"
              address6 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address6 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "Canopy.PEG::choice_expression", "\"/\"" ]
              end
            end
            if address6 != @@FAILURE
              elements2.insert(1, address6)
              address7 : Nil | TreeNode = @@FAILURE
              index5 = @offset
              elements4 = Array(TreeNode).new()
              address8 = nil
              while true
                address8 = _read___
                if address8 != @@FAILURE
                  elements4 << address8
                else
                  break
                end
              end
              if elements4.size >= 1
                address7 = TreeNode.new(input[index5...@offset], index5, elements4)
              else
                address7 = @@FAILURE
              end
              if address7 != @@FAILURE
                elements2.insert(2, address7)
                address9 : Nil | TreeNode = @@FAILURE
                address9 = _read_choice_part
                if address9 != @@FAILURE
                  elements2.insert(3, address9)
                else
                  elements2 = nil
                  @offset = index3
                end
              else
                elements2 = nil
                @offset = index3
              end
            else
              elements2 = nil
              @offset = index3
            end
          else
            elements2 = nil
            @offset = index3
          end
          if elements2.nil?
            address3 = @@FAILURE
          else
            address3 = TreeNode7.new(input[index3...@offset], index3, elements2)
          end
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
        address0 = TreeNode6.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_choice_part : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:choice_part]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:choice_part] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      index2 = @offset
      address1 = _read_action_expression
      if address1 == @@FAILURE
        @offset = index2
        address1 = _read_sequence_expression
        if address1 == @@FAILURE
          @offset = index2
          address1 = _read_sequence_part
          if address1 == @@FAILURE
            @offset = index2
          end
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index3 = @offset
        index4 = @offset
        elements1 = Array(TreeNode).new(2)
        address3 : Nil | TreeNode = @@FAILURE
        index5 = @offset
        elements2 = Array(TreeNode).new()
        address4 = nil
        while true
          address4 = _read___
          if address4 != @@FAILURE
            elements2 << address4
          else
            break
          end
        end
        if elements2.size >= 1
          address3 = TreeNode.new(input[index5...@offset], index5, elements2)
        else
          address3 = @@FAILURE
        end
        if address3 != @@FAILURE
          elements1.insert(0, address3)
          address5 : Nil | TreeNode = @@FAILURE
          address5 = _read_type_tag
          if address5 != @@FAILURE
            elements1.insert(1, address5)
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
          address2 = TreeNode8.new(input[index4...@offset], index4, elements1)
        end
        if address2 == @@FAILURE
          address2 = TreeNode.new(input[index3...index3], index3, Array(TreeNode).new())
          @offset = index3
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

  def _read_action_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:action_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:action_expression] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(3)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read_actionable_expression
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        elements1 = Array(TreeNode).new()
        address3 = nil
        while true
          address3 = _read___
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
          address4 = _read_action_tag
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
        address0 = TreeNode9.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_actionable_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:actionable_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:actionable_expression] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      index2 = @offset
      elements0 = Array(TreeNode).new(5)
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
          @expected << [ "Canopy.PEG::actionable_expression", "\"(\"" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index3 = @offset
        elements1 = Array(TreeNode).new()
        address3 = nil
        while true
          address3 = _read___
          if address3 != @@FAILURE
            elements1 << address3
          else
            break
          end
        end
        if elements1.size >= 0
          address2 = TreeNode.new(input[index3...@offset], index3, elements1)
        else
          address2 = @@FAILURE
        end
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address4 : Nil | TreeNode = @@FAILURE
          address4 = _read_actionable_expression
          if address4 != @@FAILURE
            elements0.insert(2, address4)
            address5 : Nil | TreeNode = @@FAILURE
            index4 = @offset
            elements2 = Array(TreeNode).new()
            address6 = nil
            while true
              address6 = _read___
              if address6 != @@FAILURE
                elements2 << address6
              else
                break
              end
            end
            if elements2.size >= 0
              address5 = TreeNode.new(input[index4...@offset], index4, elements2)
            else
              address5 = @@FAILURE
            end
            if address5 != @@FAILURE
              elements0.insert(3, address5)
              address7 : Nil | TreeNode = @@FAILURE
              chunk1 = nil
              max1 = @offset + 1
              if max1 <= input_size
                chunk1 = input[@offset...max1]
              end
              if chunk1 && chunk1 == ")"
                address7 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                @offset = @offset + 1
              else
                address7 = @@FAILURE
                if @offset > @failure
                  @failure = @offset
                  @expected = Array(Array(String)).new
                end
                if @offset == @failure
                  @expected << [ "Canopy.PEG::actionable_expression", "\")\"" ]
                end
              end
              if address7 != @@FAILURE
                elements0.insert(4, address7)
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
      else
        elements0 = nil
        @offset = index2
      end
      if elements0.nil?
        address0 = @@FAILURE
      else
        address0 = TreeNode10.new(input[index2...@offset], index2, elements0)
      end
      if address0 == @@FAILURE
        @offset = index1
        address0 = _read_sequence_expression
        if address0 == @@FAILURE
          @offset = index1
          address0 = _read_repeated_atom
          if address0 == @@FAILURE
            @offset = index1
            address0 = _read_terminal_node
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

  def _read_action_tag : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:action_tag]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:action_tag] = rule
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
      if chunk0 && chunk0 == "%"
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "Canopy.PEG::action_tag", "\"%\"" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        address2 = _read_identifier
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
        address0 = TreeNode11.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_type_tag : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:type_tag]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:type_tag] = rule
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
      if chunk0 && chunk0 == "<"
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "Canopy.PEG::type_tag", "\"<\"" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        address2 = _read_object_identifier
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address3 : Nil | TreeNode = @@FAILURE
          chunk1 = nil
          max1 = @offset + 1
          if max1 <= input_size
            chunk1 = input[@offset...max1]
          end
          if chunk1 && chunk1 == ">"
            address3 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address3 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "Canopy.PEG::type_tag", "\">\"" ]
            end
          end
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
        address0 = TreeNode12.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_sequence_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:sequence_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:sequence_expression] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read_sequence_part
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        elements1 = Array(TreeNode).new()
        address3 = nil
        while true
          index3 = @offset
          elements2 = Array(TreeNode).new(2)
          address4 : Nil | TreeNode = @@FAILURE
          index4 = @offset
          elements3 = Array(TreeNode).new()
          address5 = nil
          while true
            address5 = _read___
            if address5 != @@FAILURE
              elements3 << address5
            else
              break
            end
          end
          if elements3.size >= 1
            address4 = TreeNode.new(input[index4...@offset], index4, elements3)
          else
            address4 = @@FAILURE
          end
          if address4 != @@FAILURE
            elements2.insert(0, address4)
            address6 : Nil | TreeNode = @@FAILURE
            address6 = _read_sequence_part
            if address6 != @@FAILURE
              elements2.insert(1, address6)
            else
              elements2 = nil
              @offset = index3
            end
          else
            elements2 = nil
            @offset = index3
          end
          if elements2.nil?
            address3 = @@FAILURE
          else
            address3 = TreeNode14.new(input[index3...@offset], index3, elements2)
          end
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
        address0 = TreeNode13.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_sequence_part : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:sequence_part]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:sequence_part] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      index2 = @offset
      address1 = _read_label
      if address1 == @@FAILURE
        address1 = TreeNode.new(input[index2...index2], index2, Array(TreeNode).new())
        @offset = index2
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index3 = @offset
        address2 = _read_maybe_atom
        if address2 == @@FAILURE
          @offset = index3
          address2 = _read_repeated_atom
          if address2 == @@FAILURE
            @offset = index3
            address2 = _read_atom
            if address2 == @@FAILURE
              @offset = index3
            end
          end
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
        address0 = TreeNode15.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_maybe_atom : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:maybe_atom]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:maybe_atom] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read_atom
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        chunk0 = nil
        max0 = @offset + 1
        if max0 <= input_size
          chunk0 = input[@offset...max0]
        end
        if chunk0 && chunk0 == "?"
          address2 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address2 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "Canopy.PEG::maybe_atom", "\"?\"" ]
          end
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
        address0 = TreeNode16.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_repeated_atom : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:repeated_atom]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:repeated_atom] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read_atom
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        chunk0 = nil
        max0 = @offset + 1
        if max0 <= input_size
          chunk0 = input[@offset...max0]
        end
        if chunk0 && chunk0 == "*"
          address2 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address2 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "Canopy.PEG::repeated_atom", "\"*\"" ]
          end
        end
        if address2 == @@FAILURE
          @offset = index2
          chunk1 = nil
          max1 = @offset + 1
          if max1 <= input_size
            chunk1 = input[@offset...max1]
          end
          if chunk1 && chunk1 == "+"
            address2 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address2 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "Canopy.PEG::repeated_atom", "\"+\"" ]
            end
          end
          if address2 == @@FAILURE
            @offset = index2
          end
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
        address0 = TreeNode17.new(input[index1...@offset], index1, elements0)
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
      address0 = _read_parenthesised_expression
      if address0 == @@FAILURE
        @offset = index1
        address0 = _read_predicated_atom
        if address0 == @@FAILURE
          @offset = index1
          address0 = _read_reference_expression
          if address0 == @@FAILURE
            @offset = index1
            address0 = _read_terminal_node
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

  def _read_terminal_node : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:terminal_node]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:terminal_node] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      address0 = _read_string_expression
      if address0 == @@FAILURE
        @offset = index1
        address0 = _read_ci_string_expression
        if address0 == @@FAILURE
          @offset = index1
          address0 = _read_char_class_expression
          if address0 == @@FAILURE
            @offset = index1
            address0 = _read_any_char_expression
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

  def _read_predicated_atom : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:predicated_atom]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:predicated_atom] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      index2 = @offset
      chunk0 = nil
      max0 = @offset + 1
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && chunk0 == "&"
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "Canopy.PEG::predicated_atom", "\"&\"" ]
        end
      end
      if address1 == @@FAILURE
        @offset = index2
        chunk1 = nil
        max1 = @offset + 1
        if max1 <= input_size
          chunk1 = input[@offset...max1]
        end
        if chunk1 && chunk1 == "!"
          address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address1 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "Canopy.PEG::predicated_atom", "\"!\"" ]
          end
        end
        if address1 == @@FAILURE
          @offset = index2
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        address2 = _read_atom
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
        address0 = TreeNode18.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_reference_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:reference_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:reference_expression] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read_identifier
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        address2 = _read_assignment
        @offset = index2
        if address2 == @@FAILURE
          address2 = TreeNode.new(input[@offset...@offset], @offset, Array(TreeNode).new())
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
        address0 = TreeNode19.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_string_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:string_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:string_expression] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      index2 = @offset
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
          @expected << [ "Canopy.PEG::string_expression", "'\"'" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index3 = @offset
        elements1 = Array(TreeNode).new()
        address3 = nil
        while true
          index4 = @offset
          index5 = @offset
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
              @expected << [ "Canopy.PEG::string_expression", "\"\\\\\"" ]
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
                @expected << [ "Canopy.PEG::string_expression", "<any char>" ]
              end
            end
            if address5 != @@FAILURE
              elements2.insert(1, address5)
            else
              elements2 = nil
              @offset = index5
            end
          else
            elements2 = nil
            @offset = index5
          end
          if elements2.nil?
            address3 = @@FAILURE
          else
            address3 = TreeNode.new(input[index5...@offset], index5, elements2)
          end
          if address3 == @@FAILURE
            @offset = index4
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
                @expected << [ "Canopy.PEG::string_expression", "[^\"]" ]
              end
            end
            if address3 == @@FAILURE
              @offset = index4
            end
          end
          if address3 != @@FAILURE
            elements1 << address3
          else
            break
          end
        end
        if elements1.size >= 0
          address2 = TreeNode.new(input[index3...@offset], index3, elements1)
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
              @expected << [ "Canopy.PEG::string_expression", "'\"'" ]
            end
          end
          if address6 != @@FAILURE
            elements0.insert(2, address6)
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
        address0 = TreeNode.new(input[index2...@offset], index2, elements0)
      end
      if address0 == @@FAILURE
        @offset = index1
        index6 = @offset
        elements3 = Array(TreeNode).new(3)
        address7 : Nil | TreeNode = @@FAILURE
        chunk4 = nil
        max4 = @offset + 1
        if max4 <= input_size
          chunk4 = input[@offset...max4]
        end
        if chunk4 && chunk4 == "'"
          address7 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address7 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "Canopy.PEG::string_expression", "\"'\"" ]
          end
        end
        if address7 != @@FAILURE
          elements3.insert(0, address7)
          address8 : Nil | TreeNode = @@FAILURE
          index7 = @offset
          elements4 = Array(TreeNode).new()
          address9 = nil
          while true
            index8 = @offset
            index9 = @offset
            elements5 = Array(TreeNode).new(2)
            address10 : Nil | TreeNode = @@FAILURE
            chunk5 = nil
            max5 = @offset + 1
            if max5 <= input_size
              chunk5 = input[@offset...max5]
            end
            if chunk5 && chunk5 == "\\"
              address10 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address10 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "Canopy.PEG::string_expression", "\"\\\\\"" ]
              end
            end
            if address10 != @@FAILURE
              elements5.insert(0, address10)
              address11 : Nil | TreeNode = @@FAILURE
              if @offset < input_size
                address11 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                @offset = @offset + 1
              else
                address11 = @@FAILURE
                if @offset > @failure
                  @failure = @offset
                  @expected = Array(Array(String)).new
                end
                if @offset == @failure
                  @expected << [ "Canopy.PEG::string_expression", "<any char>" ]
                end
              end
              if address11 != @@FAILURE
                elements5.insert(1, address11)
              else
                elements5 = nil
                @offset = index9
              end
            else
              elements5 = nil
              @offset = index9
            end
            if elements5.nil?
              address9 = @@FAILURE
            else
              address9 = TreeNode.new(input[index9...@offset], index9, elements5)
            end
            if address9 == @@FAILURE
              @offset = index8
              chunk6 = nil
              max6 = @offset + 1
              if max6 <= input_size
                chunk6 = input[@offset...max6]
              end
              if chunk6 && @@REGEX_2 =~ chunk6
                address9 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                @offset = @offset + 1
              else
                address9 = @@FAILURE
                if @offset > @failure
                  @failure = @offset
                  @expected = Array(Array(String)).new
                end
                if @offset == @failure
                  @expected << [ "Canopy.PEG::string_expression", "[^']" ]
                end
              end
              if address9 == @@FAILURE
                @offset = index8
              end
            end
            if address9 != @@FAILURE
              elements4 << address9
            else
              break
            end
          end
          if elements4.size >= 0
            address8 = TreeNode.new(input[index7...@offset], index7, elements4)
          else
            address8 = @@FAILURE
          end
          if address8 != @@FAILURE
            elements3.insert(1, address8)
            address12 : Nil | TreeNode = @@FAILURE
            chunk7 = nil
            max7 = @offset + 1
            if max7 <= input_size
              chunk7 = input[@offset...max7]
            end
            if chunk7 && chunk7 == "'"
              address12 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address12 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "Canopy.PEG::string_expression", "\"'\"" ]
              end
            end
            if address12 != @@FAILURE
              elements3.insert(2, address12)
            else
              elements3 = nil
              @offset = index6
            end
          else
            elements3 = nil
            @offset = index6
          end
        else
          elements3 = nil
          @offset = index6
        end
        if elements3.nil?
          address0 = @@FAILURE
        else
          address0 = TreeNode.new(input[index6...@offset], index6, elements3)
        end
        if address0 == @@FAILURE
          @offset = index1
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_ci_string_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:ci_string_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:ci_string_expression] = rule
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
      if chunk0 && chunk0 == "`"
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "Canopy.PEG::ci_string_expression", "\"`\"" ]
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
              @expected << [ "Canopy.PEG::ci_string_expression", "\"\\\\\"" ]
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
                @expected << [ "Canopy.PEG::ci_string_expression", "<any char>" ]
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
                @expected << [ "Canopy.PEG::ci_string_expression", "[^`]" ]
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
          if chunk3 && chunk3 == "`"
            address6 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address6 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "Canopy.PEG::ci_string_expression", "\"`\"" ]
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

  def _read_any_char_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:any_char_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:any_char_expression] = rule
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
      if chunk0 && chunk0 == "."
        address0 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address0 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "Canopy.PEG::any_char_expression", "\".\"" ]
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_char_class_expression : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:char_class_expression]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:char_class_expression] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
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
          @expected << [ "Canopy.PEG::char_class_expression", "\"[\"" ]
        end
      end
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        chunk1 = nil
        max1 = @offset + 1
        if max1 <= input_size
          chunk1 = input[@offset...max1]
        end
        if chunk1 && chunk1 == "^"
          address2 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address2 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "Canopy.PEG::char_class_expression", "\"^\"" ]
          end
        end
        if address2 == @@FAILURE
          address2 = TreeNode.new(input[index2...index2], index2, Array(TreeNode).new())
          @offset = index2
        end
        if address2 != @@FAILURE
          elements0.insert(1, address2)
          address3 : Nil | TreeNode = @@FAILURE
          index3 = @offset
          elements1 = Array(TreeNode).new()
          address4 = nil
          while true
            index4 = @offset
            index5 = @offset
            elements2 = Array(TreeNode).new(2)
            address5 : Nil | TreeNode = @@FAILURE
            chunk2 = nil
            max2 = @offset + 1
            if max2 <= input_size
              chunk2 = input[@offset...max2]
            end
            if chunk2 && chunk2 == "\\"
              address5 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address5 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "Canopy.PEG::char_class_expression", "\"\\\\\"" ]
              end
            end
            if address5 != @@FAILURE
              elements2.insert(0, address5)
              address6 : Nil | TreeNode = @@FAILURE
              if @offset < input_size
                address6 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                @offset = @offset + 1
              else
                address6 = @@FAILURE
                if @offset > @failure
                  @failure = @offset
                  @expected = Array(Array(String)).new
                end
                if @offset == @failure
                  @expected << [ "Canopy.PEG::char_class_expression", "<any char>" ]
                end
              end
              if address6 != @@FAILURE
                elements2.insert(1, address6)
              else
                elements2 = nil
                @offset = index5
              end
            else
              elements2 = nil
              @offset = index5
            end
            if elements2.nil?
              address4 = @@FAILURE
            else
              address4 = TreeNode.new(input[index5...@offset], index5, elements2)
            end
            if address4 == @@FAILURE
              @offset = index4
              chunk3 = nil
              max3 = @offset + 1
              if max3 <= input_size
                chunk3 = input[@offset...max3]
              end
              if chunk3 && @@REGEX_4 =~ chunk3
                address4 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
                @offset = @offset + 1
              else
                address4 = @@FAILURE
                if @offset > @failure
                  @failure = @offset
                  @expected = Array(Array(String)).new
                end
                if @offset == @failure
                  @expected << [ "Canopy.PEG::char_class_expression", "[^\\]]" ]
                end
              end
              if address4 == @@FAILURE
                @offset = index4
              end
            end
            if address4 != @@FAILURE
              elements1 << address4
            else
              break
            end
          end
          if elements1.size >= 1
            address3 = TreeNode.new(input[index3...@offset], index3, elements1)
          else
            address3 = @@FAILURE
          end
          if address3 != @@FAILURE
            elements0.insert(2, address3)
            address7 : Nil | TreeNode = @@FAILURE
            chunk4 = nil
            max4 = @offset + 1
            if max4 <= input_size
              chunk4 = input[@offset...max4]
            end
            if chunk4 && chunk4 == "]"
              address7 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
              @offset = @offset + 1
            else
              address7 = @@FAILURE
              if @offset > @failure
                @failure = @offset
                @expected = Array(Array(String)).new
              end
              if @offset == @failure
                @expected << [ "Canopy.PEG::char_class_expression", "\"]\"" ]
              end
            end
            if address7 != @@FAILURE
              elements0.insert(3, address7)
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

  def _read_label : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:label]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:label] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read_identifier
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        chunk0 = nil
        max0 = @offset + 1
        if max0 <= input_size
          chunk0 = input[@offset...max0]
        end
        if chunk0 && chunk0 == ":"
          address2 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
          @offset = @offset + 1
        else
          address2 = @@FAILURE
          if @offset > @failure
            @failure = @offset
            @expected = Array(Array(String)).new
          end
          if @offset == @failure
            @expected << [ "Canopy.PEG::label", "\":\"" ]
          end
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
        address0 = TreeNode20.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_object_identifier : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:object_identifier]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:object_identifier] = rule
    end
    if rule[@offset]?
      roffset = rule[@offset]
      address0 = roffset.node
      @offset = roffset.tail
    else
      index1 = @offset
      elements0 = Array(TreeNode).new(2)
      address1 : Nil | TreeNode = @@FAILURE
      address1 = _read_identifier
      if address1 != @@FAILURE
        elements0.insert(0, address1)
        address2 : Nil | TreeNode = @@FAILURE
        index2 = @offset
        elements1 = Array(TreeNode).new()
        address3 = nil
        while true
          index3 = @offset
          elements2 = Array(TreeNode).new(2)
          address4 : Nil | TreeNode = @@FAILURE
          chunk0 = nil
          max0 = @offset + 1
          if max0 <= input_size
            chunk0 = input[@offset...max0]
          end
          if chunk0 && chunk0 == "."
            address4 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address4 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "Canopy.PEG::object_identifier", "\".\"" ]
            end
          end
          if address4 != @@FAILURE
            elements2.insert(0, address4)
            address5 : Nil | TreeNode = @@FAILURE
            address5 = _read_identifier
            if address5 != @@FAILURE
              elements2.insert(1, address5)
            else
              elements2 = nil
              @offset = index3
            end
          else
            elements2 = nil
            @offset = index3
          end
          if elements2.nil?
            address3 = @@FAILURE
          else
            address3 = TreeNode22.new(input[index3...@offset], index3, elements2)
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
        address0 = TreeNode21.new(input[index1...@offset], index1, elements0)
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_identifier : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:identifier]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:identifier] = rule
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
      if chunk0 && @@REGEX_5 =~ chunk0
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "Canopy.PEG::identifier", "[a-zA-Z_]" ]
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
          if chunk1 && @@REGEX_6 =~ chunk1
            address3 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address3 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "Canopy.PEG::identifier", "[a-zA-Z0-9_]" ]
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
      chunk0 = nil
      max0 = @offset + 1
      if max0 <= input_size
        chunk0 = input[@offset...max0]
      end
      if chunk0 && @@REGEX_7 =~ chunk0
        address0 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address0 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "Canopy.PEG::__", "[\\s]" ]
        end
      end
      if address0 == @@FAILURE
        @offset = index1
        address0 = _read_comment
        if address0 == @@FAILURE
          @offset = index1
        end
      end
      rule[index0] = CacheRecord.new(address0, @offset)
    end
    return address0
  end

  def _read_comment : TreeNode
    address0 = @@FAILURE
    index0 = @offset
    rule = cache[:comment]?
    if rule.nil?
      rule = {} of Int32 => CacheRecord
      cache[:comment] = rule
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
      if chunk0 && chunk0 == "#"
        address1 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
        @offset = @offset + 1
      else
        address1 = @@FAILURE
        if @offset > @failure
          @failure = @offset
          @expected = Array(Array(String)).new
        end
        if @offset == @failure
          @expected << [ "Canopy.PEG::comment", "\"#\"" ]
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
          if chunk1 && @@REGEX_8 =~ chunk1
            address3 = TreeNode.new(input[@offset...@offset + 1], @offset, Array(TreeNode).new())
            @offset = @offset + 1
          else
            address3 = @@FAILURE
            if @offset > @failure
              @failure = @offset
              @expected = Array(Array(String)).new
            end
            if @offset == @failure
              @expected << [ "Canopy.PEG::comment", "[^\\n]" ]
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
  end
