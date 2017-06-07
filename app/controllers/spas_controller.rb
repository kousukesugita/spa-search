class SpasController < ApplicationController
  def show
     @spa = Spa.find(params[:id])
  end

  def new
    @spas = []
    
  end
end
