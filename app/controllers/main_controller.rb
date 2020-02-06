class MainController < ApplicationController
  before_action :current_user_list

  def index
    @income = @user_income.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month)
    @spend = @user_spend.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month)
    $income_sum = @income.sum(:income)
    $spend_sum = @spend.sum(:spend)
    @incomes = @income.group(:category).sum(:income)
    @spends = @spend.group(:category).sum(:spend)
  end

  def new
    @income = IncomeList.new
    @spend = SpendList.new
  end
  
  def create
    if params[:income_list]
      IncomeList.create(income_params)
    else
      SpendList.create(spend_params)
    end
    redirect_to root_path
  end

  def show
    @income = @user_income.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month).all.order(category: "asc").order(day: "asc")
    @spend = @user_spend.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month).all.order(category: "asc").order(day: "asc")
  end

  # 収入の編集削除---------------------------------------------
  def income_edit
    @income = IncomeList.find(params[:format])
  end

  def income_update
    income = IncomeList.find(params[:format])
    income.update(income_params)
    redirect_to root_path
  end
  
  def income_destroy
    income_delete = IncomeList.find(params[:format])
    income_delete.destroy
    redirect_to "/main/:id"
  end
  
  # 支出の編集削除--------------------------------------------
  def spend_edit
    @spend = SpendList.find(params[:format])
  end

  def spend_update
    spend = SpendList.find(params[:format])
    spend.update(spend_params)
    redirect_to root_path
  end
  
  def spend_destroy
    spend_delete = SpendList.find(params[:format])
    spend_delete.destroy
    redirect_to "/main/:id"
  end

  private

  def current_user_list
    @user_income = IncomeList.where(user_id: current_user.id)
    @user_spend = SpendList.where(user_id: current_user.id)
  end

  def income_params
    params.require(:income_list).permit(:income, :content, :day, :category).merge(user_id: current_user.id)
  end

  def spend_params
    params.require(:spend_list).permit(:spend, :day, :use, :category).merge(user_id: current_user.id)
  end
end

