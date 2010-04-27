class SpecPositiveOperatorMatcher
  def initialize(actual)
    @actual = actual
  end

  def ==(expected)
    unless @actual == expected
      actual_ = @actual  # Maglev, local var for easier debugging , and regular inspect
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "to equal #{expected.inspect}")
    end
  end

  def <(expected)
    unless @actual < expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "to be less than #{expected.inspect}")
    end
  end

  def <=(expected)
    unless @actual <= expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "to be less than or equal to #{expected.inspect}")
    end
  end

  def >(expected)
    unless @actual > expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "to be greater than #{expected.inspect}")
    end
  end

  def >=(expected)
    unless @actual >= expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "to be greater than or equal to #{expected.inspect}")
    end
  end

  def =~(expected)
    unless @actual =~ expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "to match #{expected.inspect}")
    end
  end
end

class SpecNegativeOperatorMatcher
  def initialize(actual)
    @actual = actual
  end

  def ==(expected)
    if @actual == expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "not to equal #{expected.inspect}")
    end
  end

  def <(expected)
    if @actual < expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "not to be less than #{expected.inspect}")
    end
  end

  def <=(expected)
    if @actual <= expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "not to be less than or equal to #{expected.inspect}")
    end
  end

  def >(expected)
    if @actual > expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "not to be greater than #{expected.inspect}")
    end
  end

  def >=(expected)
    if @actual >= expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "not to be greater than or equal to #{expected.inspect}")
    end
  end

  def =~(expected)
    if @actual =~ expected
      actual_ = @actual  # Maglev, local var for easier debugging
      SpecExpectation.fail_with("Expected #{@actual.inspect}",
                            "not to match #{expected.inspect}")
    end
  end
end
