class ApiController < ApplicationController
  layout nil

  def list_catalog
    render json: Catalog.all
  end

  def list_product
    render json: Catalog.find(params[:id]).products
  end
end
