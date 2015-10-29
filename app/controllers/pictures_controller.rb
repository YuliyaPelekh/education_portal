class PicturesController < ApplicationController
  
  def new
    @picture = Picture.new(:album_id => params[:album_id])
    @album = Album.find(params[:album_id])
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      flash[:success] = "Зображення успішно додане"
      redirect_to @picture.album
    else
      render :action => 'new'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "Картинка успішно видалена"
    redirect_to @picture.album
  end

  private

    def picture_params
      params.require(:picture).permit(:album_id, :avatar)
    end
end

