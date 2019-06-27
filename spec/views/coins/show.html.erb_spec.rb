require 'rails_helper'

RSpec.describe "coins/show", type: :view do
  before(:each) do
    @coin = assign(:coin, Coin.create!(
      :description => "Description",
      :acronym => "Acronym",
      :url_image => "Url Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Acronym/)
    expect(rendered).to match(/Url Image/)
  end
end
