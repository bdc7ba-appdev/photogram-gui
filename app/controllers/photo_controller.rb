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

    def add_photo
      img_url = params.fetch("input_image_url")
      img_caption = params.fetch("input_image_caption")
      img_owner_id = params.fetch("input_image_owner_id")

      a_new_photo = Photo.new
      a_new_photo.image = img_url
      a_new_photo.caption = img_caption
      a_new_photo.owner_id = img_owner_id

      a_new_photo.save

      # render({:template => "photo_templates/create.html.erb"})

      redirect_to("/photos/"+a_new_photo.id.to_s)
    end

    def update
      photo_id = params.fetch("change_id")
      matching_photos = Photo.where({:id => photo_id})

      the_photo = matching_photos.at(0)

      new_url = params.fetch("input_image_url")
      new_caption = params.fetch("input_image_caption")

      the_photo.image = new_url
      the_photo.caption = new_caption

      the_photo.save
      


      redirect_to("/photos/"+photo_id.to_s)
    end

    def comment
      commentor_id = params.fetch("input_author_id")
      commented_photo_id = params.fetch("input_photo_id")
      comment = params.fetch("input_image_comment")
      

      a_new_comment = Comment.new
      a_new_comment.photo_id = commented_photo_id
      a_new_comment.author_id = commentor_id
      a_new_comment.body = comment

      a_new_comment.save

      redirect_to("/photos/"+commented_photo_id.to_s)

    end 

end
