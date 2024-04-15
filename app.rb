require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end


get("/dynamic/:number_of_dice/6") do
  @num_dice = params.fetch("number_of_dice").to_i

  @sides = params.fetch("how_many_sides").to_i

  @rolls = []

  @num_dice.times do
    die = rand(1..@sides)

    @rolls.push(die)
  end

  erb(:flexible)
end
