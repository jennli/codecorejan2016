class ProductsController < ApplicationController

  before_action :product_find, only: [:destroy, :edit, :update, :show]

  def create
    # strong parameters
    @product = Product.new product_params

    if @product.save
      redirect_to product_path(@product), notice: "Product created successfully"
    else
      flash[:alert] = "Please see errors below"
      render :new
    end
  end

  def new
    @product = Product.new
  end


  def index
    @products = Product.order("price DESC")
    respond_to do |format|
      format.html {render}
      format.json {render jason: @products.to_json}
      format.xml {render json: @products.to_xml}
    end
  end

  def show
    @review = Review.new
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def edit
    # we need to find the question that will be edited
  end

  def update
    # strong param
    # update automatically saves the record
    @product.update product_params
    redirect_to product_path(@product)
  end


  private

  def product_find
    @product = Product.find params[:id]
  end

  def product_params
    params.require(:product).permit([:name, :description, :price, {department_ids: []}])
  end

end
