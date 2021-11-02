# Variant 3

print("Enter a:")
$a = gets.chomp.to_f

print("Enter b:")
$b = gets.chomp.to_f

print("Enter c:")
$c = gets.chomp.to_f

def func_f(x)
  res = 0
  if $a < 0 && $c != 0
    res = $a * x ** 2 + $b * x + $c
  elsif $a > 0 && $c == 0
    if x - $c != 0
      res = -$a / (x - $c)
    else
      return "Dividing by zero"
    end
  else
    res = $a * (x + $c)
  end

  a_c = $a.floor
  b_c = $b.floor
  c_c = $c.floor

  if (a_c & (b_c | c_c)) == 0
    res = res.to_i
  end

  res
end

def tabulate_function(x_beg, x_end, d_x)
  arguments_array = (x_beg..x_end).step(d_x).to_a

  arguments_array.each do |argument|
    printf("x = #{argument}, F = #{func_f(argument)}\n")
  end
end

def main
  print("Enter x_beg:")
  x_beg = gets.chomp.to_f

  print("Enter x_end:")
  x_end = gets.chomp.to_f

  print("Enter d_x:")
  d_x = gets.chomp.to_f

  tabulate_function(x_beg, x_end, d_x)
end

main