#method1
#
# def long_question (quest_arr)
#   result_arr = []
#
#   quest_arr.each do |x|
#     if x.length > 15
#       result_arr << x
#     end
#   end
#
#   return result_arr
#
# end
#

#method2
def long_question (quest_arr)
  quest_arr.select { |question| question.size > 15 }
end

#main
quest_arr = ["What is your name", "How are you?", "Is that right?", "Are you John?", "How is everything?"]

print long_question(quest_arr)
puts
