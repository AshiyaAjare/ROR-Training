def check_prime?(num)
  if num<=1
    return false
  elsif num==2 || num==3
    return true
  elsif num%2==0 || num%3==0
    return false
  else
    it = 5
    while it*it<=num
      if num%it == 0 || num%(it+2) == 0
        return false
      end
      it+=6
    end
    return true
  end
end

puts "Enter number to check if its prime or not: "

num = gets.chomp.to_i

if check_prime?(num)
  puts "#{num} is a Prime Number."
else
  puts "#{num} is not a  number."
end 
