class ElementsController < ApplicationController
  #load_and_authorize_resource
  before_filter :authenticate_user!, :except => [:form, :sum]
  
  def index
    @elements = Element.all
  end
  
  def sum
    @sum = 0;
    if params[:archproject]
      @el = Element.find_by_name("Архитектурный проект")
      @sum = @sum.to_f + @el.price.to_f
    end
    if params[:plfund]
      @el = Element.find_by_name("Площадь фундамента")
      @sum = @sum.to_f + @el.price.to_f * params[:plfund].to_f
    end
    if params[:plsten]
      if params[:sip160]
        @el = Element.find_by_name("Стены несущие СИП 160")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:karkas150]
        @el = Element.find_by_name("Стены несущие Каркас 150")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:saiding]
        @el = Element.find_by_name("Фасад сайдинг")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:blockhaus]
        @el = Element.find_by_name("Фасад блокхаус")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:shtukat]
        @el = Element.find_by_name("Фасад короед")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:vagonka]
        @el = Element.find_by_name("Вагонка стены")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:gips]
        @el = Element.find_by_name("Гипсокартон стены")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
      if params[:utiplenie]
        @el = Element.find_by_name("Утепление стен 150 мм каркас")
        @sum = @sum.to_f + @el.price.to_f * params[:plsten].to_f
      end
    end
    #Внутренние перегородки
    if params[:plvnper]
      if params[:sip120]
        @el = Element.find_by_name("Перегородки СИП 120")
        @sum = @sum.to_f + @el.price.to_f * params[:plvnper].to_f
      end
      if params[:karkas90]
        @el = Element.find_by_name("Перегородки каркасные 90")
        @sum = @sum.to_f + @el.price.to_f * params[:plvnper].to_f
      end
      if params[:vagonka]
        @el = Element.find_by_name("Вагонка стены")
        @sum = @sum.to_f + @el.price.to_f * params[:plvnper].to_f
      end
      if params[:gips]
        @el = Element.find_by_name("Гипсокартон стены")
        @sum = @sum.to_f + @el.price.to_f * params[:plvnper].to_f
      end
      if params[:utiplenie100]
        @el = Element.find_by_name("Утепление стен 100 мм каркас")
        @sum = @sum.to_f + @el.price.to_f * params[:plvnper].to_f
      end
    end
    
    #Потолок
    if params[:plpot]
      if params[:vagonkapot]
        @el = Element.find_by_name("Вагонка потолок")
        @sum = @sum.to_f + @el.price.to_f * params[:plpot].to_f
      end
      if params[:gipspot]
        @el = Element.find_by_name("Гипсокартон потолок")
        @sum = @sum.to_f + @el.price.to_f * params[:plpot].to_f
      end
    end
    
    #Перекрытие
    if params[:plper]
        @el = Element.find_by_name("Перекрытие с ОСБ")
        @sum = @sum.to_f + @el.price.to_f * params[:plper].to_f
      if params[:utiplenieper]
        @el = Element.find_by_name("Утепление перекрытия")
        @sum = @sum.to_f + @el.price.to_f * params[:plper].to_f
      end
    end
    
    #Кровля
    if params[:plkrov]
      if params[:bitumkrov]
        @el = Element.find_by_name("Кровля Битумка")
        @sum = @sum.to_f + @el.price.to_f * params[:plkrov].to_f
      end
      if params[:metkrov]
        @el = Element.find_by_name("Кровля Металлочерепица")
        @sum = @sum.to_f + @el.price.to_f * params[:plkrov].to_f
      end
      if params[:utipleniekrov]
        @el = Element.find_by_name("Утепление кровли")
        @sum = @sum.to_f + @el.price.to_f * params[:plkrov].to_f
      end
    end
    
    #Инженерия
    if params[:elektrik]
      @el = Element.find_by_name("Электрика")
      @sum = @sum.to_f + @el.price.to_f * params[:elektrik].to_f
    end
    if params[:vodoprovod]
      @el = Element.find_by_name("Водопровод")
      @sum = @sum.to_f + @el.price.to_f * params[:vodoprovod].to_f
    end
    if params[:kanalis]
      @el = Element.find_by_name("Канализация")
      @sum = @sum.to_f + @el.price.to_f * params[:kanalis].to_f
    end
    
    #Проемы
    if params[:dver]
      @el = Element.find_by_name("Входная дверь")
      @sum = @sum.to_f + @el.price.to_f * params[:dver].to_f
    end
    if params[:plokna]
      @el = Element.find_by_name("Площадь окон")
      @sum = @sum.to_f + @el.price.to_f * params[:plokna].to_f
    end
    
    #Дополнительные надбавки
    if params[:marketing]
      @el = Element.find_by_name("Маркетинговая наценка")
      @sum = @sum.to_f + @el.price.to_f
    end
    if params[:logistika]
      @el = Element.find_by_name("Логистика наценка")
      @sum = @sum.to_f * @el.price.to_f
    end
    
    if params[:akcionka]
      @el = Element.find_by_name("Акционная наценка")
      @sum = @sum.to_f + @el.price.to_f
    end
    if params[:pribyl]
      @el = Element.find_by_name("Прибыльная наценка")
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
