class ReviewsController < ApplicationController

  def create

    # パラメータ詳細    
    # {
    #   "onsen_code"=>"0001",
    #   "score"=>"5"
    # }
    #

    spa = Spa.where(onsen_code: params['onsen_code']).first
    
    review_params = {
      user_id: current_user.id,
      spa_id: spa.id,
      score: params['score'],
    }

    Review.new(review_params).save

    flash[:success] = '温泉をレビューしました。'

    redirect_to root_path
  end

  def destroy
    @spa = Spa.find(params[:spa_id])
    
    current_user.unreview(@spa) 
    flash[:success] = '温泉のレビューを削除しました。'
    
    redirect_back(fallback_location: root_path)
  end
end
