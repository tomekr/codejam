#!/usr/bin/env ruby

def find_price_pair(credit, prices)
  prices.each_with_index do |price1, index1|
    prices.each_with_index  do |price2, index2|
      if (price1 + price2) == credit and index1 != index2
        return [index1+1, index2+1].sort.join(' ')
      end
    end
  end
  ""
end

input = ARGF.read.split("\n")

# Remove the first element of the array which in this case is the number of
# words in the input. We don't need to keep track of this number because we
# have an array that we can just enumerate over
number_of_cases = input.shift

(1..number_of_cases.to_i).each do |case_number|
  # First line is the credit, convert to integer
  credit = input.shift.to_i

  # Number of items not needed since I use enumberable
  input.shift 

  # Get the prices, converting each to an integer and mapping to an array
  prices = input.shift.split.map(&:to_i)
  
  # Output the case and results
  puts "Case ##{ case_number }: #{ find_price_pair(credit, prices) }"
end

