require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( './models/pizza_order')


# Index
get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb( :index )
end

# New (Has to be above orders)
get "/pizza_orders/new" do
  erb( :new )
end

# Show
get "/pizza_orders/:id" do
  @order = PizzaOrder.find(params[:id].to_i)
  erb( :show )
end

# Create
post "/pizza_orders" do
  @order = PizzaOrder.new(params)
  @order.save()
  erb( :create )
end

#edit
get "/pizza_orders/:id/edit" do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:edit)
end

#update post
post "/pizza_orders/:id" do
  @order = PizzaOrder.new(params)
  @order.update()
  # erb (:update)
  redirect to "/pizza_orders"
end

# Delete
post "/pizza_orders/:id/delete" do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete()
  redirect to "/pizza_orders"
end



#params is a hash

# Your edit route will probably take users to a form, just like the new route. Only this time, the form should be populated with the correct data for the order we want to edit.
