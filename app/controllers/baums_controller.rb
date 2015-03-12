class BaumsController < ApplicationController
  before_filter :authenticate_user!, :except => [:form, :sum]
  load_and_authorize_resource
  def index
    @baums = Baum.all
    respond_to do |format|
      format.html
      format.csv { send_data @baums.to_csv }
      format.xls
    end
  end
  
  def new
    @baum = Baum.new
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @baum = Baum.new(baum_params)
    
    if @baum.save
      redirect_to baums_path
    else
      render 'new'
    end
  end
    
  def update
    if @baum.update(baum_params)
      redirect_to baums_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @baum = Baum.find(params[:id])
    @baum.destroy
    
    redirect_to baums_path
  end
  
  def form
  end
  #####################################################
  #####################################################
  #####################################################
  def sum
  
    temp = Baum.new
    @hh = [];
    @sum = 0;
    
    if params[:archproject].to_f > 0
      @sum = @sum.to_f + Baum.find_by(label: :archproject).price.to_f
    end

    if params[:plfund].to_f > 0
      @sum = @sum.to_f + Baum.find_by(label: :plfund).price.to_f * params[:plfund].to_f;
      temp = Baum.find_by(label: :plfund)
      @hh.push({"name" => temp.name.to_s, "value" => temp.price.to_f * params[:plfund].to_f})
    end
    
    
    #steny
    if params[:plsten].to_f > 0
      if params[:dikii]
        if params[:dikii200]
          @sum = @sum.to_f + Baum.find_by(label: :dikii200).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :dikii200).name, "value" => params[:plsten]})
        end
        if params[:dikii240]
          @sum = @sum.to_f + Baum.find_by(label: :dikii240).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :dikii240).name, "value" => params[:plsten]})
        end
        if params[:dikii260]
          @sum = @sum.to_f + Baum.find_by(label: :dikii260).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :dikii260).name, "value" => params[:plsten]})
        end
        if params[:dikii300]
          @sum = @sum.to_f + Baum.find_by(label: :dikii300).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :dikii300).name, "value" => params[:plsten]})
        end
      end
      
      if params[:cylindr]
        if params[:cylindr200]
          @sum = @sum.to_f + Baum.find_by(label: :cylindr200).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :cylindr200).name, "value" => params[:plsten]})
        end
        if params[:cylindr240]
          @sum = @sum.to_f + Baum.find_by(label: :cylindr240).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :cylindr240).name, "value" => params[:plsten]})
        end
        if params[:cylindr260]
          @sum = @sum.to_f + Baum.find_by(label: :cylindr260).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :cylindr260).name, "value" => params[:plsten]})
        end
        if params[:cylindr300]
          @sum = @sum.to_f + Baum.find_by(label: :cylindr300).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :cylindr300).name, "value" => params[:plsten]})
        end
      end
       
      if params[:profil]
        if params[:profil150]
          @sum = @sum.to_f + Baum.find_by(label: :profil150).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :profil150).name, "value" => params[:plsten]})
        end
        if params[:profil180]
          @sum = @sum.to_f + Baum.find_by(label: :profil180).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :profil180).name, "value" => params[:plsten]})
        end
        if params[:profil200]
          @sum = @sum.to_f + Baum.find_by(label: :profil200).price.to_f * params[:plsten].to_f
          @hh.push({"name" => Baum.find_by(label: :profil200).name, "value" => params[:plsten]})
        end
      end
    end
    
    #pokraska
    if params[:pokraska]
      @sum = @sum.to_f + Baum.find_by(label: :pokraska).price.to_f * params[:plsten].to_f
      @hh.push({"name" => Baum.find_by(label: :pokraska).name, "value" => params[:plsten]})
    end
    
       
    
    
    #potolok
    if params[:plpot].to_f > 0
      if params[:vagonka]
      @sum = @sum.to_f + Baum.find_by(label: :vagonka).price.to_f * params[:plpot].to_f
      @hh.push({"name" => Baum.find_by(label: :vagonka).name, "value" => params[:plpot]})
      end
    end
    
    
    #perekrytie
    if params[:plper].to_f > 0
      @sum = @sum.to_f + Baum.find_by(label: :plper).price.to_f * params[:plper].to_f
      @hh.push({"name" => Baum.find_by(label: :plper).name, "value" => params[:plper]})
      
      if params[:doskasosna]
        @sum = @sum.to_f + Baum.find_by(label: :doskasosna).price.to_f * params[:plper].to_f
        @hh.push({"name" => Baum.find_by(label: :doskasosna).name, "value" => params[:plper]})
      end
      
      if params[:utiplenieper]
        @sum = @sum.to_f + Baum.find_by(label: :utiplenieper).price.to_f * params[:plper].to_f
        @hh.push({"name" => Baum.find_by(label: :utiplenieper).name, "value" => params[:plper]})
      end
    end
    
    
    #krovlia
    if params[:plkrov].to_f > 0
      @sum = @sum.to_f + Baum.find_by(label: :stropsistema).price.to_f * params[:plkrov].to_f
      @hh.push({"name" => Baum.find_by(label: :stropsistema).name, "value" => params[:plkrov]})
      if params[:bitumkrov]
        @sum = @sum.to_f + Baum.find_by(label: :bitumkrov).price.to_f * params[:plkrov].to_f
        @hh.push({"name" => Baum.find_by(label: :bitumkrov).name, "value" => params[:plkrov]})
      end
      if params[:metkrov]
        @sum = @sum.to_f + Baum.find_by(label: :metkrov).price.to_f * params[:plkrov].to_f
        @hh.push({"name" => Baum.find_by(label: :metkrov).name, "value" => params[:plkrov]})
      end
      if params[:utipleniekrov]
        @sum = @sum.to_f + Baum.find_by(label: :utipleniekrov).price.to_f * params[:plkrov].to_f
        @hh.push({"name" => Baum.find_by(label: :utipleniekrov).name, "value" => params[:plkrov]})
      end
    end
    
    
    #marketing
    if !(@sum.to_f == 0)
      @sum = @sum.to_f + Baum.find_by(label: :marketing).price.to_f
      @sum = @sum.to_f + Baum.find_by(label: :logistika).price.to_f
      if params[:akcionka]
        @sum = @sum.to_f + Element.find_by(label: :akcionka).price.to_f
      end
      if params[:regional]
        @sum = @sum.to_f + Element.find_by(label: :regional).price.to_f
      end
           
      
      if @sum.to_f >= Baum.find_by(label: :sum2).price.to_f
        @sum = @sum.to_f * Baum.find_by(label: :nacenka14).price.to_f
      elsif @sum.to_f >= Baum.find_by(label: :sum1).price.to_f
        @sum = @sum.to_f * Baum.find_by(label: :nacenka15).price.to_f
      else
        @sum = @sum.to_f * Baum.find_by(label: :pribyl).price.to_f
      end
      
      
      
    end
  end

  
  
  
  
  private
    def baum_params
      params.require(:baum).permit(:name, :price, :label)
    end
end
