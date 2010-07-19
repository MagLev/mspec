require 'iconv'
require 'mspec/expectations/expectations'
require 'mspec/utils/ruby_name'
require 'mspec/runner/formatters/yaml'

class JUnitFormatter < YamlFormatter
  LT= "&lt;"
  GT= "&gt;"

  def initialize(out=nil)
    super
    @tests = []
  end

  def after(state = nil)
    super
    @tests << {:test => state, :exception => false} unless exception?
  end

  def exception(exception)
    super
    @tests << {:test => exception, :exception => true}
  end

  def finish
    switch

    time = @timer.elapsed
    tests = @tally.counter.expectations
    errors = @tally.counter.errors
    failures = @tally.counter.failures

    printf <<-XML
    <?xml version="1.0" encoding="UTF-8" ?>
    <testsuites
        testCount="#{tests}"
        errorCount="#{errors}"
        failureCount="#{failures}"
        timeCount="#{time}" time="#{time}">
      <testsuite
          tests="#{tests}"
          errors="#{errors}"
          failures="#{failures}"
          time="#{time}"
          name="Spec Output For #{::RUBY_NAME} (#{::RUBY_VERSION})">
    XML
    @tests.each do |h|
      printf <<-XML, "Spec", h[:test].description, 0.0
        <testcase classname="%s" name="%s" time="%f">
      XML
      if h[:exception]
        outcome = h[:test].failure? ? "failure" : "error"
        print <<-XML
          <#{outcome} message="error in #{h[:test].description}" type="#{outcome}">
            #{Iconv.iconv("LATIN1", "UTF-8", h[:test].message).join.gsub("<", LT).gsub(">", GT)}
            #{Iconv.iconv("LATIN1", "UTF-8", h[:test].backtrace).join.gsub("<", LT).gsub(">", GT)}
          </#{outcome}>
        XML
      end
      print <<-XML
        </testcase>
      XML
    end

    print <<-XML
      </testsuite>
    </testsuites>
    XML
  end
end
