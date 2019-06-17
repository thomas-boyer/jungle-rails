class ReviewsController < ApplicationController

  before_filter :require_login

  def create
    @review = Review.new(description: params['review']['description'], rating: params['rating'], product_id: params['product_id'], user_id: session['user_id'])

    if @review.save
      redirect_to product_path(@review.product_id)
    else
      redirect_to :back, notice: 'Failed to save review.'
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@review.product_id), notice: 'Review deleted!'
  end

  private
  def require_login
    unless session['user_id']
      flash[:error] = "You must be logged in to submit a review."
      redirect_to new_login_url
    end
  end

end
