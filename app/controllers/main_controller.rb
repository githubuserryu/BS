class MainController < ApplicationController
  def index
    @income = IncomeList.group("MONTH(day)").sum(:income)
    @spend = SpendList.group("MONTH(day)").sum(:spend)
    y = 2019
    m = 12
    d = "#{y}-#{m}-15"
    @incomes = IncomeList.where(day: d.in_time_zone.all_month).group(:content).sum(:income)
    @spends = SpendList.where(day: d.in_time_zone.all_month).group(:use).sum(:spend)
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
    @income = IncomeList.group("MONTH(day)",:content).sum(:income)
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

