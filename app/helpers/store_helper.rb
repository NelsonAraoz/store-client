module StoreHelper
	CLIENTS = [{client: 'Juan Perez', credit_card: '777-888-999-1111', address: 'c1'}, {client: 'John Smith', credit_card: '3333-7854-999-2211', address: 'c2'}, {client: 'Fred Flinstone', credit_card: '5833-7854-989-2371', address: 'c3'}, {client: 'Luka Modric', credit_card: '3533-7451-983-2395', address: 'c4'}]
	CHEESES = ['mozzarella', 'provolone', 'parmesano', 'gouda']
	BORDERS = ['thick', 'thin', 'filled']
	SAUCES = ['pesto', 'bechamel', 'humus', 'bbq']
	SIZES = ['personal', 'small', 'medium', 'large']
	def get_random_order
		client_index = Random.new.rand(0..3)
		p_amount = @products.length - 1
		product_index = Random.new.rand(0..p_amount)
		selected_product = @products[product_index]
		amount = Random.new.rand(1..10)
		items = []
		items_amount = Random.new.rand(1..5)
		items_amount.times do |i|
			item = {}
			item[:id] = product_index
			item[:amount] = amount
			if selected_product[:price].is_a?(Object)
				get_pizza_params item
			end
			items << item
		end

		params = CLIENTS[client_index]
		params[:items] = items
		params
	end
	def get_pizza_params(item)
		t_amount = @toppings.length - 1
		topping_amount = Random.new.rand(0..5)
		toppings = []
		topping_amount.times do |i|
			topping_index = Random.new.rand(0..t_amount)
			toppings << topping_index  
		end
		item[:extra_toppings] = toppings
		item[:cheese_type] = CHEESES[Random.new.rand(0..3)]
		item[:border_type] = BORDERS[Random.new.rand(0..2)]
		item[:sauce_type] = SAUCES[Random.new.rand(0..3)]
		item[:size] = SIZES[Random.new.rand(0..3)]
	end
	def run_random_orders
		value = Random.new.rand(10..20)
		display_menu
		display_toppings
		puts "Random Time: #{value}"
		loop do
			clients = Random.new.rand(1..3)
			puts "Doing #{clients} orders..."
			clients.times do |i|
			    order = get_random_order
			    perform_order order
			end 
			sleep value
		end
	end
	def display_toppings
		@toppings = StoreService.get_toppings
		puts '----------PIZZA TOPPINGS----------'
		@toppings.each do |topping|
			puts "#{topping['name']} PRICE => #{topping['price']}"
		end
		puts '------------------------'
	end
	def display_menu
		@products = StoreService.get_store_products
		puts '----------MENU----------'
		@products.each do |product|
			puts "#{product['name']} PRICE => #{product['price']}"
		end
		puts '------------------------'
	end

	def perform_order(order)
		Thread.new do
			result = StoreService.perform_order order 
			message = result.parsed_response['message']
			puts "#{order[:client]}: #{message}"
		end
	end
end