require 'rails_helper'

RSpec.describe "coins/new", type: :view do
  before(:each) do
    assign(:coin, Coin.new(
      :description => "MyString",
      :acronym => "MyString",
      :url_image => "MyString"
    ))
  end

  it "renders new coin form" do
    render

    assert_select "form[action=?][method=?]", coins_path, "post" do

      assert_select "input[name=?]", "coin[description]"

      assert_select "input[name=?]", "coin[acronym]"

      assert_select "input[name=?]", "coin[url_image]"
    end
  end
end
