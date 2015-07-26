class ApplicationController < ActionController::Base
  include CommonMethods
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::RoutingError, :with => :send_empty_record
  rescue_from ActionController::BadRequest, :with => :send_empty_record
  rescue_from ActionController::RenderError, :with => :send_empty_record
  rescue_from ActionController::MethodNotAllowed, :with => :send_empty_record
  rescue_from ActionController::UnknownFormat, :with => :send_empty_record
  rescue_from ActiveRecord::RecordNotFound, :with => :send_empty_record
  rescue_from ActionController::UnknownController, :with => :go_to_root
  rescue_from ActiveRecord::RecordNotSaved, :with => :go_to_root

  def save_invalid_data(obj)
    Seed.create(addr: request.remote_ip, obj_hash: obj.to_s, name: obj.errors.messages.to_s)
  end

  def send_empty_record
    if it_is_api?
      render json: Product.empty(params[:id])
    else
      go_to_root
    end
  end

  def go_to_root
    redirect_to root_url
  end
end
