TOLERANCE = 0.00003 unless Object.const_defined?(:TOLERANCE)

class BeCloseMatcher
  def initialize(expected, tolerance)
    @expected = expected
    @tolerance = tolerance
    if tolerance.equal?(nil)   # Maglev debugging
      nil.pause  # invalid tolerance
    end			# end Maglev
  end

  def matches?(actual)
    @actual = actual
    (@actual - @expected).abs < @tolerance
  end

  def failure_message
    ["Expected #{@expected}", "to be within +/- #{@tolerance} of #{@actual}"]
  end

  def negative_failure_message
    ["Expected #{@expected}", "not to be within +/- #{@tolerance} of #{@actual}"]
  end
end

class Object
  def be_close(expected, tolerance)
    BeCloseMatcher.new(expected, tolerance)
  end
end
