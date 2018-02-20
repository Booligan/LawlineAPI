module Api
    class ProductsController < ApplicationController
        before_action :authenticate_user
        before_action :find_product, only: [:show, :update, :destroy]

        def index
            if params[:user_id]     #GET USER PRODUCTS IF IN PARAMS
                user = User.find_by(id: params[:user_id])
                products = user.products
            else
                products = Product.all #ELSE GET ALL PRODUCTS
            end 
            render json: {status: 'SUCCESS', message: 'List of Products', data:products}, status: :ok
        end

        def show      #LOAD GIVEN PRODUCT
            render json: {status: 'SUCCESS', message: 'Loaded Product', data:@product}, status: :ok
        end

        def create      #CREATE A PRODUCT
            product = Product.new(product_params)
            if product.save
                render json: {status: 'SUCCESS', message: 'Product was created.', data:product}, status: :ok
            else
                render json: {status: 'ERROR', message: 'Product not saved', data:product.errors}, status: :unprocessable_entity
            end
        end

        def update      #UPDATE A PRODUCT
            if @product.update(product_params)
                render json: { status: 'SUCCESS', message: 'Product has been updated.', data:@product}, status: :ok
            else
                render json: {status: 'ERROR', message: 'Product not updated', data:@product.errors}, status: :unprocessable_entity
            end
        end

        def destroy     #DELETE PRODUCT FROM DB
            if @product.destroy
                render json: { status: 'SUCCESS', message: 'Product has been deleted.', data:@product}, status: :ok
            end
        end

        def image       #ADD IMAGE TO PRODUCT
            @product = Product.find(params[:product_id])            
            if @product.update(image_param)
                render json: { status: 'SUCCESS', message: 'Image was added.', data:@product}, status: :ok
            else
                render json: {status: 'ERROR', message: 'Image was not updated', data:@product.errors}, status: :unprocessable_entity
            end
        end

        def add     #ADD PRODUCT TO USER
            @product = Product.find(params[:product_id])         
            if current_user.products.include?(@product)
                render json: { status: 'ERROR', message: 'Product already belongs to user', data:@product}, status: :unprocessable_entity                
            else 
                current_user.add_product(@product)
                render json: { status: 'SUCCESS', message: 'Product was added to user', data:@product}, status: :ok
            end               
        end

        def remove  #REMOVE PRODUCT FROM USER
            @product = Product.find(params[:product_id])                               
            if  current_user.products.include?(@product)
                current_user.products.delete(@product)
                render json: { status: 'SUCCESS', message: 'The product was removed', data:@product}, status: :ok                
            else 
                render json: { status: 'ERROR', message: 'The product was not removed', data:@product.errors}, status: :unprocessable_entity
            end               
        end

        private

        def product_params
            params.require(:product).permit(:name, :description, :price, :image)
        end

        def image_param
            params.require(:product).permit(:image)            
        end

        def find_product
            @product = Product.find(params[:id])
        end
    end
end