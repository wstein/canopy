# This file was generated from examples/canopy/peg.peg
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
    labelled[:grammar_name] = elements[1]
    labelled[:rules] = elements[2]
  end
end

class TreeNode2 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:grammar_rule] = elements[1]
  end
end

class TreeNode3 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:object_identifier] = elements[3]
  end
end

class TreeNode4 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:identifier] = elements[0]
    labelled[:assignment] = elements[1]
    labelled[:parsing_expression] = elements[2]
  end
end

class TreeNode5 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:parsing_expression] = elements[2]
  end
end

class TreeNode6 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:first_part] = elements[0]
    labelled[:choice_part] = elements[0]
    labelled[:rest] = elements[1]
  end
end

class TreeNode7 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:expression] = elements[3]
    labelled[:choice_part] = elements[3]
  end
end

class TreeNode8 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:type_tag] = elements[1]
  end
end

class TreeNode9 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:actionable_expression] = elements[0]
    labelled[:action_tag] = elements[2]
  end
end

class TreeNode10 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:actionable_expression] = elements[2]
  end
end

class TreeNode11 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:identifier] = elements[1]
  end
end

class TreeNode12 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:object_identifier] = elements[1]
  end
end

class TreeNode13 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:first_part] = elements[0]
    labelled[:sequence_part] = elements[0]
    labelled[:rest] = elements[1]
  end
end

class TreeNode14 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:expression] = elements[1]
    labelled[:sequence_part] = elements[1]
  end
end

class TreeNode15 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:expression] = elements[1]
  end
end

class TreeNode16 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:atom] = elements[0]
  end
end

class TreeNode17 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:atom] = elements[0]
    labelled[:quantifier] = elements[1]
  end
end

class TreeNode18 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:predicate] = elements[0]
    labelled[:atom] = elements[1]
  end
end

class TreeNode19 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:identifier] = elements[0]
  end
end

class TreeNode20 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:identifier] = elements[0]
  end
end

class TreeNode21 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:identifier] = elements[0]
  end
end

class TreeNode22 < TreeNode
  def initialize(text : String, @offset : Int32, elements : Array(TreeNode))
    super(text, @offset, elements)
    labelled[:identifier] = elements[1]
  end
end
