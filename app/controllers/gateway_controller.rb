class GatewayController < ApplicationController
  layout false

  def redirect
    url = Url.find_by(slug: slug)

    redirect_to(url.link, status: :moved_permanently)
  end

  private

  def slug
    params[:slug]
  end
end
