class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag      = ActsAsTaggableOn::Tag.find(params[:id])
    @products = Product \
                  .tagged_with(@tag.name)
                  .includes(:user, :tags)
                  .page(params[:page])
                  .per(20)
  end
end

