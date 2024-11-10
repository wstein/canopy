

require "./TreeNode"


class CacheRecord
  property node : TreeNode
  property tail : Int32

  def initialize(node : TreeNode, tail : Int32)
    @node = node
    @tail = tail
  end
end
