class ImagesController < ApplicationController
  
  def new
    @image = Image.new(:news_id => params[:news_id])
    @news = News.find(params[:news_id])
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Картинка успішно додана"
      redirect_to @image.news
    else
      render :action => 'new'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Картинка успішно видалена"
    redirect_to @image.news
  end

  private

    def image_params
      params.require(:image).permit(:name, :news_id, :avatar)
    end
end