class PhotoController < ApplicationController
  def index
    @all_photos = Photo.all.order({:created_at => :desc})
    render({:template => "/photo_templates/index.html.erb"})
  end

  def show
    @url_photo_id = params.fetch("photo_id")
    photo_matching  = Photo.where({:id => @url_photo_id})

    @photo = photo_matching.at(0)
    render({:template => "/photo_templates/view.html.erb"})
  end


    def delete
      @photo_delete_id = params.fetch("photo_id")
      matching_photos = Photo.where({:id => @photo_delete_id})

      the_photo = matching_photos.at(0)

      the_photo.destroy

      # render({:template => "/photo_templates/index.html.erb"})
      redirect_to("/photos")
    end
end
