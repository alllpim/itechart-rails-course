json.extract! transaction, :id, :persons_finance_id, :amount, :is_important, :created_at, :updated_at
json.url cashTransaction_url(transaction, format: :json)
