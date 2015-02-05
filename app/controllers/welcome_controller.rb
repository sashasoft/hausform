class WelcomeController < ApplicationController
  def index
    
    #redirect_to welcome_path
  end
  
  def sum
    @a = 0
    @a = params[:fundament].to_f * 10
    if params[:archproject]
      @a = @a.to_f + 2500
    end
    if params[:ploshad]
      @a = @a.to_f + params[:ploshad].to_f * 10
    end
    if params[:sip160]
      @a = @a.to_f + params[:sip160].to_f * 10
    end
    if params[:karkas150]
      @a = @a.to_f + params[:karkas150].to_f * 10
    end
    
  end
  
  def create
  end
end
