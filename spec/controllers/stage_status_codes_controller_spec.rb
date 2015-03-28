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

RSpec.describe StageStatusCodesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # StageStatusCode. As you add validations to StageStatusCode, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StageStatusCodesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all stage_status_codes as @stage_status_codes" do
      stage_status_code = StageStatusCode.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:stage_status_codes)).to eq([stage_status_code])
    end
  end

  describe "GET show" do
    it "assigns the requested stage_status_code as @stage_status_code" do
      stage_status_code = StageStatusCode.create! valid_attributes
      get :show, {:id => stage_status_code.to_param}, valid_session
      expect(assigns(:stage_status_code)).to eq(stage_status_code)
    end
  end

  describe "GET new" do
    it "assigns a new stage_status_code as @stage_status_code" do
      get :new, {}, valid_session
      expect(assigns(:stage_status_code)).to be_a_new(StageStatusCode)
    end
  end

  describe "GET edit" do
    it "assigns the requested stage_status_code as @stage_status_code" do
      stage_status_code = StageStatusCode.create! valid_attributes
      get :edit, {:id => stage_status_code.to_param}, valid_session
      expect(assigns(:stage_status_code)).to eq(stage_status_code)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new StageStatusCode" do
        expect {
          post :create, {:stage_status_code => valid_attributes}, valid_session
        }.to change(StageStatusCode, :count).by(1)
      end

      it "assigns a newly created stage_status_code as @stage_status_code" do
        post :create, {:stage_status_code => valid_attributes}, valid_session
        expect(assigns(:stage_status_code)).to be_a(StageStatusCode)
        expect(assigns(:stage_status_code)).to be_persisted
      end

      it "redirects to the created stage_status_code" do
        post :create, {:stage_status_code => valid_attributes}, valid_session
        expect(response).to redirect_to(StageStatusCode.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved stage_status_code as @stage_status_code" do
        post :create, {:stage_status_code => invalid_attributes}, valid_session
        expect(assigns(:stage_status_code)).to be_a_new(StageStatusCode)
      end

      it "re-renders the 'new' template" do
        post :create, {:stage_status_code => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested stage_status_code" do
        stage_status_code = StageStatusCode.create! valid_attributes
        put :update, {:id => stage_status_code.to_param, :stage_status_code => new_attributes}, valid_session
        stage_status_code.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested stage_status_code as @stage_status_code" do
        stage_status_code = StageStatusCode.create! valid_attributes
        put :update, {:id => stage_status_code.to_param, :stage_status_code => valid_attributes}, valid_session
        expect(assigns(:stage_status_code)).to eq(stage_status_code)
      end

      it "redirects to the stage_status_code" do
        stage_status_code = StageStatusCode.create! valid_attributes
        put :update, {:id => stage_status_code.to_param, :stage_status_code => valid_attributes}, valid_session
        expect(response).to redirect_to(stage_status_code)
      end
    end

    describe "with invalid params" do
      it "assigns the stage_status_code as @stage_status_code" do
        stage_status_code = StageStatusCode.create! valid_attributes
        put :update, {:id => stage_status_code.to_param, :stage_status_code => invalid_attributes}, valid_session
        expect(assigns(:stage_status_code)).to eq(stage_status_code)
      end

      it "re-renders the 'edit' template" do
        stage_status_code = StageStatusCode.create! valid_attributes
        put :update, {:id => stage_status_code.to_param, :stage_status_code => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested stage_status_code" do
      stage_status_code = StageStatusCode.create! valid_attributes
      expect {
        delete :destroy, {:id => stage_status_code.to_param}, valid_session
      }.to change(StageStatusCode, :count).by(-1)
    end

    it "redirects to the stage_status_codes list" do
      stage_status_code = StageStatusCode.create! valid_attributes
      delete :destroy, {:id => stage_status_code.to_param}, valid_session
      expect(response).to redirect_to(stage_status_codes_url)
    end
  end

end
