require 'rails_helper'

describe UsersController do

  describe "GET #index" do
    it "populates an array of users" do
      create_list(:user, 4)
      get :index
      expect(response.body.length >= 1).to be_truthy
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it "returns a json object of @user" do
      user = create(:user)
      get :show, params: { id: user.id }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body).to eq(JSON.parse(user.to_json))
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new @user in the database" do
        user = FactoryGirl.attributes_for(:user)
        expect {
          post :create, params: { user: user }
        }.to change(User, :count).by(1)
      end

      it "returns the new @user" do
        user = FactoryGirl.attributes_for(:user)
        post :create, params: { user: user }
        parsed_body = JSON.parse(response.body).except("created_at", "updated_at", "id")
        expect(parsed_body).to eq(JSON.parse(user.to_json))
      end
    end

    context "with invalid attributes" do
      it "does not save the new @user in the database" do
        user = FactoryGirl.attributes_for(:user, first_name: nil)
        expect {
          post :create, params: { user: user }
        }.to change(User, :count).by(0)
      end

      it "returns an json object with error message" do
        user = FactoryGirl.attributes_for(:user, first_name: nil)
        post :create, params: { user: user }

        # terribly fragile
        # TODO: Learn to write this better
        parsed_body = JSON.parse(response.body)['errors']
        expect(parsed_body).to include(/short/)
      end

      it "has an error code of 400" do
        user = FactoryGirl.attributes_for(:user, first_name: nil)
        post :create, params: { user: user }
        expect(response.status).to match(400)
      end
    end
  end

  describe "UPDATE #edit" do
    before :each do
      @user = FactoryGirl.create(:user, first_name: "Gregory")
    end

    context "with valid attributes" do
      it "locates the requested @user" do
        put :update, params: { 
          id: @user, 
          user: FactoryGirl.attributes_for(:user) 
        }
        expect(assigns(:user)).to eq(@user)
      end

      it "updates the existing @user attributes and returns @user" do
        put :update, params: { 
          id: @user, 
          user: FactoryGirl.attributes_for(:user, first_name: "Greg", gender: "Male") 
        }
        @user.reload
        expect(@user.first_name).to eq("Greg")
        expect(@user.gender).to eq("Male")
      end
    end

    context "with invalid attributes" do
      it "locates the requested @user" do
        put :update, params: {
          id: @user,
          user: FactoryGirl.attributes_for(:invalid_user)
        }
        expect(assigns(:user)).to eq(@user)
      end

      it "does not save changes to the existing @user in the database" do
        put :update, params: {
          id: @user,
          user: FactoryGirl.attributes_for(:user, first_name: nil)
        }
        @user.reload
        expect(@user.first_name).to_not be_nil
      end

      it "returns an json object with error message" do
        put :update, params: {
          id: @user,
          user: FactoryGirl.attributes_for(:user, first_name: nil)
        }
        @user.reload
        # TODO: Learn to write this better
        parsed_body = JSON.parse(response.body)['errors']
        expect(parsed_body).to include(/short/)
      end

      it "has an error code of 400" do
        put :update, params: {
          id: @user,
          user: FactoryGirl.attributes_for(:user, first_name: nil)
        }
        @user.reload
        expect(response.status).to match(400)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    it "deletes the @user from the database" do
      expect {
        delete :destroy, params: {
          id: @user
        }
      }.to change(User, :count).by(-1)
    end

    it "returns 200" do
      delete :destroy, params: {
        id: @user
      }
      expect(response.status).to match(200)
    end
  end

end
