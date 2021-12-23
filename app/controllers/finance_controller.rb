# frozen_string_literal: true

class FinanceController < ApplicationController
  before_action :find_finance, only: %i[show edit update destroy]
  before_action :require_same_user, only: %i[edit update destroy info]

  def new
    @finance = Finance.new
  end

  def edit; end

  def update
    if @finance.update(finance_params)
      PersonsFinance.where(finance_id: @finance.id).destroy_all
      params.require(:finance).permit(:id) do |person_id|
        @finance.people << Person.find(person_id) if person_id.present?
      end
      flash[:notice] = 'Category updated'
      redirect_to finances_path
    else
      render 'edit'
    end
  end

  def create
    @finance = Finance.new(finance_params)
    params[:finance][:id].each do |person_id|
      @finance.people << Person.find(person_id) if person_id.present? # check for empty string in params id field
    end
    if @finance.save
      flash[:notice] = 'Category created successfully'
      redirect_to finances_path
    else
      render :new
    end
  end

  def index
    @finance = current_user.person.collect(&:finances).flatten.uniq
  end

  def destroy
    if @finance.destroy
      flash[:notice] = 'Category deleted successfully'
    else
      flash[:alert] = 'You can\'t do this'
    end
    redirect_to finances_path
  end

  def finance_info
    @start_date = Date.parse(params[:transaction][:start_date])
    @end_date = end_of_date(Date.parse(params[:transaction][:end_date]))
    @finance = Finance.find(params[:id])
    @transactions = Transaction.where(person_category_id: person_finance(@finance, @start_date, @end_date))
    @sum_amount = @transactions.inject(0) { |sum, t| sum + t.amount}
  end

  private

  def person_finance(finance, start_date, end_date)
    PersonsFinance.where(finance_id: finance, created_at: start_date..end_date)
  end

  def end_of_date(date)
    date.to_datetime.end_of_day
  end

  def finance_params
    params.require(:finance).permit(:name, :incomeOrExpence)
  end

  def show
    @finance = Finance.find_by(id: params[:id])
  end

  def find_finance
    if Finance.exists?(params[:id])
      @finance = Finance.find(params[:id])
    else
      redirect_to errors_not_found_path
    end
  end

  def require_same_user
    finance = Finance.find(params[:id])
    return if current_user == finance.people.first.user

    flash[:alert] = 'You can\'t do this'
    redirect_to root_path
  end
end
