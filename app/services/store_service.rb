class StoreService
	include HTTParty
	base_uri '127.0.0.1:2999/api'
	def self.get_store_products
		get('/products')
	end

	def self.get_toppings
		get('/toppings')
	end

	def self.perform_order(params)
		post('/orders/perform', :body => params.to_json, :headers => {'Content-Type' => 'application/json'})
	end

end