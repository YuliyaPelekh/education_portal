class MaterialsController < ApplicationController
  def index
    @videos = Material.where(sort: 'video')
    @audios = Material.where(sort: 'audio')
  end

  def new
  	@material = Material.new
  end

  def create
    @material = Material.new(material_params) 
    if @material.save
      flash[:success] = "Матеріал збережений"
      redirect_to @material
    else
      flash.now[:error] = 'Матеріал не збережений'
      render '/materials/new'
    end 
  end

  def show
  	@material = Material.find(params[:id])
  end 

  def edit
    @material = Material.find(params[:id])
  end

  def update
    @material = Material.find(params[:id])
  if @material.update(material_params)
    redirect_to @material
  else
    render '/materials/edit'
  end
  end

  def destroy
    Material.find(params[:id]).destroy
    flash[:success] = "Матеріал видалений"
    redirect_to materials_path
  end

  private

    def material_params
      params.require(:material).permit(:name, :sort, :description, :video)
    end
end
