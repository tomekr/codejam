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

__END__

--------------------------------------------------------------------------------
Problem

You receive a credit C at a local store and would like to buy two items. You
first walk through the store and create a list L of all available items. From
this list you would like to buy two items that add up to the entire value of
the credit. The solution you provide will consist of the two integers
indicating the positions of the items in your list (smaller number first).

--------------------------------------------------------------------------------
Input

The first line of input gives the number of cases, N. N test cases follow. For
each test case there will be:

One line containing the value C, the amount of credit you have at the store.
One line containing the value I, the number of items in the store.  One line
containing a space separated list of I integers. Each integer P indicates the
price of an item in the store.  Each test case will have exactly one solution.

--------------------------------------------------------------------------------
Output

For each test case, output one line containing "Case #x: " followed by the
indices of the two items whose price adds up to the store credit. The lower
index should be output first.

--------------------------------------------------------------------------------
Limits

5 ≤ C ≤ 1000 1 ≤ P ≤ 1000

Small dataset

N = 10 3 ≤ I ≤ 100

Large dataset

N = 50 3 ≤ I ≤ 2000

--------------------------------------------------------------------------------
Sample

Input:
3
100
3
5 75 25
200
7
150 24 79 50 88 345 3
8
8
2 1 9 4 4 56 90 3

Output:
Case #1: 2 3
Case #2: 1 4
Case #3: 4 5
