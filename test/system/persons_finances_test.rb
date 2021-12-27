# frozen_string_literal: true

require 'application_system_test_case'

class PersonsFinancesTest < ApplicationSystemTestCase
  setup do
    @persons_finance = persons_finances(:one)
  end

  test 'visiting the index' do
    visit persons_finances_url
    assert_selector 'h1', text: 'Persons Finances'
  end

  test 'creating a Persons finance' do
    visit persons_finances_url
    click_on 'New Persons Finance'

    fill_in 'Finance', with: @persons_finance.finance_id
    fill_in 'Person', with: @persons_finance.person_id
    click_on 'Create Persons finance'

    assert_text 'Persons finance was successfully created'
    click_on 'Back'
  end

  test 'updating a Persons finance' do
    visit persons_finances_url
    click_on 'Edit', match: :first

    fill_in 'Finance', with: @persons_finance.finance_id
    fill_in 'Person', with: @persons_finance.person_id
    click_on 'Update Persons finance'

    assert_text 'Persons finance was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Persons finance' do
    visit persons_finances_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Persons finance was successfully destroyed'
  end
end
