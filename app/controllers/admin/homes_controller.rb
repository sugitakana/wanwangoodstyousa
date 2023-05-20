class Admin::HomesController < ApplicationController
  def top
    @tags = Tag.all
    @reviews = Review.all
  end
end
