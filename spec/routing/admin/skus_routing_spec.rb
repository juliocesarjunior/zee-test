require "rails_helper"

RSpec.describe Admin::SkusController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/skus").to route_to("admin/skus#index")
    end

    it "routes to #new" do
      expect(get: "/admin/skus/new").to route_to("admin/skus#new")
    end

    it "routes to #show" do
      expect(get: "/admin/skus/1").to route_to("admin/skus#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/skus/1/edit").to route_to("admin/skus#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/skus").to route_to("admin/skus#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/skus/1").to route_to("admin/skus#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/skus/1").to route_to("admin/skus#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/skus/1").to route_to("admin/skus#destroy", id: "1")
    end
  end
end
