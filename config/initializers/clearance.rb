Clearance.configure do |config|
  # will prevent Clearance from creating its own routes
  config.routes = false
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
end
