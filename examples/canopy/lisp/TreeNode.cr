# This file was generated from examples/canopy/lisp.peg
# See https://canopy.jcoglan.com/ for documentation


class TreeNode
  include Enumerable(TreeNode)

  property text : String
  property offset : Int32
  property elements : Array(TreeNode) | Nil
  property labelled : Hash(Symbol, TreeNode)

  def initialize(text : String = "", offset : Int32 = -1, elements : Array(TreeNode) | Nil = Array(TreeNode).new(0))
    @text = text
    @offset = offset
    @elements = elements
    @labelled = Hash(Symbol, TreeNode).new
  end

  def [](key : Symbol) : TreeNode?
    @labelled[key]
  end

  def each(&block : TreeNode ->)
    @elements.each(&block)
  end
end

class TreeNode1 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:data] = elements[1]
  end
end

class TreeNode2 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:cells] = elements[1]
  end
end
