# This file was generated from examples/canopy/lisp.peg
# See https://canopy.jcoglan.com/ for documentation

class ParseError < Exception
  def initialize(message : String)
    super(message)
  end
end
