# frozen_string_literal: true

class FinanceController < ApplicationController
  before_action :finance_find, only: %i[show edit update destroy]
  before_action :require_same_user, only: %i[edit update destroy info]

  def new
    @finance = Finance.new
  end

  def edit; end

  def update
    if @finance.update(finance_params)
      PersonsFinance.where(finance_id: @finance.id)
      params[:finance][:id].each do |person_id|
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
      @finance.people << Person.find(person_id) if person_id.present?
    end
    if @finance.save
      flash[:notice] = 'Category created successfully'
      redirect_to finances_path
    else
      render 'new'
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
      @start_date = Date.today.beginning_of_month
      @end_date = end_of_date(Date.today)
      @finance = Finance.find(params[:id])
      @cash_transactions = CashTransaction.where(persons_finance_id: person_finance(@finance, @start_date, @end_date))
      @sum_amount = @cash_transactions.inject(0) { |sum, t| sum + t.amount }
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

  def finance_find
    if Finance.exists?(params[:id])
      @finance = Finance.find(params[:id])
    else
      redirect_to errors_not_found_path
    end
  end

  def check_empty_params?(params)
    params[:cash_transaction].nil? || params[:cash_transaction][:start_date].nil? || params[:cash_transaction][:start_date].nil?
  end

  def require_same_user
    finance = Finance.find(params[:id])
    return if current_user == finance.people.first.user

    flash[:alert] = 'You can\'t do this'
    redirect_to root_path
  end
end
