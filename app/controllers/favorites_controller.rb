class FavoritesController < ApplicationController
   before_action :require_user_logged_in
  
  def create
    user = current_user.id
    micro = Micropost.find(params[:micropost_id])
    current_user.favorite(micro)
    flash[:success] = 'お気に入り登録しました。'
    redirect_to user_path(user)
  end

  def destroy
    user = current_user.id
    micro = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micro)
    flash[:success] = 'お気に入り解除しました。'
    redirect_to user_path(user)
  end
end
