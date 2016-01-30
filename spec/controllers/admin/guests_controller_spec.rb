require 'rails_helper'

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

RSpec.describe Admin::GuestsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Admin::Guest. As you add validations to Admin::Guest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::GuestsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all admin_guests as @admin_guests" do
      guest = Admin::Guest.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:admin_guests)).to eq([guest])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_guest as @admin_guest" do
      guest = Admin::Guest.create! valid_attributes
      get :show, {:id => guest.to_param}, valid_session
      expect(assigns(:admin_guest)).to eq(guest)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_guest as @admin_guest" do
      get :new, {}, valid_session
      expect(assigns(:admin_guest)).to be_a_new(Admin::Guest)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_guest as @admin_guest" do
      guest = Admin::Guest.create! valid_attributes
      get :edit, {:id => guest.to_param}, valid_session
      expect(assigns(:admin_guest)).to eq(guest)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::Guest" do
        expect {
          post :create, {:admin_guest => valid_attributes}, valid_session
        }.to change(Admin::Guest, :count).by(1)
      end

      it "assigns a newly created admin_guest as @admin_guest" do
        post :create, {:admin_guest => valid_attributes}, valid_session
        expect(assigns(:admin_guest)).to be_a(Admin::Guest)
        expect(assigns(:admin_guest)).to be_persisted
      end

      it "redirects to the created admin_guest" do
        post :create, {:admin_guest => valid_attributes}, valid_session
        expect(response).to redirect_to(Admin::Guest.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_guest as @admin_guest" do
        post :create, {:admin_guest => invalid_attributes}, valid_session
        expect(assigns(:admin_guest)).to be_a_new(Admin::Guest)
      end

      it "re-renders the 'new' template" do
        post :create, {:admin_guest => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_guest" do
        guest = Admin::Guest.create! valid_attributes
        put :update, {:id => guest.to_param, :admin_guest => new_attributes}, valid_session
        guest.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested admin_guest as @admin_guest" do
        guest = Admin::Guest.create! valid_attributes
        put :update, {:id => guest.to_param, :admin_guest => valid_attributes}, valid_session
        expect(assigns(:admin_guest)).to eq(guest)
      end

      it "redirects to the admin_guest" do
        guest = Admin::Guest.create! valid_attributes
        put :update, {:id => guest.to_param, :admin_guest => valid_attributes}, valid_session
        expect(response).to redirect_to(guest)
      end
    end

    context "with invalid params" do
      it "assigns the admin_guest as @admin_guest" do
        guest = Admin::Guest.create! valid_attributes
        put :update, {:id => guest.to_param, :admin_guest => invalid_attributes}, valid_session
        expect(assigns(:admin_guest)).to eq(guest)
      end

      it "re-renders the 'edit' template" do
        guest = Admin::Guest.create! valid_attributes
        put :update, {:id => guest.to_param, :admin_guest => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_guest" do
      guest = Admin::Guest.create! valid_attributes
      expect {
        delete :destroy, {:id => guest.to_param}, valid_session
      }.to change(Admin::Guest, :count).by(-1)
    end

    it "redirects to the admin_guests list" do
      guest = Admin::Guest.create! valid_attributes
      delete :destroy, {:id => guest.to_param}, valid_session
      expect(response).to redirect_to(admin_guests_url)
    end
  end

end
