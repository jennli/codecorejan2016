
def merge_key_with_value (hash)
 hash.to_a.map {|x| x.join() }
end

my_hash = {:a => "123", :b => "345", :c => "678", :d => "910"}

p merge_key_with_value(my_hash)
