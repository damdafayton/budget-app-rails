require "rails_helper"

RSpec.describe GroupEntitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/group_entities").to route_to("group_entities#index")
    end

    it "routes to #new" do
      expect(get: "/group_entities/new").to route_to("group_entities#new")
    end

    it "routes to #show" do
      expect(get: "/group_entities/1").to route_to("group_entities#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/group_entities/1/edit").to route_to("group_entities#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/group_entities").to route_to("group_entities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/group_entities/1").to route_to("group_entities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/group_entities/1").to route_to("group_entities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/group_entities/1").to route_to("group_entities#destroy", id: "1")
    end
  end
end
