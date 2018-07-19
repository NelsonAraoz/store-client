# Client Store

This project was create in order to consume the pizza store REST API [API Here](https://github.com/NelsonAraoz/pizza-store)

## Run project

Make sure to have the API project running over the port 2999.
Open a console, then run `rake store::random_orders` this will start the project displaying the products and toppings on the store, after that will generet a 'x' number and will do random orders every x seconds

## Note

Sleep function was used in order to run the orders every x seconds, but exists some consoles like windows git shell that this function blocks the main thread and the text is never displayed
