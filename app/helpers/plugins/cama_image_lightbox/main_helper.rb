module Plugins::CamaImageLightbox::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  # here all actions on going to active
  # you can run sql commands like this:
  # results = ActiveRecord::Base.connection.execute(query);
  # plugin: plugin model
  def cama_image_lightbox_on_active(plugin)
  end

  # here all actions on going to inactive
  # plugin: plugin model
  def cama_image_lightbox_on_inactive(plugin)
  end

  # here all actions to upgrade for a new version
  # plugin: plugin model
  def cama_image_lightbox_on_upgrade(plugin)
  end

  def cama_image_lightbox_before_app
    shortcode_add("lightbox", lambda{|attrs, args|
      @_lightbox_counter ||= 1
      id = "lightbox_shortcode_#{@_lightbox_counter}"
      append_asset_libraries({"lightbox"=>{js: [plugin_asset("jquery.magnific-popup.min")], css: [plugin_asset('magnific-popup')] } })
      if attrs['images']
        res = "<div id='#{id}' class='shortcode_lightbox_w'>"
        attrs['images'].split(',').each do |img|
          res << "<a href='#{img}'><img src='#{img.cama_parse_image_version}'></a>"
        end
        res << '</div>'
        res << "<script>jQuery(function(){ $('##{id}').magnificPopup({delegate: 'a', type: 'image', gallery:{enabled: true}}); })</script>"
      else
        res = "<a class='shortcode_lightbox' id='lightbox_shortcode_#{@_lightbox_counter}' href='#{attrs['url']}'>#{args[:shortcode_content] || attrs['title'] }</a>"
        res << "<script>jQuery(function(){ $('##{id}').magnificPopup({type: 'image'}); })</script>"
      end
      @_lightbox_counter += 1
      res
    }, 'Render a lightbox image to open in a magnific popup, sample:
          [lightbox url="http://camaleon.tuzitio.com/"]<img alt="" src="http://....">[/lightbox] Or
          [lightbox url="http://camaleon.tuzitio.com/" title="My Link"] Or
          [lightbox images="http://camaleon.tuzitio.com/"]')
  end
end
