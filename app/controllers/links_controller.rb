class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Link added!"
      redirect_to link_path(@link)
    else
      render 'new'
    end
  end

  def show
    @link = Link.find(params[:id])
  end

private
  def link_params
    params.require(:link).permit(:url)
  end
end
