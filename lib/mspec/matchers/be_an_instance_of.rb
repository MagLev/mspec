class BeAnInstanceOfMatcher
  def initialize(expected)
    @expected = expected
  end

  def does_not_match(actual)
    self.matches?(actual).not
  end

  def matches?(actual)
    @actual = actual
    # @actual.instance_of?(@expected)
    exp = @expected		# maglev changes
    if actual.instance_of?(exp) 
      return true
    end
    if exp._equal?(Enumerable::Enumerator) && actual._kind_of?(exp)
      return true # maglev Enumerator implementations
    end
    false 
  end

  def failure_message
    ["Expected #{@actual.inspect} (#{@actual.class})",
     "to be an instance of #{@expected}"]
  end

  def negative_failure_message
    ["Expected #{@actual.inspect} (#{@actual.class})",
     "not to be an instance of #{@expected}"]
  end
end

class Object
  def be_an_instance_of(expected)
    BeAnInstanceOfMatcher.new(expected)
  end
end
