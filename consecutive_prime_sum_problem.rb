require 'active_support'
require 'active_support/core_ext'
class Fixnum (require 'prime'); end
def find_sequence
  @final_prime_arr.clear
  @sum_range = 0
  while @ranged_primes.present? do
    ele = @ranged_primes.shift
    @sum_range += ele
    @final_prime_arr << ele
    if @sum_range>1000000
      @sum_range = 0
      @final_prime_arr.clear
    elsif @sum_range.prime?
      @final_prime_hash.clear
      @final_prime_hash[@sum_range] = @final_prime_arr
    end
  end
  return @final_prime_hash[@final_prime_hash.keys.max]
end
def get_most_large_prime
  @ranged_primes = Prime.take_while {|p| p < 500000 }.sort.reverse
  @final_prime_arr = []
  @final_prime_hash = {}
  find_sequence
  puts "Prime Number => #{@final_prime_hash.keys.last}"
  puts "Consecutive Prime Numbers => #{@final_prime_hash.values.last.reverse}"
end
get_most_large_prime
