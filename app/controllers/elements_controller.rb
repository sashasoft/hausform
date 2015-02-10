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
    
    #steny
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
    
    #vnutren peregorodki
    if params[:plvnper]
      if params[:sip120]
        @sum = @sum.to_f + Element.find_by(label: :sip120).price.to_f * params[:plvnper].to_f
      end
      if params[:karkas90]
        @sum = @sum.to_f + Element.find_by(label: :karkas90).price.to_f * params[:plvnper].to_f
      end
      if params[:vagonka]
        @sum = @sum.to_f + Element.find_by(label: :vagonka).price.to_f * params[:plvnper].to_f
      end
      if params[:gips]
        @sum = @sum.to_f + Element.find_by(label: :gips).price.to_f * params[:plvnper].to_f
      end
      if params[:utiplenie100]
        @sum = @sum.to_f + Element.find_by(label: :utiplenie100).price.to_f * params[:plvnper].to_f
      end
    end
    
    #potolok
    if params[:plpot]
      if params[:vagonkapot]
        @sum = @sum.to_f + Element.find_by(label: :vagonkapot).price.to_f * params[:plpot].to_f
      end
      if params[:gipspot]
        @sum = @sum.to_f + Element.find_by(label: :gipspot).price.to_f * params[:plpot].to_f
      end
    end
           
           
    #perekrytie
    if params[:plper]
        @sum = @sum.to_f + Element.find_by(label: :perekosb).price.to_f * params[:plper].to_f
      if params[:utiplenieper]
        @sum = @sum.to_f + Element.find_by(label: :utiplenieper).price.to_f * params[:plper].to_f
      end
    end
    
    #frovlia
    if params[:plkrov]
      if params[:bitumkrov]
        @sum = @sum.to_f + Element.find_by(label: :bitumkrov).price.to_f * params[:plkrov].to_f
      end
      if params[:metkrov]
        @sum = @sum.to_f + Element.find_by(label: :metkrov).price.to_f * params[:plkrov].to_f
      end
      if params[:utipleniekrov]
        @sum = @sum.to_f + Element.find_by(label: :utipleniekrov).price.to_f * params[:plkrov].to_f
      end
    end
    
    #inzheneria
    if params[:elektrik]
      @sum = @sum.to_f + Element.find_by(label: :elektrik).price.to_f
    end
    if params[:vodoprovod]
       @sum = @sum.to_f + Element.find_by(label: :vodoprovod).price.to_f
    end
    if params[:kanalis]
       @sum = @sum.to_f + Element.find_by(label: :kanalis).price.to_f
    end
    
    #dver
    if params[:dver]
      @sum = @sum.to_f + Element.find_by(label: :dver).price.to_f
    end
    if params[:plokna]
      @sum = @sum.to_f + Element.find_by(label: :plokna).price.to_f * params[:plokna].to_f
    end
    
    #marketing
    if !(@sum == 0)
      if params[:marketing]
        @sum = @sum.to_f + Element.find_by(label: :marketing).price.to_f
      end
      if params[:logistika]
        @sum = @sum.to_f * Element.find_by(label: :logistika).price.to_f
      end
      
      if params[:akcionka]
        @sum = @sum.to_f + Element.find_by(label: :akcionka).price.to_f
      end
      if params[:pribyl]
         @sum = @sum.to_f * Element.find_by(label: :pribyl).price.to_f
      end
    end
    
    
  end
  
  
  private
  
    def element_params
      params.require(:element).permit(:name, :price, :label)
    end
    
  
end
