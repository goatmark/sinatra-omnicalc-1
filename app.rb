require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end


get("/square/new") do
  erb(:square)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/payment/new") do
  erb(:payment)
end

get("/random/new") do
  erb(:random)
end

get("/square/results") do
  @number = params.fetch("square","").to_f

  @number_squared = @number ** 2
  
  erb(:square_results)
end

get("/square_root/results") do
  @number = params.fetch("square_root","").to_f

  @number_square_root = @number ** (0.5)
  
  erb(:square_root_results)
end

get("/payment/results") do
  
  # Given the equation: P = (r * pv) / (1 - (1 + r)^-n)
  # pv = principal
  # r = monthly yield
  # n = number of periods (months) outstanding

  @apr = params.fetch("apr","").to_f
  @monthly_yield = @apr / 100.0 / 12.0
  
  @years_remaining = params.fetch("years_remaining","").to_f
  @months_remaining = @years_remaining * 12

  @principal = params.fetch("principal","").to_f

  @numerator = @monthly_yield * @principal
  @denominator = (1 - (1 + @monthly_yield) ** (-1 * @months_remaining))

  @payment = @numerator / @denominator
  
  erb(:payment_results)
end

get("/random/results") do
  @low_bound = params.fetch("minimum", "").to_f
  @high_bound = params.fetch("maximum", "").to_f

  @random_value = rand(@low_bound..@high_bound)
  
  erb(:random_results)
end
