class Product::PopularController < ProductsController
  def index
    @products = Product \
                  .order(likes_count: :DESC)
                  .includes([:user, :tags])
                  .page(params[:page])
                  .per(20)
    render :index
  end
end
