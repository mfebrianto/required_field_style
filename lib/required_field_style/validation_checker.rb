module RequiredFieldStyle
  class ValidationChecker
    def self.mandatory_field?(klass, name)
      klass.reflect_on_validations_for(name).find { |f| f.macro.to_s == 'validates_presence_of' }
    end
  end
end
