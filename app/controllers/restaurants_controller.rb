class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def top
    @rank_restaurants = Restaurant.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(3)
  end


  def index
    

    @restaurants = Restaurant.all
    
      if params[:tag_ids]
        @restaurants = []
        params[:tag_ids].each do |key, value|      
          @restaurants += Tag.find_by(name: key).restaurants if value == "1"
        end
          
        @restaurants.uniq!
      end
    @restaurants = Kaminari.paginate_array(@restaurants).page(params[:page]).per(3)


    if params[:tag]
      Tag.create(name: params[:tag])
    end
    

  end
        
  def new
    @restaurant = Restaurant.new
  end
        
  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.user_id = current_user.id
    if restaurant.save!
      redirect_to :action => "index"
    else
     redirect_to :action => "new"
    end
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
        
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    restaurant = Restaurant.find(params[:id])
    if restaurant.update(restaurant_params)
      redirect_to :action => "show", :id => restaurant.id
    else
      redirect_to :action => "new"
    end
  end
  
  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    redirect_to action: :index
  end

 private
  def restaurant_params
    params.require(:restaurant).permit(:name, :price, :category, :detail, :image, tag_ids: [])
  end
end

