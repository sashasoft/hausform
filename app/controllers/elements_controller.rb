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
  ##@sum = @sum.to_f + Element.find_by(label: :).price.to_f * params[:].to_f
  def sum
    @sum = 0;
    if params[:archproject]
      @sum = @sum.to_f + Element.find_by(label: :archproject).price.to_f
    end
    if params[:plfund]
      @sum = @sum.to_f + Element.find_by(label: :plfund).price.to_f * params[:plfund].to_f
    end 
    
    
    if params[:plsten]
      if params[:sip160]
       @sum = @sum.to_f + Element.find_by(label: :sip160).price.to_f * params[:plsten].to_f
      end
      if params[:karkas150]
        @sum = @sum.to_f + Element.find_by(label: :karkas150).price.to_f * params[:plsten].to_f
      end
      if params[:saiding]
        @sum = @sum.to_f + Element.find_by(label: :saiding).price.to_f * params[:plsten].to_f
      end
      if params[:blockhaus]
         @sum = @sum.to_f + Element.find_by(label: :blockhaus).price.to_f * params[:plsten].to_f
      end
      if params[:shtukat]
        @sum = @sum.to_f + Element.find_by(label: :shtukat).price.to_f * params[:plsten].to_f
      end
      if params[:vagonka]
        @sum = @sum.to_f + Element.find_by(label: :vagonka).price.to_f * params[:plsten].to_f
      end
      if params[:gips]
         @sum = @sum.to_f + Element.find_by(label: :gips).price.to_f * params[:plsten].to_f
      end
      if params[:utiplenie]
       @sum = @sum.to_f + Element.find_by(label: :utiplenie).price.to_f * params[:plsten].to_f
      end
    end
           
  end
  
  
  private
  
    def element_params
      params.require(:element).permit(:name, :price, :label)
    end
    
  
end
