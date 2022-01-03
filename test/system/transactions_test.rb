require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  setup do
    @cash_transactions = transactions(:one)
  end

  test "visiting the index" do
    visit transactions_url
    assert_selector "h1", text: "cash_transactions"
  end

  test "creating a cash_transactions" do
    visit transactions_url
    click_on "New cash_transactions"

    fill_in "Amount", with: @cash_transactions.amount
    check "Is important" if @cash_transactions.is_important
    fill_in "Persons finance", with: @cash_transactions.persons_finance_id
    click_on "Create cash_transactions"

    assert_text "cash_transactions was successfully created"
    click_on "Back"
  end

  test "updating a cash_transactions" do
    visit transactions_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @cash_transactions.amount
    check "Is important" if @cash_transactions.is_important
    fill_in "Persons finance", with: @cash_transactions.persons_finance_id
    click_on "Update cash_transactions"

    assert_text "cash_transactions was successfully updated"
    click_on "Back"
  end

  test "destroying a cash_transactions" do
    visit transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "cash_transactions was successfully destroyed"
  end
end
