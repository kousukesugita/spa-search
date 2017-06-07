class ChecksController < ApplicationController
  def create
    @spa = Spa.find_or_initialize_by(id: params[:spa_id])
    
    unless @spa.persisted?
      results =  
      
      @spa = Spa.new(read(results.first))
      @spa.save
    end
    
    current_user.check(@spa) 
    flash[:success] = '温泉をチェックしました。'
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @spa = Spa.find(params[:spa_id])
    
    current_user.uncheck(@spa) 
    flash[:success] = '温泉をチェックリストから外しました。'
    
    redirect_back(fallback_location: root_path)
  end
end
