=begin
Pete likes to bake some cakes. He has some recipes and ingredients.
Unfortunately he is not good in maths. Can you
help him to find out, how many cakes he could bake considering his recipes?
Write a function cakes(), which takes the recipe (object) and the available 
ingredients (also an object) and returns the
maximum number of cakes Pete can bake (integer). For simplicity there are 
no units for the amounts (e.g. 1 lb of flour or
200 g of sugar are simply 1 or 200). Ingredients that are not present in 
the objects, can be considered as 0.

Examples:
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});


Problem: Given two hashes return an integer
- First hash represents the recipe list (required)
- Second hash represents the available ingredients (on hand)
- Return integer shows how many cakes can be made by 
  available ingredients / requireed ingredients

Algorithm:
- CREATE an array
- FIND the missing ingrediens that the second hash does not contain from the first hash
  - and add those KV pairs into the second hash
- ITERATE over the first hash (recipe)
  - for each KV pair
    - Divide the value of the current value with respective value from the recipe hash
    - push the result into the array
- SELECt and RETURN the smallest integer in the array
=end

def cakes(recipe, ingredients)
  full_cakes = []

  recipe_ingrdts = recipe.keys.sort
  petes_ingrdts = ingredients.keys.sort

  recipe.each { |k, v| petes_ingrdts.include?(k) ? next : ingredients[k] = 0 }
  
  recipe.each { |k, v| full_cakes << ingredients[k] / v }

  full_cakes.min
end



p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000,
"milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000,
"milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000,
"milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3,
"cream"=>1, "oil"=>1, "milk"=>1}) == 1