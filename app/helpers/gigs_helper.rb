module GigsHelper
  def gig_cover gig
    if gig.photos.attached?
      url_for(gig.photos[0])
    else
      ActionController::Base.helpers.asset_path('icon_default_image.png')
    end
  end

  def basic_pricing gig
    gig.pricings.find { |p| p.pricing_type == "basic" }
  end
end
