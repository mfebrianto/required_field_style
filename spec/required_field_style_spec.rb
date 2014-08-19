require 'spec_helper'

module RequiredFieldStyle

  describe '/accounts/new.html.erb', :type => :view do
    context 'with configuration' do
      before{
        @configured_class = 'required_field_style'
        RequiredFieldStyle.configure do |config|
          config.css_class_name = @configured_class
        end
      }

      it 'should set configured_class for required field' do
        required_field = 'Account no'
        assigns[:account] = Account.new
        render
        response.body.to_s.should =~ /class=\"#{@configured_class}\" for=\"account_account_no\">#{required_field}/
      end
    end

    context 'no configuration' do
      before{
        RequiredFieldStyle.configure do |config|
          config.css_class_name = ''
        end
      }

      it 'should render red_asterisk for required field' do
        required_field = 'Account no'
        red_asterisk = '<sup style=\"color:red\">&nbsp;*'
        assigns[:account] = Account.new
        render
        response.body.to_s.should =~ /#{required_field}#{red_asterisk}/
      end
    end
  end

  describe 'ValidationChecker' do
    it 'should return MacroReflection if field_name is mandatory fields' do
      field_name = :account_no
      result = ValidationChecker.mandatory_field?(Account, field_name)
      result.instance_of?(ActiveRecord::Reflection::MacroReflection).should be true
      result.macro.should == :validates_presence_of
      result.name.should == field_name
    end

    it 'should return nil if field_name is not mandatory fields' do
      field_name = :company_name
      result = ValidationChecker.mandatory_field?(Account, field_name)
      result.should be nil
    end
  end

end