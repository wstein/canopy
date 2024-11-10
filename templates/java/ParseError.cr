class ParseError < Exception
  def initialize(message : String)
    super(message)
  end
end