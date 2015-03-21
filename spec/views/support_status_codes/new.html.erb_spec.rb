require 'rails_helper'

RSpec.describe "support_status_codes/new", :type => :view do
  before(:each) do
    assign(:support_status_code, SupportStatusCode.new(
      :sequence => 1.5,
      :short_code => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new support_status_code form" do
    render

    assert_select "form[action=?][method=?]", support_status_codes_path, "post" do

      assert_select "input#support_status_code_sequence[name=?]", "support_status_code[sequence]"

      assert_select "input#support_status_code_short_code[name=?]", "support_status_code[short_code]"

      assert_select "textarea#support_status_code_description[name=?]", "support_status_code[description]"
    end
  end
end
