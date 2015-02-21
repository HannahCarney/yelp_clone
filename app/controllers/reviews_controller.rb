class ReviewsController <ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
	  @restaurant = Restaurant.find(params[:restaurant_id])
	  @review = @restaurant.reviews.new(review_params)	  
	  if @review.save
	  	redirect_to '/restaurants' 	
	  else
	  	flash[:notice] = "you already reviewed that restaurant"
	  end
	end

	def review_params
	  params.require(:review).permit(:thoughts, :rating)
	end

	# def correct_user?
	#   current_user.id == params[:review_id]
	# end


end