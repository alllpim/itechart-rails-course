# frozen_string_literal: true

class CashTransactionsController < ApplicationController
  before_action :find_transaction, only: %i[show edit update destroy]

  # GET /cash_transactions or /cash_transactions.json
  def index
    current_user_persons_finance = PersonsFinance.where(person_id: current_user.person)
    @cash_transactions = CashTransaction.where(persons_finance_id: current_user_persons_finance)
  end

  # GET /cash_transactions/1 or /cash_transactions/1.json
  def show; end

  # GET /cash_transactions/new
  def new
    @cash_transaction = CashTransaction.new
    if params.permit(:transaction)[:transaction] == 'income'
      render 'cash_transactions/income'
    else
      render 'cash_transactions/expence'
    end
  end

  # GET /cash_transactions/1/edit
  def edit; end

  # POST /cash_transactions or /cash_transactions.json

  # PATCH/PUT /cash_transactions/1 or /cash_transactions/1.json
  def update
    if @cash_transaction.update(transaction_params)
      flash[:notice] = 'Money transaction was successfully updated.'
      redirect_to cash_transactions_path
    else
      render 'edit'
    end
  end

  # DELETE /cash_transactions/1 or /cash_transactions/1.json
  def destroy
    @cash_transaction.destroy
    respond_to do |format|
      format.html { redirect_to cash_transactions_url, notice: 'Transaction was successfully destroyed.' }
    end
  end

  def choose_type; end

  def income
    @cash_transaction = CashTransaction.new(transaction_params)
    add_note(@cash_transaction)
    if @cash_transaction.save
      redirect_to cash_transactions_path
      flash[:notice] = 'Transation created successfully'
    else
      redirect_to cash_transactions_income_path
    end
  end

  def expence
    @cash_transaction = CashTransaction.new(transaction_params)
    add_note(@cash_transaction)
    if @cash_transaction.save
      redirect_to @cash_transaction
      flash[:notice] = 'Transation created successfully'
    else
      redirect_to cash_transactions_expence_path
    end
  end

  def important_transaction
    current_user_persons_finance = PersonsFinance.where(person_id: current_user.person)
    cash_transactions = CashTransaction.where(persons_finance_id: current_user_persons_finance)
    @cash_transactions = cash_transactions.where(is_important: true)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_transaction
    @cash_transaction = CashTransaction.find(params[:id])
  end

  def add_note(transaction)
    note = Note.new(note_text: params.require(:cash_transaction).permit(:note).values[0])
    if note.valid? && note.save
      transaction.update(note: note)
    else
      flash[:alert] = 'Note was not added'
    end
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:cash_transaction).permit(:persons_finance_id, :amount, :is_important, :note_id)
  end
end
