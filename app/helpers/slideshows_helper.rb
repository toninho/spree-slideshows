module SlideshowsHelper

  def insert_slideshow(params={})
     content_tag :div, :class => 'slideshow' do
       slide_images(params).each do |slide|
        concat(link_to(image_tag(slide.img.url), slide.url, { :title => slide.name }))
       end
     end
   end

   def slide_images(params)
       max = params[:max]||5
       group = params[:group]||""
       slides = Slide.included.in_group(group)
       extra_slides = Slide.not_included.in_group(group).sort_by { rand }.slice(0...max-slides.count)
       slides = (slides + extra_slides).sort_by { |slide| slide.position }
   end

end
