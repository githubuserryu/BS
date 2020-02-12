class MainController < ApplicationController
  before_action :current_user_list

  def index
    #指定月のみの収支を取得
    @income = @user_income.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month)
    @spend = @user_spend.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month)
    #カテゴリーごとの収支の合計を取得
    @incomes = @income.group(:category).sum(:income)
    @spends = @spend.group(:category).sum(:spend)
    #指定月の固定費合計を取得
    @income_cost = @user_cost_income.sum(:income)
    @spend_cost = @user_cost_spend.sum(:spend)
    #指定月の収支合計を取得
    @income_variable = @income.sum(:income)
    @spend_variable = @spend.sum(:spend)
    $income_sum = @income_variable + @income_cost
    $spend_sum = @spend_variable + @spend_cost
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
    @income_cost = @user_cost_income.all.order(content: "asc")
    @spend_cost = @user_cost_spend.all.order(content: "asc")
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

  # 固定費の新規登録、編集削除-----------------------------------

  def cost_new
    @income_cost = IncomeCost.new
    @spend_cost = SpendCost.new
  end

  def cost_create
    if params[:income_cost]
      IncomeCost.create(income_cost_params)
    else
      SpendCost.create(spend_cost_params)
    end
    redirect_to root_path
  end

  def cost_income_edit
    @income_cost = IncomeCost.find(params[:format])
  end

  def cost_spend_edit
    @spend_cost = SpendCost.find(params[:format])
  end

  def cost_income_update
    cost_income = IncomeCost.find(params[:format])
    cost_income.update(income_cost_params)
    redirect_to "/main/:id"
  end

  def cost_spend_update
    cost_spend = SpendCost.find(params[:format])
    cost_spend.update(spend_cost_params)
    redirect_to "/main/:id"
  end

  def cost_income_destroy
    income_delete = IncomeCost.find(params[:format])
    income_delete.destroy
    redirect_to "/main/:id"
  end

  def cost_spend_destroy
    spend_delete = SpendCost.find(params[:format])
    spend_delete.destroy
    redirect_to "/main/:id"
  end

  
  private
  
  def current_user_list #ログインしているユーザーのみの収支を取得
    @user_income = IncomeList.where(user_id: current_user.id)
    @user_spend = SpendList.where(user_id: current_user.id)
    @user_cost_income = IncomeCost.where(user_id: current_user.id)
    @user_cost_spend = SpendCost.where(user_id: current_user.id)
  end
  
  def income_params
    params.require(:income_list).permit(:income, :content, :day, :category).merge(user_id: current_user.id)
  end
  
  def spend_params
    params.require(:spend_list).permit(:spend, :day, :use, :category).merge(user_id: current_user.id)
  end
  
  def income_cost_params
    params.require(:income_cost).permit(:income, :content).merge(user_id: current_user.id)
  end

  def spend_cost_params
    params.require(:spend_cost).permit(:spend, :content).merge(user_id: current_user.id)
  end
end

