require "application_system_test_case"

class FinancesTest < ApplicationSystemTestCase
  setup do
    @finance = finances(:one)
  end

  test "visiting the index" do
    visit finances_url
    assert_selector "h1", text: "Finances"
  end

  test "creating a Finance" do
    visit finances_url
    click_on "New Finance"

    fill_in "Count", with: @finance.count
    fill_in "Name", with: @finance.name
    click_on "Create Finance"

    assert_text "Finance was successfully created"
    click_on "Back"
  end

  test "updating a Finance" do
    visit finances_url
    click_on "Edit", match: :first

    fill_in "Count", with: @finance.count
    fill_in "Name", with: @finance.name
    click_on "Update Finance"

    assert_text "Finance was successfully updated"
    click_on "Back"
  end

  test "destroying a Finance" do
    visit finances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Finance was successfully destroyed"
  end
end
