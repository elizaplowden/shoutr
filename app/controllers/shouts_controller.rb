class ShoutsController < ApplicationController
  def show
    @shout = Shout.find(params[:id])
  end


  def create
    # to persist our shouts
    shout = current_user.shouts.create(shout_params)
    # message if shout is not successful
    redirect_to homes_root_path, redirect_options_for(shout)
  end

  def shout_params
    { content: content_from_params }
  end

  def content_from_params
    TextShout.new(content_params)
  end

  def content_params
    params.require(:shout).require(:content).permit(:body)
  end

  def redirect_options_for(shout)
    if shout.persisted?
      { notice: "Shouted!" }
    else
      { alert: "Could not shout" }
    end
  end

end
