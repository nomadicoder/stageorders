require 'rails_helper'

RSpec.describe "stages/index", :type => :view do
  before(:each) do
    assign(:stages, [
      Stage.create!(
        :number => 1,
        :landmark => "Landmark",
        :miles => 1.5,
        :difficulty => 2
      ),
      Stage.create!(
        :number => 1,
        :landmark => "Landmark",
        :miles => 1.5,
        :difficulty => 2
      )
    ])
  end

  it "renders a list of stages" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Landmark".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
