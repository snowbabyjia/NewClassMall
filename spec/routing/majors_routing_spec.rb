require "spec_helper"

describe MajorsController do
  describe "routing" do

    it "routes to #index" do
      get("/majors").should route_to("majors#index")
    end

    it "routes to #new" do
      get("/majors/new").should route_to("majors#new")
    end

    it "routes to #show" do
      get("/majors/1").should route_to("majors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/majors/1/edit").should route_to("majors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/majors").should route_to("majors#create")
    end

    it "routes to #update" do
      put("/majors/1").should route_to("majors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/majors/1").should route_to("majors#destroy", :id => "1")
    end

  end
end
