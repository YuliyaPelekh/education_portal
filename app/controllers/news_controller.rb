class NewsController < ApplicationController

  def index
  	@news = News.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end

  def new
  	@new = News.new
  end

  def create
    @new = News.new(new_params) 
    if @new.save
      flash[:success] = "Стаття збережена"
      redirect_to @new
    else
      flash.now[:error] = 'Стаття не збережена, заголовок повинен містити мінімум 5 символів, текст - 10 символів'
      render '/news/new'
    end 
  end

  def show
  	@new = News.find(params[:id])
  end 

  def edit
    @new = News.find(params[:id])
  end

  def update
    @new = News.find(params[:id])
 
  if @new.update(new_params)
    redirect_to @new
  else
    render '/news/edit'
  end
  end

  def destroy
    News.find(params[:id]).destroy
    flash[:success] = "Новина видалена"
    redirect_to news_index_url
  end

  private

    def new_params
      params.require(:news).permit(:title, :text)
    end
end
