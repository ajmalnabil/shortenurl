class SitesController < ApplicationController
  def show
    # @site = Site.find_by(params[:id])
    @site = Site.find_by_short_url(params[:short_url])
    redirect_to @site.url
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      # successful submission of URL
    else
      render 'new'
    end
  end

  private

  def site_params
    params.require(:site).permit(:url)
  end
end
