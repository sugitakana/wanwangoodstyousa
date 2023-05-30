class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @tags = Tag.all
    @reviews = Review.order(created_at: :desc).page(params[:page]).per(8)
  end
end
