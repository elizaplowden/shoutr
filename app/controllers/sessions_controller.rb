class SessionsController < Clearance::SessionsController
  private

  def authenticate(_)
    super(session_params)
  end

  def session_params
    { session: session_params_with_email }
  end

  def session_params_with_email
    params.
      require(:session).
      permit(:password).
      # won't fail if no user
      merge(email: user.email)
  end

  def user
    # Using a where will return a relation. We want the first result. Either returns user we found or a guest object
    User.where(email: email_or_username).or(User.where(username: email_or_username)).first || Guest.new
  end

  def email_or_username
    params[:session][:email_or_username]
  end
end
