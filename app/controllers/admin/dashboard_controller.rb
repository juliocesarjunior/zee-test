class Admin::DashboardController < AdminController
  def index
    @products = Product.order(id: :asc).limit(5)
  end
end
