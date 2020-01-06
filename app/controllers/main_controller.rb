class MainController < ApplicationController
  $y = 2019
  $m = 12

  def index
    @income = IncomeList.where(day: "#{$y}-#{$m}-15".in_time_zone.all_month).sum(:income)
    @spend = SpendList.where(day: "#{$y}-#{$m}-15".in_time_zone.all_month).sum(:spend)
    @incomes = IncomeList.where(day: "#{$y}-#{$m}-15".in_time_zone.all_month).group(:content).sum(:income)
    @spends = SpendList.where(day: "#{$y}-#{$m}-15".in_time_zone.all_month).group(:use).sum(:spend)
    respond_to do |format|
      format.html 
      format.json
    end
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
    @income = IncomeList.where(day: "#{$y}-#{$m}-15".in_time_zone.all_month).all
    @spend = SpendList.where(day: "#{$y}-#{$m}-15".in_time_zone.all_month).all
  end
  # find(params[:id])

  private
  def income_params
    params.require(:income_list).permit(:income, :content, :day)
  end

  def spend_params
    params.require(:spend_list).permit(:spend, :day, :use)
  end
end

