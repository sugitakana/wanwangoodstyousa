class Public::TagsController < ApplicationController
  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @reviews = Review.where(tag_id: @tag.id)
  end
end
