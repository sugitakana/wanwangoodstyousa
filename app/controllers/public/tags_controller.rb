class Public::TagsController < ApplicationController
  def show
    @tags = Tag.all
    @tag = Tag.find(params[:tag_id])
    @reviews = Review.where(tag_id: @tag.id).page(params[:page]).per(8)
  end
end
