class LinksController < ApplicationController

  before_action :require_logged_in

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find_by(
      user_id: current_user.id,
      id: params[:id]
    )
    if @link && @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash[:errors] = ["Url can't be blank"]
      render :edit
    end
  end

  def link_params
    params.require(:link).permit(:title, :url, :user_id)
  end

end
