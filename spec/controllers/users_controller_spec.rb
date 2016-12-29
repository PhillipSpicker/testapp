require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    #@user = User.create!(email: "test@mail.de", password: "testpassword")
    @user = FactoryGirl.create(:user)
    #@user2 = User.create!(email: "test@testmail.de", password: "passwordtest")
    @user2 = FactoryGirl.build(:user, email: "test@testmail.de", password: "passwordtest")
  end

  describe "GET #show" do

  	context 'User is logged in' do
  	  before do
  	    sign_in @user
  	  end

  	  it 'loads correct user details' do
  	    get :show, id: @user.id
  	    expect(response).to be_success
  	  	expect(response).to have_http_status(200)
  	  	expect(assigns(:user)).to eq @user
  	  end
  	end

    context 'No user is logged in' do
      it 'redirects to login' do
      	get :show, id: @user.id
      	expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "User2 cannot access showpage of User" do
    context 'User2 is logged in' do
      before do
        sign_in @user2
      end

      it 'User redirected to root path' do
        get :show, id: @user.id
        expect(response).to redirect_to(root_path)
      end

    end
 
  end

end 