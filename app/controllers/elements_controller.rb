class ElementsController < ApplicationController
  
  
  before_filter :authenticate_user!, :except => [:form, :sum]
  
  def index
    @elements = Element.all
  end
  
  
      
  
  
  def new
    @element = Element.new
  end
  
  def show
    @element = Element.find(params[:id])
  end
  
  def edit
    @element = Element.find(params[:id])
  end
  
  def create
    @element = Element.new(element_params)
    
    if @element.save
      redirect_to elements_path
    else
      render 'new'
    end
  end
    
  def update
    @element = Element.find(params[:id])
    
    if @element.update(element_params)
      redirect_to elements_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @element = Element.find(params[:id])
    @element.destroy
    
    redirect_to elements_path
  end
  
  def form
    @a
  end
  
  def sum
    @sum = 0;
    if params[:archproject]
      @sum = @sum.to_f + Element.find_by(label: :archproject).price.to_f
    end
    if params[:plfund]
      @sum = @sum.to_f + Element.find_by(label: :plfund).price.to_f * params[:plfund].to_f
    end 
           
  end
  
  
  private
    def element_params
      params.require(:element).permit(:name, :price, :label)
    end
    
  
end
