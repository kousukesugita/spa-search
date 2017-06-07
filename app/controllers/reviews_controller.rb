class ReviewsController < ApplicationController
  def create
    @spa = Spa.find_or_initialize_by(id: params[:spa_id])
    
    unless @spa.persisted?
      results =  Spa.search(spa)
      
      @spa = Spa.new(read(results.first))
      @spa.save
    end
    
    current_user.review(@spa) 
    flash[:success] = '温泉をレビューしました。'
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @spa = Spa.find(params[:spa_id])
    
    current_user.unreview(@spa) 
    flash[:success] = '温泉のレビューを削除しました。'
    
    redirect_back(fallback_location: root_path)
  end
end
