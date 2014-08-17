require "required_field_style/version"
require "validation_reflection"

module RequiredFieldStyle
  class ActionView::Helpers::FormBuilder
    alias :orig_label :label

    # add a '*' after the field label if the field is required
    def label(method, content_or_options = nil, options = nil, &block)
      if content_or_options && content_or_options.class == Hash
        options = content_or_options
      else
        content = content_or_options
      end

      required_mark = ''
      required_mark = '<sup style="color:red">&nbsp;*</sup>'.html_safe if ValidationChecker.mandatory_field?(object.class, method)

      content ||= method.to_s.humanize
      content = content + required_mark

      self.orig_label(method, content, options || {}, &block)
    end
  end

  class ValidationChecker
    def self.mandatory_field?(klass, name)
      klass.reflect_on_validations_for(name).find { |f| f.macro.to_s == 'validates_presence_of' }
    end
  end

end
