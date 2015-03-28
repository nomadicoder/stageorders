require 'rails_helper'

RSpec.describe "support_types/edit", :type => :view do
  before(:each) do
    @support_type = assign(:support_type, SupportType.create!(
      :short_code => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit support_type form" do
    render

    assert_select "form[action=?][method=?]", support_type_path(@support_type), "post" do

      assert_select "input#support_type_short_code[name=?]", "support_type[short_code]"

      assert_select "textarea#support_type_description[name=?]", "support_type[description]"
    end
  end
end
