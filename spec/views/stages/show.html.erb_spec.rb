require 'rails_helper'

RSpec.describe "stages/show", :type => :view do
  before(:each) do
    @stage = assign(:stage, Stage.create!(
      :number => 1,
      :landmark => "Landmark",
      :miles => 1.5,
      :difficulty => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Landmark/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/2/)
  end
end
