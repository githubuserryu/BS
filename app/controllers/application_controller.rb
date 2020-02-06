class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :year_month_definition

  def after_sign_in_path_for(resource)
    '/main'
  end

  def year_month_definition
    m = params[:example2].to_i
    $now_y = Time.current.year
    $now_m = Time.current.month + m
    unless $now_m > 0
      $now_y = $now_y -1
      $now_m = 12 + $now_m
    end
  end

end