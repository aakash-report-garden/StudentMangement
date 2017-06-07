class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  # Render 404 page when record not found
  def record_not_found
    render :file => Rails.root.join('public/404.html'), :status => 404
  end
end
