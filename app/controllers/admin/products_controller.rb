class Admin::ProductsController < Admin::BaseAdminController
  before_action :load_object, only: [:show, :edit, :update, :destroy]
  before_action :build_object, only: [:new, :create]

  def index
    @q = Product.search params[:q]
    @products = @q.result.page params[:page]
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @product.attributes = product_params
    if @product.save
      uploaded_io = params[:product][:image]
      File.open(Rails.root.join("public", "uploads", "products", "image#{@product.id}"), "wb") do |file|
        file.write(uploaded_io.read)
      end
      redirect_to admin_product_path(@product), notice: :".created"
    else
      render :new
    end
    

  end

  def update
    if @product.update_attributes product_params      
      uploaded_io = params[:product][:image]
      File.open(Rails.root.join("public", "uploads", "products", "image#{@product.id}"), "wb") do |file|
        file.write(uploaded_io.read)
      end
      redirect_to admin_product_path(@product), notice: :".updated"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_url,
      notice: {:".destroyed" => {name: @product.name}}
  end

  private
  def load_object
    @product = Product.find params[:id]
  end

  def build_object
    @product = Product.new
  end

  def product_params
    params.require(:product).permit Product::UPDATABLE_COLUMNS_FOR_ADMINS
  end

end