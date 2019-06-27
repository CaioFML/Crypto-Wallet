require 'rails_helper'

RSpec.describe "coins/edit", type: :view do
  before(:each) do
    @coin = assign(:coin, Coin.create!(
      :description => "MyString",
      :acronym => "MyString",
      :url_image => "MyString"
    ))
  end

  it "renders the edit coin form" do
    render

    assert_select "form[action=?][method=?]", coin_path(@coin), "post" do

      assert_select "input[name=?]", "coin[description]"

      assert_select "input[name=?]", "coin[acronym]"

      assert_select "input[name=?]", "coin[url_image]"
    end
  end
end
