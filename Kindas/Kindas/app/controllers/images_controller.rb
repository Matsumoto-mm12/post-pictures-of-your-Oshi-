class ImagesController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    
    @images = Image.all
    @images_asc = Image.asc
    @images_desc = Image.desc
    
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Image.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end
  
  
  def new
    @image = Image.new
  end
  
  def create
    #モデルを生成する
    title = params[:image][:title]
    file = params[:image][:file].read
    Image.create(title: title, file: file)
    
    redirect_to '/'
  end
  
  def show
    @image = Image.find(params[:id])
    
  end
  
  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to '/'
  end
  
  def update
    image = Image.find(params[:id])
    title = params[:image][:title]
    file = params[:image][:file].read
    image.update(title: title, file: file)
    redirect_to '/'  
  end
  
  def edit
    @image = Image.find(params[:id])
  end
  
  def get_image
    image = Image.find(params[:id])
    send_data image.file, disposition: :inline, type: 'image/png'
  end
  
end
