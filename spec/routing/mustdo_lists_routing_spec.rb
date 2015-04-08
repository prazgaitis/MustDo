require "spec_helper"

describe MustdoListsController do
  describe "routing" do

    it "routes to #index" do
      get("/mustdo_lists").should route_to("mustdo_lists#index")
    end

    it "routes to #new" do
      get("/mustdo_lists/new").should route_to("mustdo_lists#new")
    end

    it "routes to #show" do
      get("/mustdo_lists/1").should route_to("mustdo_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mustdo_lists/1/edit").should route_to("mustdo_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mustdo_lists").should route_to("mustdo_lists#create")
    end

    it "routes to #update" do
      put("/mustdo_lists/1").should route_to("mustdo_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mustdo_lists/1").should route_to("mustdo_lists#destroy", :id => "1")
    end

  end
end
