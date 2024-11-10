
class {{name}}
  include Enumerable({{name}})

  property text : String
  property offset : Int32
  property elements : Array({{name}}) | Nil
  property labelled : Hash(Symbol, {{name}})

  def initialize(text : String = "", offset : Int32 = -1, elements : Array({{name}}) | Nil = Array({{name}}).new(0))
    @text = text
    @offset = offset
    @elements = elements
    @labelled = Hash(Symbol, {{name}}).new
  end

  def [](key : Symbol) : {{name}}?
    @labelled[key]
  end

  def each(&block : {{name}} ->)
    @elements.each(&block)
  end
end

 