require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MajorsController do

  # This should return the minimal set of attributes required to create a valid
  # Major. As you add validations to Major, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MajorsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all majors as @majors" do
      major = Major.create! valid_attributes
      get :index, {}, valid_session
      assigns(:majors).should eq([major])
    end
  end

  describe "GET show" do
    it "assigns the requested major as @major" do
      major = Major.create! valid_attributes
      get :show, {:id => major.to_param}, valid_session
      assigns(:major).should eq(major)
    end
  end

  describe "GET new" do
    it "assigns a new major as @major" do
      get :new, {}, valid_session
      assigns(:major).should be_a_new(Major)
    end
  end

  describe "GET edit" do
    it "assigns the requested major as @major" do
      major = Major.create! valid_attributes
      get :edit, {:id => major.to_param}, valid_session
      assigns(:major).should eq(major)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Major" do
        expect {
          post :create, {:major => valid_attributes}, valid_session
        }.to change(Major, :count).by(1)
      end

      it "assigns a newly created major as @major" do
        post :create, {:major => valid_attributes}, valid_session
        assigns(:major).should be_a(Major)
        assigns(:major).should be_persisted
      end

      it "redirects to the created major" do
        post :create, {:major => valid_attributes}, valid_session
        response.should redirect_to(Major.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved major as @major" do
        # Trigger the behavior that occurs when invalid params are submitted
        Major.any_instance.stub(:save).and_return(false)
        post :create, {:major => { "name" => "invalid value" }}, valid_session
        assigns(:major).should be_a_new(Major)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Major.any_instance.stub(:save).and_return(false)
        post :create, {:major => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested major" do
        major = Major.create! valid_attributes
        # Assuming there are no other majors in the database, this
        # specifies that the Major created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Major.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => major.to_param, :major => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested major as @major" do
        major = Major.create! valid_attributes
        put :update, {:id => major.to_param, :major => valid_attributes}, valid_session
        assigns(:major).should eq(major)
      end

      it "redirects to the major" do
        major = Major.create! valid_attributes
        put :update, {:id => major.to_param, :major => valid_attributes}, valid_session
        response.should redirect_to(major)
      end
    end

    describe "with invalid params" do
      it "assigns the major as @major" do
        major = Major.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Major.any_instance.stub(:save).and_return(false)
        put :update, {:id => major.to_param, :major => { "name" => "invalid value" }}, valid_session
        assigns(:major).should eq(major)
      end

      it "re-renders the 'edit' template" do
        major = Major.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Major.any_instance.stub(:save).and_return(false)
        put :update, {:id => major.to_param, :major => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested major" do
      major = Major.create! valid_attributes
      expect {
        delete :destroy, {:id => major.to_param}, valid_session
      }.to change(Major, :count).by(-1)
    end

    it "redirects to the majors list" do
      major = Major.create! valid_attributes
      delete :destroy, {:id => major.to_param}, valid_session
      response.should redirect_to(majors_url)
    end
  end

end
