require 'rails_helper'

describe UsersController do
  let!(:user) { create(:user) }
  let(:params) {{
      id: user.id,
      user: attributes_for(:user, name: 'aaa')
  }}
  context "with user login" do
    before { login_user }
    describe "GET #SHOW" do
      before do
        get :show, id: user
      end
      it "assigns the requested to @user" do
        expect(assigns(:user)).to eq user
      end
      it "renders the :show templates" do
        expect(response).to render_template :show
      end
    end
    describe "GET #EDIT" do
      before do
        get :edit, id: user
      end
      it "assigns the requested user to @user" do
        expect(assigns(:user)).to eq user
      end
      it "renders teh :edit template" do
        expect(response).to render_template :edit
      end
    end
    describe "PATCH #update" do
      before do
        patch :update, params
      end
      it "assigns the requested user to @user" do
        expect(assigns(:user)).to eq user
      end
      it "changes @user's attributes" do
        user.reload
        expect(user.name).to eq 'aaa'
      end

      it 'redirects root path' do
        expect(response).to redirect_to root_path
      end

      it 'sends flash messages' do
        expect(flash[:notice]).to eq 'succeed in edit'
      end
    end
  end
  context "without user login" do
    describe "GET #edit" do
      it "redirects sign_in page" do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
      it "redirects sign_in page" do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end


