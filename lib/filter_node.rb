class FilterNode
  attr_reader :value
# define mothods ==, greater then >,  less then <
  def ==(other)
    @value = other
  end

  def >(other)
    @value = {gt: other}
  end

  def <(other)
    @value = {lt: other}
  end
end
