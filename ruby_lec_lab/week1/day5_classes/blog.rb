class Blog

  attr_accessor :comments_arr, :title, :content

  def initialize(title, b = "")
    @title = title
    @comments_arr = []
    @content = b
  end

  def add_comment(comment)
    comments_arr.push(comment)
  end
end
