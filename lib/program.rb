module Revolve
  class Program < Array
    attr_accessor :stack
    def initialize(*args)
      @stack = []
      block_given? ? super(*args) : super(args)
    end
    
    def self.randomized(length, instructions)
      self.new(length) { instructions[ rand(instructions.size) ] }
    end
    
    def run
      self.each do |intruction|
        if intruction.is_a?(Revolve::Method) && intruction.stack = stack          
          intruction.call! if intruction.callable?
        else
          stack.push intruction
        end
      end
      stack.last
    end
  end
end