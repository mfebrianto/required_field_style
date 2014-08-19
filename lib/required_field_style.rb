require "required_field_style/version"
require "required_field_style/configuration"
require "required_field_style/validation_checker"
require "validation_reflection"

module RequiredFieldStyle
  class ActionView::Helpers::FormBuilder
    alias :orig_label :label

    # add a '*' after the field label if the field is required and no configuration
    def label(method, content_or_options = nil, options = nil, &block)
      if content_or_options && content_or_options.class == Hash
        options = content_or_options
      else
        content = content_or_options
      end

      if ValidationChecker.mandatory_field?(object.class, method)
        if RequiredFieldStyle.configuration.css_class_name.blank?
          content ||= method.to_s.humanize
          content = content + '<sup style="color:red">&nbsp;*</sup>'.html_safe
        else
          options = {:class => RequiredFieldStyle.configuration.css_class_name}
        end
      end

      self.orig_label(method, content, options || {}, &block)
    end
  end
end
