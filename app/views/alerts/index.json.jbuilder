json.array!(@alerts) do |alert|
  json.extract! alert, :id, :name, :user_id, :mail_recipients, :severity
  json.url alert_url(alert, format: :json)
end
