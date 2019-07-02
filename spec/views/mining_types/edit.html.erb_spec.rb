require 'rails_helper'

RSpec.describe "mining_types/edit", type: :view do
  before(:each) do
    @mining_type = assign(:mining_type, MiningType.create!(
      :description => "MyString",
      :acronym => "MyString"
    ))
  end

  it "renders the edit mining_type form" do
    render

    assert_select "form[action=?][method=?]", mining_type_path(@mining_type), "post" do

      assert_select "input[name=?]", "mining_type[description]"

      assert_select "input[name=?]", "mining_type[acronym]"
    end
  end
end
