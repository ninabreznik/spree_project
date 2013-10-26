require 'spec_helper'

describe ProductsController do

  describe 'GET #index' do
    before do
      @products = [Product.create!(name: "Bag", price: 6)]
      get :index
    end

    it 'responds with status 200' do
      expect(response.response_code).to be == 200
    end

    it 'products/index template' do
      expect(response).to render_template('products/index')
    end

    it 'assigns @products' do
      expect(assigns(:products)).to be == @products
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it 'responds with status 200' do
      expect(response.response_code).to be == 200
    end

    it 'renders the products/new template' do
      expect(response).to render_template('products/new')
    end

    it 'assigns @product' do
      expect(assigns(:product)).to be_new_record
    end
  end

  describe 'GET #edit' do
    before do
      @product = Product.create!
      get :edit, id: @product.to_param
    end

    it 'responds with status 200' do
      expect(response.response_code).to be == 200
    end

    it 'renders the products/edit template' do
      expect(response).to render_template('products/edit')
    end

    it 'assigns @product' do
      expect(assigns(:product)).to be == @product
    end
  end

  describe 'GET #show' do
    before do
      @product = Product.create!
      get :show, id: @product.to_param
    end

    it 'responds with status 200' do
      expect(response.response_code).to be == 200
    end

    it 'renders the products/show template' do
      expect(response).to render_template('products/show')
    end

    it 'assigns @product' do
      expect(assigns(:product)).to be == @product
    end
  end

  describe 'DELETE #destroy' do
    before do
      Product.destroy_all
      @product = Product.create
      @count = Product.count
      delete :destroy, id: @product.to_param
    end

    it 'destroys product' do
      expect(@count).to be == (@count - 1)
    end

    it 'redirects to product' do
      expect(response).to redirect_to(products_path)
    end
  end

  describe 'PUT #update' do
    context 'successful update' do
      before do
        @product = Product.create!
        Product.any_instance.stub(:update).and_return(true)
        put :update, id: @product.to_param, product: {}
      end

      it 'redirects to product' do
        expect(response).to redirect_to(product_path(assigns(:product)))
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to be == 'Successfully update product'
      end
    end

    context 'failed update' do
      before do
        @product = Product.create!
        Product.any_instance.stub(:update).and_return(false)
        put :update, id: @product.to_param, product: {}
      end

      it 'redirects to product' do
        expect(response).to redirect_to(product_path(assigns(:product)))
      end

      it 'sets flash[:error]' do
        expect(flash[:error]).to be == 'Failed to update product'
      end
    end
  end

  describe 'POST #create' do
    context 'successful create' do
      before do
        Product.any_instance.stub(:save).and_return(true)
        post :create, product: {}
      end

      it 'redirects to product' do
        expect(response).to redirect_to(product_path(assigns(:product)))
      end

      it 'sets flash[:success]' do
        expect(flash[:success]).to be == 'Successfully create product'
      end
    end

    context 'failed create' do
      before do
        Product.any_instance.stub(:save).and_return(false)
        post :create, product: {}
      end

      it 'redirects to product' do
        expect(response).to redirect_to(product_path(assigns(:product)))
      end

      it 'sets flash[:error]' do
        expect(flash[:error]).to be == 'Failed to create product'
      end
    end
  end

end
