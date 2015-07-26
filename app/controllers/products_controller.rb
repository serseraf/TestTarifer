class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @catalog = Catalog.find(params[:id])
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
    @catalog = Catalog.find(@product.catalog_id)
  end

  def create
    id = params[:product][:catalog_id]
    @product = Product.create(product_params)
    if @product.valid?
      redirect_to catalog_path(@product.catalog_id)
    else
      flash[:notice] = 'Ошибка ' + @product.errors.messages.to_s + ' добавлна в Seeds'
      save_invalid_data(@product)
      redirect_to catalog_path(id)
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to catalog_path(@product.catalog_id)
    else
      flash[:notice] = 'No updated Product '+ @product.id.to_s
      redirect_to :back
    end
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    redirect_to :back
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :catalog_id)
  end
end
