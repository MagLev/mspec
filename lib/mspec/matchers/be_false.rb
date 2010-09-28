class BeFalseMatcher
  def does_not_match(actual)
    self.matches?(actual).not
  end
  def matches?(actual)
    @actual = actual
    @actual == false
  end

  def failure_message
    ["Expected #{@actual.inspect}", "to be false"]
  end
  
  def negative_failure_message
    ["Expected #{@actual.inspect}", "not to be false"]
  end
end

class Object
  def be_false
    BeFalseMatcher.new
  end
end
