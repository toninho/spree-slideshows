#require 'slideshows_helper'

class SpreeSlideshowsHooks < Spree::ThemeSupport::HookListener  
  insert_after :admin_configurations_menu do
    %(<%= configurations_menu_item t('slideshow_slides'), admin_slides_path, t("manage_slideshow") %>)
  end
  
  insert_after :slideshow do
    %(<%= insert_slideshow(:max => 2, :group => 'Home') %>)
  end
  
  insert_after :inside_head do
    %(<%= stylesheet_link_tag 'slideshow.css' %>
      <%= javascript_include_tag 'jquery.cycle.lite.min.js' %>
      <% javascript_tag do %>
    	$(document).ready(function() {
    	 $('.slideshow').cycle({
    	fx: 'fade', // choose your transition type, ex: fade, scrollUp, shuffle, etc...
    	     timeout: 5000
    	});
    	});
    <% end %>)
  end
  
 
end
