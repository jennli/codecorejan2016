class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    review_params = params.require(:review).permit([:body])
    @review = Review.new review_params
    @review.product = @product
    # @review = @product.reviews.new review_params

    respond_to do |format|
      if @review.save
        format.html{
          redirect_to product_path(@product), notice: "review is created successfully"
        }
        # format.js {render js: "alert('answer created, refresh page')"}
        format.js { render :create_success }
      else
        format.html{render "/products/show"}
        format.js{render :create_failure}
      end
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    respond_to do |format|
      format.html{redirect_to product_path(params[:product_id]), notice:"review deleted"}
      format.js{render}
    end
    # render json: params
  end
end
