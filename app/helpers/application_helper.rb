module ApplicationHelper
  def main_image
    @product.images.main.present? ? image_tag("#{@product.images.main.first.image}") : ''
  end

  def sub_image
    @product.images.main.present? ? @product.images.main : ''
  end
end

