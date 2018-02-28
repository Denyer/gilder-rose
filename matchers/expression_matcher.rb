# matches an item using an expression
class ExpressionMatcher

  def initialize(closure)
    @closure = closure
  end

  def matches?(item)
    @closure.call(item)
  end
end