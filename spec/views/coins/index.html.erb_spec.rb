require 'rails_helper'

RSpec.describe "coins/index", type: :view do
  before(:each) do
    assign(:coins, [
      Coin.create!(
        :description => "Description",
        :acronym => "Acronym",
        :url_image => "Url Image"
      ),
      Coin.create!(
        :description => "Description",
        :acronym => "Acronym",
        :url_image => "Url Image"
      )
    ])
  end

  it "renders a list of coins" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Acronym".to_s, :count => 2
    assert_select "tr>td", :text => "Url Image".to_s, :count => 2
  end
end
