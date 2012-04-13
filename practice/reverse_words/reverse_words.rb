#!/usr/bin/env ruby

require 'rubygems'

input = ARGF.read.split("\n")

# Remove the first element of the array which in this case is the number of
# words in the input. We don't need to keep track of this number because we
# have an array that we can just enumerate over
input.shift

output = input.each_with_index.map do |phrase, index|
  "Case ##{ index + 1 }: #{ phrase.split.reverse.join(' ') }"
end

# Print out the results
puts output
