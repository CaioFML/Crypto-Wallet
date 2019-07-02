require 'rails_helper'

RSpec.describe "mining_types/index", type: :view do
  before(:each) do
    assign(:mining_types, [
      MiningType.create!(
        :description => "Description",
        :acronym => "Acronym"
      ),
      MiningType.create!(
        :description => "Description",
        :acronym => "Acronym"
      )
    ])
  end

  it "renders a list of mining_types" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Acronym".to_s, :count => 2
  end
end
