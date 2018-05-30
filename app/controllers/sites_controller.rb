class SitesController < ApplicationController
  def show
    @site = Site.find(params[:id])
    redirect_to @site.url
  end

  def new
  end
end
