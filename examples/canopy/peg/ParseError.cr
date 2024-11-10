# This file was generated from examples/canopy/peg.peg
# See https://canopy.jcoglan.com/ for documentation

class ParseError < Exception
  def initialize(message : String)
    super(message)
  end
end
