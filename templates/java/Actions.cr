
module Actions
{{#each actions}}
    def {{action.id}}(input : String, start : Int32, end_ : Int32, elements : Array(TreeNode)) : TreeNode
    end
{{/each}}
end