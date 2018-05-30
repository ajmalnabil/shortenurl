class SitesController < ApplicationController
  def show
    # @site = Site.find_by(params[:id])
    @site = Site.find_by_short_url(params[:short_url])
    redirect_to @site.url
  end

  def new
  end
end
