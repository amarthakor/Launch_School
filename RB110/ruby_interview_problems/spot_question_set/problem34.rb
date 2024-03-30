=begin
Sherlock has to find suspects on his latest case. He will use your method,
 dear Watson. Suspect in this case is a
person which has something not allowed in his/her pockets.
Allowed items are defined by array of numbers.
Pockets contents are defined by map entries where key is a person and 
value is one or few things represented by an
array of numbers (can be nil or empty array if empty), example:

pockets = {
bob: [1],
tom: [2, 5],
jane: [7]
}

Write amethod which helps Sherlock to find suspects. If no suspect is found or there 
are no pockets (pockets == nil), the
method should return nil.

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]

PRoblem: Given a hash and array, return an array or nil

Rules:
- First argument is a hash of 3 people (keys) and items in their pockets (values)
- Second argument is an array of items that are allowed
- Return value is an array of people who have illegal items ( keys )
- Return nil if there are no suspects w/ illegal items OR no pockets (pockets == nil)
  - does this mean an input can have pockets with a different value that previously defined?

Algorithm:
- RETIRN nil if pockets is equal to nil
- CREATE an empty array for suspects
- ITERATE over pockets
  - for each KV pair
    - ITERATE over all values
      - if a value in the array is not found in the given argument array
      - push the current key into the suspectds array
- IF the suspects array is empty return nil otherwise reutrn its contents
=end

def find_suspects(pockets, array)
  return nil if pockets.map { |k, v| v == nil || v == [] }.all?

  suspects = []
  
  pockets.each do |name, items|
    next if items == nil
    items.each { |item| suspects << name if !array.include?(item) }
  end

  suspects.empty? ? nil : suspects.uniq
end

pockets = { bob: [1], tom: [2, 5], jane: [7] }

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]