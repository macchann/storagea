class CommentsController < ApplicationController
  def create
    @comment = Comment.create(create_params)
  end

  private
    def create_params
      params.require(:comment).permit(:comment).merge(item_id: params[:item_id], user_id: current_user.id)
    end
end
