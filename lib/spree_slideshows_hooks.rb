class SpreeSlideshowsHooks < Spree::ThemeSupport::HookListener  
  insert_after :admin_configurations_menu do
    %(<%= configurations_menu_item t('slideshow_slides'), admin_slides_path, t("manage_slideshow") %>)
  end
  
  insert_after :slideshow do
    %(<%= insert_slideshow(:max => 2, :group => 'Player') %>)
  end
  
  insert_after :banners do
    %(<%= insert_slideshow(:max => 2, :group => 'Banner') %>)
  end
  
  insert_after :inside_head do
    %(<%= javascript_include_tag 'jquery.easing.1.2.js', 'jquery.anythingslider.js' %>
  	<%= stylesheet_link_tag 'slider' %>
  	<script type="text/javascript">

          function formatText(index, panel) {
  		  return index + "";
  	    }

          $(function () {

              $('.anythingSlider').anythingSlider({
                  easing: "easeInOutExpo",        // Anything other than "linear" or "swing" requires the easing plugin
                  autoPlay: true,                 // This turns off the entire FUNCTIONALY, not just if it starts running or not.
                  delay: 7000,                    // How long between slide transitions in AutoPlay mode
                  startStopped: false,            // If autoPlay is on, this can force it to start stopped
                  animationTime: 600,             // How long the slide transition takes
                  hashTags: false,                // Should links change the hashtag in the URL?
                  buildNavigation: true,         	// If true, builds and list of anchor links to link to each slide
              		pauseOnHover: true,             // If true, and autoPlay is enabled, the show will pause on hover
              		startText: "",             		  // Start text
      		        stopText: "",               	  // Stop text
      		        navigationFormatter: formatText // Details at the top of the file on this use (advanced use)
              });

              $("#slide-jump").click(function(){
                  $('.anythingSlider').anythingSlider(6);
              });

          });
      </script>)
  end
 
end
