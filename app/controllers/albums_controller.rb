class AlbumsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
  	@albums = Album.all
  end

  def new
  	@album = Album.new
  end

  def create
    @album = Album.new(album_params) 
    if @album.save
      flash[:success] = "Альбом збережений"
      redirect_to @album
    else
      flash.now[:error] = 'Альбом не збережений'
      render '/albums/new'
    end 
  end

  def show
  	@album = Album.find(params[:id])
    @pictures = @album.pictures
  end 

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
  if @album.update(album_params)
    redirect_to @album
  else
    render '/albums/edit'
  end
  end

  def destroy
    Album.find(params[:id]).destroy
    flash[:success] = "Альбом видалений"
    redirect_to albums_path
  end

  private

    def album_params
      params.require(:album).permit(:title, :description, picture_attributes: [:album_id, :avatar])
    end
end
