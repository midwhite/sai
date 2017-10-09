module HomesHelper
  def cdn_image(path)
    Constants::CDN_DOMAIN + "/assets/images" + path;
  end
end
