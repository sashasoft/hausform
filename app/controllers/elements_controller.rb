#encoding: utf-8
class ElementsController < ApplicationController
  #load_and_authorize_resource
  
  before_filter :authenticate_user!, :except => [:form, :sum]
  
  def index
    @elements = Element.all
  end
  
  def sum
    @sum = 0;
    if params[:archproject]
      @el = Element.find_by_label("archproject")
      @sum = @sum.to_f + @el.price.to_f
    end
    if params[:plfund]
      @el = Element.find_by_label("plfund")
      @sum = @sum.to_f + @el.price.to_f * params[:plfund].to_f
    end
    if params[:plsten]
      if params[:sip160]
        @el = Element.find_by_label("sip160")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:karkas150]
        @el = Element.find_by_label("karkas150")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:saiding]
        @el = Element.find_by_label("saiding")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:blockhaus]
        @el = Element.find_by_label("blockhaus")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:shtukat]
        @el = Element.find_by_label("shtukat")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:vagonka]
        @el = Element.find_by_label("vagonka")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:gips]
        @el = Element.find_by_label("gips")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:utiplenie]
        @el = Element.find_by_label("utiplenie")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
    end
    #Внутренние перегородки
    if params[:plvnper]
      if params[:sip120]
        @el = Element.find_by_label("sip120")
        @sum = @sum.to_f + @el.price.to_f * params[:plvnper].to_f
      end
      if params[:karkas90]
        @el = Element.find_by_label("karkas90")
        @sum = @sum.to_f + @el.price.to_f * params[:plvnper].to_f
      end
      if params[:vagonka]
        @el = Element.find_by_label("vagonka")
        @sum = @sum.to_f + @el.price.to_f * params[:plvnper].to_f
      end
      if params[:gips]
        @el = Element.find_by_label("gips")
        @sum = @sum.to_f + @el.price.to_f * params[:plvnper].to_f
      end
      if params[:utiplenie100]
        @el = Element.find_by_label("utiplenie100")
        @sum = @sum.to_f + @el.price.to_f * params[:plvnper].to_f
      end
    end
    
    #Потолок
    if params[:plpot]
      if params[:vagonkapot]
        @el = Element.find_by_label("vagonkapot")
        @sum = @sum.to_f + @el.price.to_f * params[:plpot].to_f
      end
      if params[:gipspot]
        @el = Element.find_by_label("gipspot")
        @sum = @sum.to_f + @el.price.to_f * params[:plpot].to_f
      end
    end
    
    #Перекрытие
    if params[:plper]
        @el = Element.find_by_label("perkosb")
        @sum = @sum.to_f + @el.price.to_f * params[:plper].to_f
      if params[:utiplenieper]
        @el = Element.find_by_label("utiplenieper")
        @sum = @sum.to_f + @el.price.to_f * params[:plper].to_f
      end
    end
    
    #Кровля
    if params[:plkrov]
      if params[:bitumkrov]
        @el = Element.find_by_label("bitumkrov")
        @sum = @sum.to_f + @el.price.to_f * params[:plkrov].to_f
      end
      if params[:metkrov]
        @el = Element.find_by_label("metkrov")
        @sum = @sum.to_f + @el.price.to_f * params[:plkrov].to_f
      end
      if params[:utipleniekrov]
        @el = Element.find_by_label("utipleniekrov")
        @sum = @sum.to_f + @el.price.to_f * params[:plkrov].to_f
      end
    end
    
    #Инженерия
    if params[:elektrik]
      @el = Element.find_by_label("elektrik")
      @sum = @sum.to_f + @el.price.to_f * params[:elektrik].to_f
    end
    if params[:vodoprovod]
      @el = Element.find_by_label("vodoprovod")
      @sum = @sum.to_f + @el.price.to_f * params[:vodoprovod].to_f
    end
    if params[:kanalis]
      @el = Element.find_by_label("kanalis")
      @sum = @sum.to_f + @el.price.to_f * params[:kanalis].to_f
    end
    
    #Проемы
    if params[:dver]
      @el = Element.find_by_label("dver")
      @sum = @sum.to_f + @el.price.to_f * params[:dver].to_f
    end
    if params[:plokna]
      @el = Element.find_by_label("plokna")
      @sum = @sum.to_f + @el.price.to_f * params[:plokna].to_f
    end
    
    #Дополнительные надбавки
    if params[:marketing]
      @el = Element.find_by_label("marketing")
      @sum = @sum.to_f + @el.price.to_f
    end
    if params[:logistika]
      @el = Element.find_by_label("logistika")
      @sum = @sum.to_f * @el.price.to_f
    end
    
    if params[:akcionka]
      @el = Element.find_by_label("akcionka")
      @sum = @sum.to_f + @el.price.to_f
    end
    if params[:pribyl]
      @el = Element.find_by_label("pribyl")
      @sum = @sum.to_f * @el.price.to_f
    end
      
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
  end
  
  
  
  private
    def element_params
      params.require(:element).permit(:name, :price)
    end
    
  
end
