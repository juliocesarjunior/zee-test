class Admin::ProductsController < AdminController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /admin/products or /admin/products.json

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).order(id: :asc)
  end

  # GET /admin/products/1 or /admin/products/1.json
  def show
  end

  # GET /admin/products/new
  def new
    @product = Product.new
    @product.skus << Sku.new

  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products or /admin/products.json
  def create
    @product = Product.new(product_params)

    if @product.skus.size==0
      @product.skus << Sku.new
    end

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1 or /admin/products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1 or /admin/products/1.json
  def destroy
   @product.skus.destroy_all
   @product.destroy
   respond_to do |format|
    format.html { redirect_to admin_products_url, notice: "Product was successfully destroyed." }
    format.json { head :no_content }
  end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit!
    end
  end
