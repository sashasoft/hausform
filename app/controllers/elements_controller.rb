class ElementsController < ApplicationController
  before_filter :authenticate_user!, :except => [:form, :sum]
  load_and_authorize_resource
  
  def index
    @elements = Element.all
  end
  
  def new
    @element = Element.new
  end
  
  def show
  end
  
  def edit
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
    
  #####################################################
  #####################################################
  #####################################################
    
  def sum
    @hh = [];
    @ht = [];      
    @sum = 0;
    
    if params[:archproject].to_f > 0
      @sum = @sum.to_f + Element.find_by(label: :archproject).price.to_f
    end
    
    
    if params[:plfund].to_f > 0
      @sum = @sum.to_f + Element.find_by(label: :plfund).price.to_f * params[:plfund].to_f;
      @hh.push({"name" => Element.find_by(label: :plfund).name.to_s, "value" => params[:plfund].to_f})
    end
        
    
    
    #steny
    if params[:plsten].to_f > 0
      if params[:sip160]
        @sum = @sum.to_f + Element.find_by(label: :sip160).price.to_f * params[:plsten].to_f
        @hh.push({"name" => Element.find_by(label: :sip160).name, "value" => params[:plsten].to_f})
      end
       if params[:karkas150]
        @sum = @sum.to_f + Element.find_by(label: :karkas150).price.to_f * params[:plsten].to_f
        @hh.push({"name" => Element.find_by(label: :karkas150).name, "value" => params[:plsten].to_f})
       end
      if params[:utiplenie]
        @sum = @sum.to_f + Element.find_by(label: :utiplenie).price.to_f * params[:plsten].to_f;
        @hh.push({"name" => Element.find_by(label: :utiplenie).name, "value" => params[:plsten].to_f})
      end
      if params[:saiding]
        @sum = @sum.to_f + Element.find_by(label: :saiding).price.to_f * params[:plsten].to_f
        @hh.push({"name" => Element.find_by(label: :saiding).name, "value" => params[:plsten].to_f})
      end
      if params[:blockhaus]
        @sum = @sum.to_f + Element.find_by(label: :blockhaus).price.to_f * params[:plsten].to_f
        @hh.push({"name" => Element.find_by(label: :blockhaus).name, "value" => params[:plsten].to_f})
      end
      if params[:shtukat]
        @sum = @sum.to_f + Element.find_by(label: :shtukat).price.to_f * params[:plsten].to_f
        @hh.push({"name" => Element.find_by(label: :shtukat).name, "value" => params[:plsten].to_f})
      end
      if params[:vagonka]
        @sum = @sum.to_f + Element.find_by(label: :vagonka).price.to_f * params[:plsten].to_f
        @hh.push({"name" => Element.find_by(label: :vagonka).name, "value" => params[:plsten].to_f})
      end
      if params[:gips]
        @sum = @sum.to_f + Element.find_by(label: :gips).price.to_f * params[:plsten].to_f
        @hh.push({"name" => Element.find_by(label: :gips).name, "value" => params[:plsten].to_f})
      end
    end
    
   
    


    
        
        
    
    #vnutren peregorodki
    if params[:plvnper].to_f > 0
      if params[:sip120]
        @sum = @sum.to_f + Element.find_by(label: :sip120).price.to_f * params[:plvnper].to_f
        @hh.push({"name" => Element.find_by(label: :sip120).name, "value" => params[:plvnper].to_f})
      end
      if params[:karkas90]
        @sum = @sum.to_f + Element.find_by(label: :karkas90).price.to_f * params[:plvnper].to_f
        @hh.push({"name" => Element.find_by(label: :karkas90).name, "value" => params[:plvnper].to_f})
      end
      if params[:vagonkaperegorodka]
        @sum = @sum.to_f + Element.find_by(label: :vagonkaperegorodka).price.to_f * params[:plvnper].to_f * 2
        @hh.push({"name" => Element.find_by(label: :vagonkaperegorodka).name.to_s, "value" => params[:plvnper].to_f*2})
      end
      if params[:gipsperegorodka]
        @sum = @sum.to_f + Element.find_by(label: :gipsperegorodka).price.to_f * params[:plvnper].to_f * 2
        @hh.push({"name" => Element.find_by(label: :gipsperegorodka).name, "value" => params[:plvnper].to_f*2})
      end
      if params[:utiplenie100]
        @sum = @sum.to_f + Element.find_by(label: :utiplenie100).price.to_f * params[:plvnper].to_f
        @hh.push({"name" => Element.find_by(label: :utiplenie100).name, "value" => params[:plvnper].to_f})
      end
    end
    
    
    #potolok
    if params[:plpot].to_f > 0
      if params[:vagonkapot]
        @sum = @sum.to_f + Element.find_by(label: :vagonkapot).price.to_f * params[:plpot].to_f
        @hh.push({"name" => Element.find_by(label: :vagonkapot).name, "value" => params[:plpot].to_f})
      end
      if params[:gipspot]
        @sum = @sum.to_f + Element.find_by(label: :gipspot).price.to_f * params[:plpot].to_f
        @hh.push({"name" => Element.find_by(label: :gipspot).name, "value" => params[:plpot].to_f})
      end
    end
    
    
    #perekrytie
    if params[:plper].to_f > 0
      @sum = @sum.to_f + Element.find_by(label: :perekosb).price.to_f * params[:plper].to_f
      @hh.push({"name" => Element.find_by(label: :perekosb).name, "value" => params[:plper].to_f})
      if params[:utiplenieper]
        @sum = @sum.to_f + Element.find_by(label: :utiplenieper).price.to_f * params[:plper].to_f
        @hh.push({"name" => Element.find_by(label: :utiplenieper).name, "value" => params[:plper].to_f})
      end
    end
    
    
    #krovlia
    if params[:plkrov].to_f > 0
      @sum = @sum.to_f + Element.find_by(label: :krovlia).price.to_f * params[:plkrov].to_f
      @hh.push({"name" => Element.find_by(label: :krovlia).name, "value" => params[:plkrov].to_f})
      if params[:bitumkrov]
        @sum = @sum.to_f + Element.find_by(label: :bitumkrov).price.to_f * params[:plkrov].to_f
        @hh.push({"name" => Element.find_by(label: :bitumkrov).name, "value" => params[:plkrov].to_f})
      end
      if params[:metkrov]
        @sum = @sum.to_f + Element.find_by(label: :metkrov).price.to_f * params[:plkrov].to_f
        @hh.push({"name" => Element.find_by(label: :metkrov).name, "value" => params[:plkrov].to_f})
      end
      if params[:utipleniekrov]
        @sum = @sum.to_f + Element.find_by(label: :utipleniekrov).price.to_f * params[:plkrov].to_f
        @hh.push({"name" => Element.find_by(label: :utipleniekrov).name, "value" => params[:plkrov].to_f})
      end
    end
    
    
    
      
      
    #dver
    if params[:dver]
      @sum = @sum.to_f + Element.find_by(label: :dver).price.to_f
      @ht.push({"name" => Element.find_by(label: :dver).name, "value" => "+"})
    end
    if params[:plokna].to_f > 0
      @sum = @sum.to_f + Element.find_by(label: :plokna).price.to_f * params[:plokna].to_f
      @hh.push({"name" => Element.find_by(label: :plokna).name, "value" => params[:plokna].to_f})
    end
    
    
    
    #inzheneria
    if params[:elektrik]
      @sum = @sum.to_f + Element.find_by(label: :elektrik).price.to_f
      @ht.push({"name" => Element.find_by(label: :elektrik).name, "value" => "+"})
    end
    if params[:vodoprovod]
      @sum = @sum.to_f + Element.find_by(label: :vodoprovod).price.to_f
      @ht.push({"name" => Element.find_by(label: :vodoprovod).name, "value" => "+"})
    end
    if params[:kanalis]
      @sum = @sum.to_f + Element.find_by(label: :kanalis).price.to_f
      @ht.push({"name" => Element.find_by(label: :kanalis).name, "value" => "+"})
      end
    if params[:otoplenie]
      @sum = @sum.to_f + Element.find_by(label: :otoplenie).price.to_f
      @ht.push({"name" => Element.find_by(label: :otoplenie).name, "value" => "+"})
    end
      
      
    
    
    #marketing
    if !(@sum.to_f == 0)
      @sum = @sum.to_f + Element.find_by(label: :marketing).price.to_f
      @sum = @sum.to_f + Element.find_by(label: :logistika).price.to_f
      if params[:akcionka]
        @sum = @sum.to_f + Element.find_by(label: :akcionka).price.to_f
      end
      if params[:regional]
        @sum = @sum.to_f + Element.find_by(label: :regional).price.to_f
      end
      
      
      
      if @sum.to_f >= Element.find_by(label: :sum2).price.to_f
        @sum = @sum.to_f * Element.find_by(label: :nacenka14).price.to_f
      elsif @sum.to_f >= Element.find_by(label: :sum1).price.to_f
        @sum = @sum.to_f * Element.find_by(label: :nacenka15).price.to_f
      else
        @sum = @sum.to_f * Element.find_by(label: :pribyl).price.to_f
      end
      
      
    end
  end

  
  
  private
    def element_params
      params.require(:element).permit(:name, :price, :label)
    end
        
 end
