require "benchmark"

def factorial_recursive(n)
  if n == 0
    1
  else
    n * factorial_recursive(n-1)
  end
end

def factorial_loop(n)
  product = 0
  (1..n).each do |num|
    product *= num
  end
end

Benchmark.bm do|x|
  x.report do
    1000000.times {factorial_recursive(8)}
  end
end


Benchmark.bm do|x|
  x.report do
    1000000.times {factorial_loop(8)}
  end
end
