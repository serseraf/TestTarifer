class CatalogsController < ApplicationController
  def index
    @catalogs = Catalog.all
  end

  def new
    @catalog = Catalog.new
  end

  def edit
    @catalog = Catalog.find_by_id(params[:id])
  end

  def create
    @catalog = Catalog.create(catalog_params)
    if @catalog.valid?
      redirect_to catalogs_path
    else
      flash[:notice] = 'Ошибка ' + @catalog.errors.messages.to_s + ' добавлна в Seeds'
      save_invalid_data(@catalog)
      redirect_to new_catalog_path
    end
  end

  def show
    @catalog = Catalog.find(params[:id])
    @products = @catalog.products
  end

  def update
    @catalog = Catalog.find(params[:id])
    if @catalog.update_attributes(catalog_params)
      redirect_to catalogs_path
    else
      flash[:notice] = 'No updated Catalog '+ @catalog.id.to_s
      redirect_to edit_catalog_path
    end
  end

  def destroy
    @catalog = Catalog.find(params[:id]).destroy
    redirect_to catalogs_path
  end

  private
  def catalog_params
    params.require(:catalog).permit(:name, :description)
  end
end
