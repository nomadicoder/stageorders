require 'rails_helper'

RSpec.describe "support_status_codes/edit", :type => :view do
  before(:each) do
    @support_status_code = assign(:support_status_code, SupportStatusCode.create!(
      :sequence => 1.5,
      :short_code => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit support_status_code form" do
    render

    assert_select "form[action=?][method=?]", support_status_code_path(@support_status_code), "post" do

      assert_select "input#support_status_code_sequence[name=?]", "support_status_code[sequence]"

      assert_select "input#support_status_code_short_code[name=?]", "support_status_code[short_code]"

      assert_select "textarea#support_status_code_description[name=?]", "support_status_code[description]"
    end
  end
end
