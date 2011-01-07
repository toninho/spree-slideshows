module SlideshowsHelper

  def insert_slideshow(params={})
     content = ''
     output = ''     
     
     if params[:group] == 'Player'
       slide_images(params).each { |slide| content << content_tag(:li, content_tag(:a, image_tag(slide.img.url), :title => slide.name, :href => slide.url)) }
       
       output << content_tag(:div, :class => 'anythingSlider') do
         content_tag(:div, content_tag(:ul, content.html_safe), :class => 'wrapper')
       end
      else
        slide_images(params).each { |slide| content << content_tag(:a, image_tag(slide.img.url), :title => slide.name, :href => slide.url) }
        output << content_tag(:div, content.html_safe, :class => 'Banner')
      end
     output.html_safe
   end

   def slide_images(params)
       max = params[:max]||5
       group = params[:group]||""
       slides = Slide.included.in_group(group)
       extra_slides = Slide.not_included.in_group(group).sort_by { rand }.slice(0...max-slides.count)
       slides = (slides + extra_slides).sort_by { |slide| slide.position }
   end

end
