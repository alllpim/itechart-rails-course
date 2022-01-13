# frozen_string_literal: true

class ChartsController < ApplicationController
  def index
    if empty_params?(params)
      @start_date = Date.today.beginning_of_month
      @end_date = end_of_date(Date.today)
    else
      @start_date = Date.parse(params[:cash_transaction][:start_date])
      @end_date = end_of_date(Date.parse(params[:cash_transaction][:end_date]))
    end
    @finances = current_user.person.collect(&:finances).flatten.uniq
    @income_transactions_for_chart = transactions_by_date(@start_date, @end_date, true)
    @expence_transactions_for_chart = transactions_by_date(@start_date, @end_date, false)
  end

  private

  def empty_params?(params)
    params[:cash_transaction].nil? ||
      params[:cash_transaction][:start_date].nil? ||
      params[:cash_transaction][:end_date].nil?
  end

  def end_of_date(date)
    date.to_datetime.end_of_day
  end

  def transactions_by_date(start_date, end_date, income)
    transactions = []
    finances = Finance.where(incomeOrExpence: income)
    finances.each do |finance|
      transactions += [[finance.name, CashTransaction.where(persons_finance_id: finance.persons_finances,
                                                            created_at: start_date..end_date).sum(:amount)]]
    end
    transactions
  end
end
