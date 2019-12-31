json.extract! record, :id, :user_id, :book_id, :due_date, :created_at, :updated_at
json.url record_url(record, format: :json)
