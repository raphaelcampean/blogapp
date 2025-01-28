class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  layout 'admin'

  def index
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, alert: 'Acesso negado.'
    end
  end
end
