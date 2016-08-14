require 'rails_helper'

describe ProductsController do
  let!(:product) { create(:product, created_at: Time.now + 1) }
  let(:params) {{
      id: product.id,
      product: attributes_for(:product, title: 'aaa')
  }}
  let(:invalid_params) {{
        id: product.id,
        product: attributes_for(:product, title: nil)
    }}
  context "with user login" do
    before { login_user }
    describe "GET #new" do
      it "renders the :new template" do
        get :new, id: product
        expect(response).to render_template :new
      end
      it "assigns the requested product to @product" do
        get :new
        expect(assigns(:product)).to be_a_new(Product)
      end
    end
    describe "GET #show" do
      before do
        get :show, id: product
      end
      it "assigns the requested product to @product" do
        expect(assigns(:product)).to eq product
      end
      it "renders the :show template" do
        expect(response).to render_template :show
      end
      it 'assigns the requested comment to @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end
      it 'assigns likes associated with product to @like' do
        expect(assigns(:likes)).to eq product.likes
      end
    end

    describe "GET #index" do
      before do
        get :index
      end
      it "assigns the requested product to @products" do
        expect(assigns(:products)).to include product
      end
      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end
    describe "GET #edit" do
      before do
        get :edit, id: product
      end
      let(:product) { create(:product) }
      it "assigns the requested product to @product" do
        expect(assigns(:product)).to eq product
      end
      it "assigns main_image to @main_image" do
        expect(assigns(:main_image)).to eq product.images.main
      end
      it "assigns the images to @sub_image" do
        expect(assigns(:sub_image)).to eq product.images.sub
      end
      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end
    describe "POST #create" do
      context "with valid attributes" do
        before do
          post :create, params
        end
        it "saves the new product in the database" do
          expect {
            post :create, params
          }.to change(Product, :count).by(1)
        end
        it "redirect the root_path" do
          expect(response).to redirect_to root_path
        end
        it "shows flash messages to show save the product successfully" do
          expect(flash[:notice]).to eq 'succeed in post'
        end
      end
      context "with invalid attributes" do
        before do
          post :create, invalid_params
        end
        it "does not save the new product in the database" do
          expect {
            post :create, invalid_params
          }.to change(Product, :count).by(0)
        end
        it "redirect the new" do
          expect(response).to render_template(:new)
        end
      end
    end
    describe "PATCH #update" do
      context "with valid attributes" do
        before do
          patch :update, params
        end
        it "assigns the requested product to @product" do
          expect(assigns(:product)).to eq product
        end
        it "updates attributes of prototype" do
          product.reload
          expect(product.title).to eq 'aaa'
        end
        it "redirects to root_path" do
          expect(response).to redirect_to root_path
        end
        it "shows flash messages to show save the product successfully" do
          expect(flash[:notice]).to eq 'succeed in edit'
        end
      end

      context "with invalid attributes" do
        before :each do
          patch :update, invalid_params
        end
        it "assigns the requested product to @product" do
          expect(assigns(:product)).to eq product
        end
        it "redirect the edit" do
          expect(response).to render_template(:edit)
        end
        it "does not save the new product" do
          product.reload
          expect(product.title).not_to eq nil
        end
      end
    end

    describe "DELETE #destory" do
      before do
        delete :destroy, id: product
      end
      it "deletes the product" do
        product = create(:product)
        expect{ product.destroy }.to change(Product, :count).by(-1)
      end
      it 'assigns the requested product to @product' do
        expect(assigns(:product)).to eq product
      end
      it 'redirect the root_path' do
        expect(response).to redirect_to root_path
      end
      it "shows flash messages to delete the product successfully" do
        expect(flash[:notice]).to eq 'succeed in delete'
      end
    end
  end

  context 'without user login' do
    describe 'GET #new' do
      it "redirects sign_in page" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'POST #create' do
      it "redirects sign_in page" do
        post :create, product: attributes_for(:product)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it "redirects sign_in page" do
        get :edit, id: product
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it "redirects sign_in page" do
        patch :update, params
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do
      it "redirects sign_in page" do
        delete :destroy, params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end

