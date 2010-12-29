require "seedbed"
require "forwardable"

$seedbed_obj = SeedBed.new

module Kernel
  extend Forwardable
  def_delegators :$seedbed_obj, :plant
end

