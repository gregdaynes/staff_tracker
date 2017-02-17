# spec/controllers/staff_controller_spec.rb
require 'rails_helper'

RSpec.describe StaffController, type: :controller do
  describe "GET #index" do
    before(:each) { @response = get :index }
    it "renders the template" do
      expect(@response).to render_template(:index)
    end
    it "loads all of the staff into @staff" do
      expect(@response.body.length).to be_truthy
    end
  end

  describe "GET #show" do
    before(:each) do
      @staff = create(:staff)
      @response = get :show, params: { id: @staff }
    end

    it "renders the template" do
      expect(@response).to render_template(:show)
    end
    it "loads the staff into @staff" do
      expect(assigns(:staff)).to eq(@staff)
    end
  end

  describe "GET #new" do
    it "renders the template" do
      get :new
      expect(@response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    before(:each) do
      @staff = create(:staff)
      @response = get :edit, params: { id: @staff }
    end

    it "renders the template" do
      expect(@response).to render_template(:edit)
    end
    it "loads the staff into @staff" do
      expect(assigns(:staff)).to eq(@staff)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before(:each) { @person = create(:person) }
      it "changes staff count by +1" do
        expect { 
          post :create, params: { staff: FactoryGirl.attributes_for(:staff, person_id: @person.id) }
        }.to change(Staff, :count).by(1)
      end
      it "loads the staff into @staff" do
        post :create, params: { staff: FactoryGirl.attributes_for(:staff, person_id: @person.id) }
        expect(response).to redirect_to(Staff.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new staff" do
        expect {
          post :create, params: { staff: FactoryGirl.attributes_for(:staff, :invalid) }
        }.to_not change(Staff, :count)
      end
      it "re-runs staff#new" do
        post :create, params: { staff: FactoryGirl.attributes_for(:staff, :invalid) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    before(:each) { @staff = create(:staff, pod: 2) }

    context "valid attributes" do
      it "should locate the requested staff" do
        put :update, params: { id: @staff, staff: FactoryGirl.attributes_for(:person) }
        expect(assigns(:staff)).to eq(@staff)
      end
      it "should update staff" do
        put :update, params: { id: @staff, staff: FactoryGirl.attributes_for(:staff, pod: 1) }
        expect(assigns(:staff)).to eq(@staff)
      end
      it "renders the template" do
        put :update, params: { id: @staff, staff: FactoryGirl.attributes_for(:staff) }
        expect(response).to redirect_to(@staff)
      end
    end

    context "invalid attributes" do
      it "should update staff" do
        put :update, params: { id: @staff, staff: FactoryGirl.attributes_for(:staff, :no_pod) }
        @staff.reload
        expect(@staff.pod).to eq('2')
      end
      it "renders the template" do
        put :update, params: { id: @staff, staff: FactoryGirl.attributes_for(:staff, :no_pod) }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) { @staff = create(:staff) }

    it "changes staff count by -1" do
      expect {
        delete :destroy, params: { id: @staff }
      }.to change(Staff, :count).by(-1)
    end
    it "renders the staff#index template" do
      delete :destroy, params: { id: @staff }
      expect(response).to redirect_to(staff_index_url)
    end
  end
end
