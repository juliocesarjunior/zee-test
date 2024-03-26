class Api::V1::ProductsController <  ApiController

	before_action :set_product, only: [:show, :update, :destroy]

	def index
		@per_page = params[:per_page] || 25
		@page = params[:page] || 1

		@q = Product.order(created_at: :asc).ransack(params[:q])
		@products = @q.result
		@products = @products.page(@page).per(@per_page)

		render json: @products, meta: pagination_dict(@products), each_serializer: ProductSerializer
	end

	def show
		@product = Product.find(params[:id])
		if @product
			render json: @product, status: :ok
		else
			render json: { error: 'Produto não encontrado' }, status: :not_found
		end
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			render json: @product, status: :created
		else
			render json: @product.errors, status: :unprocessable_entity
		end
	end

	def update
		if @product.update(product_params)
			render json: @product
		else
			render json: @product.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@product.skus.destroy_all	
		@product.destroy
		head :no_content
	end


	private


	def set_product
		@product = Product.find_by(id: params[:id])
		render json: { error: 'Produto não encontrado' }, status: :not_found unless @product
	end


	def product_params
		params.require(:product).permit!
	end
end
