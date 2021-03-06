class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:followed_id])
    current_user.active_relationships.create(followed_id: user.id)
    redirect_to root_path
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.active_relationships.find_by(followed_id: user.id).destroy
    redirect_to root_path
  end
end