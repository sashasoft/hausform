class ComponentsController < ApplicationController
  def index
    @components = Componenet.all
    
  end
end
