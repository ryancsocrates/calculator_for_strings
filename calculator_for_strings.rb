
def am_i_operator(check_me)
  what_am_i=false

  if check_me=="+"
    what_am_i=true
  elsif check_me=="-"
    what_am_i=true
  elsif check_me=="*"
    what_am_i=true
  elsif check_me=="/"
    what_am_i=true
  end # end
  what_am_i # returns true if its a math operator

end #end def am_i_operator

def am_i_number(check_me) # (gets a string) returns true/false
  what_am_i=false

  (0..9).each do |i| #if check_me is numbers0-9, what_am_i becomes true
    if check_me==i.to_s
      return true
    end # end if
  end # end each
  return what_am_i
end #end def am_i_number

#for every character in the string, is it a number or an operator?
def valid_math(am_i_valid) # (gets a string) returns true/false
  what_am_i = true
  am_i_valid.each_char do |i| # for every character in the string
    if (am_i_number(i)) || (am_i_operator(i)) # send the char, if either is true, continue looping, or if it's a space continue looping
      what_am_i = true
    elsif (i==" ") # if there's a space, it will treat it as true and keep looping
      what_am_i = true
    else # if i'm not an operator OR a number
      return false
    end # if else
  end # each do
  what_am_i
end # valid_math

# if i[x] is a number
#   add it to the firstNum Array
# if i[x] is a space
#   do nothing, go to next
# if i[x] is an operator
#   set to the operator
#   bool var that says we can go to the next number

looping= true

while looping
  first_num=""
  second_num=""
  operator=""
  next_operator=false
  next_number=false


  puts "Enter an equation"
  user_string = gets.chomp
  if valid_math(user_string)
    puts "i'm math-ing"
    equation = user_string.gsub(" ", "") # remove spaces
    equation = user_string.split("") # splits each char into one spot in the Array


    equation.each do |i|
      if am_i_number(i) && next_number==false
        first_num+=i
      elsif am_i_operator(i)
        operator=i
        next_number=true #if i hit an operator, start a 2nd number
      elsif am_i_number(i)
        second_num+=i
      end # if
    end # equation.each

    puts first_num + ": first_num"
    puts operator + ": operator"
    puts second_num + ": second_num"

    int_first_num = first_num.to_i
    int_second_num = second_num.to_i

    if operator=="+"
      result = int_first_num + int_second_num
    elsif operator=="-"
      result = int_first_num - int_second_num
    elsif operator=="*"
      result = int_first_num * int_second_num
    elsif operator=="/"
      result = int_first_num / int_second_num
    end # if operator

    puts result.to_s + ": result!"

  else
    puts "Not valid math, be smarter."
  end #if
end #looping
