class UsersController < Clearance::UsersController

  def new
    @user = User.new
    render template: "users/new"
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to '/'
  #   end
  # end

  def show
    @user = User.find(params[:id])
    @shouts = @user.shouts
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
