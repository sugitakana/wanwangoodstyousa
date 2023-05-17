class Public::CommentsController < ApplicationController
  
  def create
    @review = Review.find(params[:review_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.review_id = @review.id
    @review_comment.save
  end
  
  def destroy
    Comment.find_by(id: params[:id], review_id: params[:review_id]).destroy
    @review = Review.find(params[:review_id]) 
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
