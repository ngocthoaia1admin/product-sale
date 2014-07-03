class Anonymous::ProductsController < Anonymous::BaseAnonymousController
  before_action :load_object, only: [:show]

  def index
    @q = Product.search params[:q]
    @products = @q.result.page(params[:page]).per(12)
  end

  def show
  end

 private
  def load_object
    @product = Product.find params[:id]
  end

end