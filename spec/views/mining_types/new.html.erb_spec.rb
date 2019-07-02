require 'rails_helper'

RSpec.describe "mining_types/new", type: :view do
  before(:each) do
    assign(:mining_type, MiningType.new(
      :description => "MyString",
      :acronym => "MyString"
    ))
  end

  it "renders new mining_type form" do
    render

    assert_select "form[action=?][method=?]", mining_types_path, "post" do

      assert_select "input[name=?]", "mining_type[description]"

      assert_select "input[name=?]", "mining_type[acronym]"
    end
  end
end
