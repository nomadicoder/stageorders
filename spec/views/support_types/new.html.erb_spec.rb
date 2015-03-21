require 'rails_helper'

RSpec.describe "support_types/new", :type => :view do
  before(:each) do
    assign(:support_type, SupportType.new(
      :short_code => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new support_type form" do
    render

    assert_select "form[action=?][method=?]", support_types_path, "post" do

      assert_select "input#support_type_short_code[name=?]", "support_type[short_code]"

      assert_select "textarea#support_type_description[name=?]", "support_type[description]"
    end
  end
end
