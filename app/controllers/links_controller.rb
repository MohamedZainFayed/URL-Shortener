class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def create
    @link = Link.init(link_params)
    if @link.save 
      render "show"
    else
      flash[:error] = @link.errors.full_messages
      redirect_to :action => 'index'
    end
  end

  def redirect_slug
    link = Link.find_by_slug(params[:slug])
    raise ActionController::RoutingError.new('Not Found') if link.nil?
    redirect_to link.url
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
