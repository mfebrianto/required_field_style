module RequiredFieldStyle
  class Configuration
    attr_accessor :css_class_name

    def initialize
      @css_class_name = ''
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end
end
