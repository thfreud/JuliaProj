#defining an abstract type for fuits
abstract type Fruits end

#creating a struct that will be used to encapsulating price properties
struct Price
    price::Float64
    discountedPrice::Float64
end

#declaring structs for Apples and Bananas which are subtypes of Fruits
struct Apples <: Fruits
    quantity::Int
    price::Price
end

struct Bananas <: Fruits
    quantity::Int
    price::Price
end

#declaring objets of type Apples, Bananas and Price
apple_price = Price(0.5,0.45)
apples = Apples(12,apple_price)
bananas_price = Price(1,0.98)
bananas = Bananas(20,bananas_price)

#declaring a function used for calculating the total price of Apples in the consumer basket

"""
    totalPrice(fruits::Fruits)
    It receives any object which is subtype of Fruits and return de total price of items in the basket. 
TBW
"""
function totalPrice(fruits::Fruits)
	if fruits.quantity < 12
		return fruits.price.price*fruits.quantity
	else
		return fruits.price.discountedPrice*fruits.quantity
	end
end


"""
    totalPrice(args::Vararg{Fruits})
    It receives any quantity of objects subtype of Fruits returning de final bill.
TBW
"""
function totalPrice(args::Vararg{Fruits})
	return sum(totalPrice, args)
end

println("Apples: Quantity = $(apples.quantity), Price = $(apples.price.price), Amount=$(totalPrice(apples))")
println("Bananas: Quantity = $(bananas.quantity), Price = $(bananas.price.price), Amount = $(totalPrice(bananas))")
println("Total Bill: ", totalPrice(apples, bananas))

