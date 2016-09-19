class Admin::BaseController < ApplicationController
  before_action :require_sign_in
  before_action :require_admin

  layout "internal_layout", only: [:index]

  def index

  end

end
