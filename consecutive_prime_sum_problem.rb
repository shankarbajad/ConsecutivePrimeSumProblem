require 'active_support'
require 'active_support/core_ext'
class Fixnum (require 'prime'); end
def find_sequence
  @ranged_primes = Prime.take_while {|p| p < 500000 }.sort.reverse
  @final_prime_arr = []
  @final_prime_hash = [0,[0]]
  @sum_range = 0
  @ranged_primes.each do |ele|
    @sum_range += ele
    @final_prime_arr << ele
    if @sum_range>1000000
      @sum_range = 0
      @final_prime_arr = []
    elsif @sum_range.prime? && @sum_range<1000000
      if @final_prime_hash.last.size<@final_prime_arr.size
        @final_prime_hash = []
        @final_prime_hash = [@final_prime_arr.size, @final_prime_arr]
      end
    end
  end
  @final_prime_hash
end
def get_most_large_prime
  @final_scequence = find_sequence
  puts "Prime Number => #{@final_scequence.last.sum}"
  puts "Consecutive Prime Numbers => #{@final_scequence.last.reverse}"
end
get_most_large_prime
