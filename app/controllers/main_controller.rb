class MainController < ApplicationController
  def index
  end

  def new
    @income = IncomeList.new
    @spend = SpendList.new
  end

  def create
    if params[:income_list][:income]
      IncomeList.create(income_params)
    else
      SpendList.create(spend_params)
    end
    redirect_to root_path
  end

  private
  def income_params
    params.require(:income_list).permit(:income, :content, :day)
  end

  def spend_params
    params.require(:spend_list).permit(:spend, :day, :use)
  end
end

