# This file was generated from examples/canopy/json.peg
# See https://canopy.jcoglan.com/ for documentation

class ParseError < Exception
  def initialize(message : String)
    super(message)
  end
end
