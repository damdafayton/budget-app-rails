require "rails_helper"

RSpec.describe GroupExpendituresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/group_expenditures").to route_to("group_expenditures#index")
    end

    it "routes to #new" do
      expect(get: "/group_expenditures/new").to route_to("group_expenditures#new")
    end

    it "routes to #show" do
      expect(get: "/group_expenditures/1").to route_to("group_expenditures#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/group_expenditures/1/edit").to route_to("group_expenditures#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/group_expenditures").to route_to("group_expenditures#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/group_expenditures/1").to route_to("group_expenditures#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/group_expenditures/1").to route_to("group_expenditures#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/group_expenditures/1").to route_to("group_expenditures#destroy", id: "1")
    end
  end
end
