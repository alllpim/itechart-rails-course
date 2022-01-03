class CashTransactionsController < ApplicationController
  before_action :find_transaction, only: %i[show edit update destroy]

  # GET /cash_transactions or /cash_transactions.json
  def index
    current_user_persons_finance = PersonsFinance.where(person_id: current_user.person)
    @cash_transactions = CashTransaction.where(persons_finance_id: current_user_persons_finance)
  end

  # GET /cash_transactions/1 or /cash_transactions/1.json
  def show
  end

  # GET /cash_transactions/new
  def new
    @cash_transaction = CashTransaction.new
  end

  # GET /cash_transactions/1/edit
  def edit
  end

  # POST /cash_transactions or /cash_transactions.json
  def create
    @cash_transaction = CashTransaction.new(transaction_params)

    respond_to do |format|
      if @cash_transaction.save
        format.html { redirect_to @cash_transaction, notice: "Transaction was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_transactions/1 or /cash_transactions/1.json
  def update
    respond_to do |format|
      if @cash_transaction.update(transaction_params)
        format.html { redirect_to @cash_transaction, notice: "Transaction was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_transactions/1 or /cash_transactions/1.json
  def destroy
    @cash_transaction.destroy
    respond_to do |format|
      format.html { redirect_to cash_transactions_url, notice: "Transaction was successfully destroyed." }
    end
  end

  def choose_type
    render 'cash_transactions/choose_type'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def find_transaction
    @cash_transaction = CashTransaction.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:cash_transaction).permit(:persons_finance_id, :amount, :is_important)
  end
end
