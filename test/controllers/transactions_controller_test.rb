require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_transactions = transactions(:one)
  end

  test "should get index" do
    get cash_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_cash_transaction_url
    assert_response :success
  end

  test "should create cash_transactions" do
    assert_difference('cash_transactions.count') do
      post cash_transactions_url, params: { cash_transactions: { amount: @cash_transactions.amount, is_important: @cash_transactions.is_important, persons_finance_id: @cash_transactions.persons_finance_id } }
    end

    assert_redirected_to cash_transaction_url(CashTransaction.last)
  end

  test "should show cash_transactions" do
    get cash_transaction_url(@cash_transactions)
    assert_response :success
  end

  test "should get edit" do
    get edit_cashTransaction_url(@cash_transactions)
    assert_response :success
  end

  test "should update cash_transactions" do
    patch cashTransaction_url(@cash_transactions), params: { cash_transactions: { amount: @cash_transactions.amount, is_important: @cash_transactions.is_important, persons_finance_id: @cash_transactions.persons_finance_id } }
    assert_redirected_to cashTransaction_url(@cash_transactions)
  end

  test "should destroy cash_transactions" do
    assert_difference('cash_transactions.count', -1) do
      delete cashTransaction_url(@cash_transactions)
    end

    assert_redirected_to transactions_url
  end
end
