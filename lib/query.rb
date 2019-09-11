require_relative 'filter'
require 'json'

class Query
  %i[filter from sort size].each do |m|
    define_singleton_method m do |*args, &blk|
      new.public_send(m, *args, &blk)
    end
  end

  def initialize(data = {})
    @data = data
  end

  def to_h
    result = {}
    result[:query] = @query.dup if @query
    result[:sort] = @sort.dup if @sort
    result[:size] = @size.dup if @size
    result[:from] = @from.dup if @from
    result
  end

  def to_json
    to_h.to_json
  end

  def filter(&blk)
    return self if blk.nil?

    filter = Filter.new
    filter.instance_eval(&blk)

    @query ||= {}
    @query.merge!({filter.key => filter.value})

    self
  end

  def from(x)
    @from = x

    self
  end

  def size(x)
    @size = x

    self
  end

  def sort(*args, **opts)
    @sort ||= []

    if args
      args.each do |field|
        @sort.push({field => :asc})
      end
    end

    if opts
      opts.each do |(field, direction)|
        @sort.push({field => direction})
      end
    end

    self
  end
end
