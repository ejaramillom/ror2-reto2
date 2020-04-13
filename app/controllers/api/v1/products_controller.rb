module Api
	module V1
		class ProductsController < ApplicationController
			skip_before_action :verify_authenticity_token
		  def index
		    products = Product.all
		    render json: products
		  end

		  # POST /users
		  def create
		  	product = Product.new(product_params)
		  	if product.save
		  		render json: product, status: 201
		  	else
		  		render error: {error: 'Unable to crate product'}, status: 422
		  	end
		  end

		  def update
		    product = Product.find(params[:id])
		    if product.update(product_params)
		      render json: product
		    else
		      render json: { errors: product.errors }, status: 422
		    end
		  end

		  def destroy
		    product = product.find(params[:id])
		    product.destroy

		    head :no_content
		  end


		  private
		  def product_params
		  	params.require(:product).permit(:name, :price)
		  end

		end
	end
end

