require "test_helper"

class PersonsFinancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @persons_finance = persons_finances(:one)
  end

  test "should get index" do
    get persons_finances_url
    assert_response :success
  end

  test "should get new" do
    get new_persons_finance_url
    assert_response :success
  end

  test "should create persons_finance" do
    assert_difference('PersonsFinance.count') do
      post persons_finances_url, params: { persons_finance: { finance_id: @persons_finance.finance_id, person_id: @persons_finance.person_id } }
    end

    assert_redirected_to persons_finance_url(PersonsFinance.last)
  end

  test "should show persons_finance" do
    get persons_finance_url(@persons_finance)
    assert_response :success
  end

  test "should get edit" do
    get edit_persons_finance_url(@persons_finance)
    assert_response :success
  end

  test "should update persons_finance" do
    patch persons_finance_url(@persons_finance), params: { persons_finance: { finance_id: @persons_finance.finance_id, person_id: @persons_finance.person_id } }
    assert_redirected_to persons_finance_url(@persons_finance)
  end

  test "should destroy persons_finance" do
    assert_difference('PersonsFinance.count', -1) do
      delete persons_finance_url(@persons_finance)
    end

    assert_redirected_to persons_finances_url
  end
end
