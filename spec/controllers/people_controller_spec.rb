# spec/controllers/people_controller_spec.rb
require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe "GET #index" do
    subject { get :index }
    before(:each) { @response = subject } 

    it "renders the template" do
      expect(@response).to render_template(:index)
    end
    it "loads all of the people into @people" do
      expect(@response.body.length).to be_truthy
    end
  end

  describe "GET #show" do
    before(:each) { @person = create(:person) }

    it "renders the template" do
      get :show, params: { id: @person }
      expect(@response).to render_template(:show)
    end
    it "loads the person into @person" do
      get :show, params: { id: @person }
      expect(assigns(:person)).to eq(@person)
    end
  end

  describe "GET #new" do
    it "renders the template" do
      get :new
      expect(@response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    before(:each) { @person = create(:person) }

    it "renders the template" do
      get :edit, params: { id: @person.id }
      expect(response).to render_template(:edit)
    end
    it "loads the person into @person" do
      get :edit, params: { id: @person.id }
      expect(assigns(:person)).to eq(@person)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "changes person count by +1" do
        expect { 
          post :create,
              params: { person: FactoryGirl.attributes_for(:person)}
        }.to change(Person,:count).by(1)
      end
      it "loads the person into @person" do
        post :create,
            params: { person: FactoryGirl.attributes_for(:person) }
        expect(response).to redirect_to(Person.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new person" do
        expect { 
          post :create,
               params: { person: FactoryGirl.attributes_for(:person, :invalid)}
        }.to_not change(Person,:count)
      end
      it "re-runs people#new" do
        post :create,
             params: { person: FactoryGirl.attributes_for(:person, :invalid)}
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @person = create(:person, first_name: 'Lawrence', last_name: 'Smith')
    end

    context "valid attributes" do
      it "should locate the requested person" do
        put :update, params: { id: @person, person: FactoryGirl.attributes_for(:person) }
        expect(assigns(:person)).to eq(@person)
      end
      it "should update person" do
        put :update, params: { id: @person, person: FactoryGirl.attributes_for(:person, first_name: "Jane", gender: "Female" ) }
        expect(assigns(:person)).to eq(@person)
      end
      it "renders the template" do
        put :update, params: { id: @person, person: FactoryGirl.attributes_for(:person) }
        expect(response).to redirect_to(@person)
      end
    end

    context "invalid attributes" do
      it "shouldn't update person" do
        put :update, params: { id: @person, person: FactoryGirl.attributes_for(:person, first_name: nil ) }
        @person.reload
        expect(@person.first_name).to eq('Lawrence')
      end
      it "renders the template" do
        put :update, params: { id: @person, person: FactoryGirl.attributes_for(:person, first_name: nil) }
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @person = create(:person)
    end

    it "changes person count by -1" do
      expect { 
        delete :destroy, params: { id: @person }
      }.to change(Person,:count).by(-1)
    end
    it "renders the people#index template" do
      delete :destroy, params: { id: @person }
      expect(response).to redirect_to people_url
    end
  end
end
