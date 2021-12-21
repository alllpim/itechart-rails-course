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

  private

  def finance_params
    params.require(:finance).permit(:name, :incomeOrExpence)
  end

  def show
    @finance = Finance.find_by(id: params[:id])
  end

  def find_finance
    @finance = Finance.find(params[:id])
  end

  def require_same_user
    finance = Finance.find(params[:id])
    return if current_user == finance.people.first.user

    flash[:alert] = 'You can\'t do this'
    redirect_to root_path
  end
end
