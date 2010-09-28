require 'mspec/matchers/stringsymboladapter'

class MethodMatcher
  include StringSymbolAdapter

  def initialize(method, include_super=true)
    @include_super = include_super
    @method = convert_name method
  end

  def does_not_match(actual)
    self.matches?(actual).not
  end
  def matches?(mod)
    raise Exception, "define #matches? in the subclass"
  end
end
