require "rails_helper"

RSpec.describe MiningTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/mining_types").to route_to("mining_types#index")
    end

    it "routes to #new" do
      expect(:get => "/mining_types/new").to route_to("mining_types#new")
    end

    it "routes to #show" do
      expect(:get => "/mining_types/1").to route_to("mining_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mining_types/1/edit").to route_to("mining_types#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/mining_types").to route_to("mining_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mining_types/1").to route_to("mining_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mining_types/1").to route_to("mining_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mining_types/1").to route_to("mining_types#destroy", :id => "1")
    end
  end
end
