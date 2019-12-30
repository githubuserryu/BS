class MainController < ApplicationController
  def index
    @income = IncomeList.group("MONTH(day)").sum(:income)
    @spend = SpendList.group("MONTH(day)").sum(:spend)
    @incomes = IncomeList.all
  end
  # day = Date.today

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
    # @income = IncomeList.all
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

