require 'forwardable'
require_relative 'filter_node'

class Filter
  extend Forwardable
  def_delegator :@filter_node, :value
  attr_reader :key

  # Query.filter { status == 0 }
  # This is a context for that block evaluation
  def method_missing(key)
    raise RuntimeError.new("block should contain one comparison with a constant") unless @key.nil?

    @key = key
    @filter_node = FilterNode.new
  end
end
