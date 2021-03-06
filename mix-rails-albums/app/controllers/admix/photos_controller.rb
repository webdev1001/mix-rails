class Admix::PhotosController < Admix::AdmixController
  
  respond_to :json
  respond_to :html, :only => [:upload, :index, :destroy]

  inherit_resources

  before_filter :image_param

  polymorphic_belongs_to :album, param: :album_id

  # TODO: Maybe we need to skip authorization here. But not authetication.

  def update_description
    @album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:id])
    @photo.description = params[:description]
    @photo.save()
    render :json => @photo
  end


  def upload
    render inline: params.to_s
  end

  def image_param
    if params[:image]
      params[:photo] = { image: params[:image] }
    end
  end


end