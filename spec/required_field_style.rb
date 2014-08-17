require 'spec_helper'

module RequiredFieldStyle

  describe '/accounts/new.html.erb', :type => :view do
    it 'should render mandatory style for required field' do
      required_field = 'Account no'
      mandatory_style = '<sup style=\"color:red\">&nbsp;*</sup>'
      assigns[:account] = Account.new
      render
      response.body.to_s =~ /#{required_field}#{mandatory_style}/
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