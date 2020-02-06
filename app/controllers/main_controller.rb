class MainController < ApplicationController

  def index
    year_month_definition
    @income = IncomeList.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month)
    @spend = SpendList.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month)
    @income_sum = @income.sum(:income)
    @spend_sum = @spend.sum(:spend)
    @incomes = @income.group(:content).sum(:income)
    @spends = @spend.group(:use).sum(:spend)
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
    year_month_definition
    @income = IncomeList.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month).all.order(day: "asc")
    @spend = SpendList.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month).all.order(day: "asc")
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

  def year_month_definition
    m = params[:example2].to_i
    $now_y = Time.current.year
    $now_m = Time.current.month + m
    unless $now_m > 0
      $now_y = $now_y -1
      $now_m = 12 + $now_m
    end
  end

  def income_params
    params.require(:income_list).permit(:income, :content, :day)
  end

  def spend_params
    params.require(:spend_list).permit(:spend, :day, :use)
  end
end

