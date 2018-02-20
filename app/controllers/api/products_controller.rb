module Api
    class ProductsController < ApplicationController
        before_action :authenticate_user
        before_action :find_product, only: [:show, :update, :destroy]

        def index
            products = Product.all 
            render json: {status: 'SUCCESS', message: 'List of Products', data:products}, status: :ok
        end

        def show
            render json: {status: 'SUCCESS', message: 'Loaded Product', data:@product}, status: :ok
        end

        def create
            product = Product.new(product_params)
            if product.save
                render json: {status: 'SUCCESS', message: 'Product was created.', data:product}, status: :ok
            else
                render json: {status: 'ERROR', message: 'Product not saved', data:product.errors}, status: :unprocessable_entity
            end
        end

        def update
            if @product.update(product_params)
                render json: { status: 'SUCCESS', message: 'Product has been updated.', data:@product}, status: :ok
            else
                render json: {status: 'ERROR', message: 'Product not updated', data:@product.errors}, status: :unprocessable_entity
            end
        end

        def destroy
            if @product.destroy
                render json: { status: 'SUCCESS', message: 'Product has been deleted.', data:@product}, status: :ok
            end
        end

        private

        def product_params
            params.require(:product).permit(:name, :description, :price)
        end

        def find_product
            @product = Product.find(params[:id])
        end
    end
end