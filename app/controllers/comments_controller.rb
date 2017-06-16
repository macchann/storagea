class CommentsController < ApplicationController
  def create
    @comment = Comment.create(create_params)
    redirect_to controller: :items, action: :show, id: params[:item_id]
  end

  def destroy
    @comment = Comment.find(params[:id])
      if @comment.user_id == current_user.id
      @comment.destroy
      end
    redirect_to controller: :items, action: :show, id: params[:item_id]
    end

  private
    def create_params
      params.require(:comment).permit(:comment).merge(item_id: params[:item_id], user_id: current_user.id)
    end
end
