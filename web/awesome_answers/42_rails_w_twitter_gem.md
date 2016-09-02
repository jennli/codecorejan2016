# CodeCore Day 24: Setting up Twitter Gem


```ruby
gem "twitter"
```

`bundle`


### Console
```ruby
user = User.last
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["twitter_consumer_key"]
  config.consumer_secret     = ENV["twitter_consumer_secret"]
  config.access_token        = user.twitter_token
  config.access_token_secret = user.twitter_secret
end
```

```ruby
client.follow("stanley321")
client.update("Hello World")
```

### Model

```ruby
class Question
  attr_accessor :tweet_it # this is useful if I have a piece of data to work
                          # with which we I don't need to store in the DB

  #...

  def signed_in_with_twitter?
    provider.present? && uid.present? && provider == "twitter"
  end                        

end
```
### View
*questions/_form.html.erb*
```html
<% if current_user.signed_in_with_twitter? %>
  <div>
    <%= f.check_box :tweet_it %> Tweet It.
  </div>
<% end %>
```

### Controller
```ruby
class QuestionsController < ApplicationController

  def create
    @question      = Question.new question_params
    @question.user = current_user
    if @question.save
      if @question.tweet_it
        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV["twitter_consumer_key"]
          config.consumer_secret     = ENV["twitter_consumer_secret"]
          config.access_token        = current_user.twitter_token
          config.access_token_secret = current_user.twitter_secret
        end
        client.update("New Question: #{@question.title}")
      end
      # all these formats are possible ways to redirect in Rails:
      # redirect_to question_path({id: @question.id})
      # redirect_to question_path({id: @question})
      # redirect_to @question
      flash[:notice] = "Question Created Successfully!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Question wasn't created. Check errors below"
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit([:title, :body, :category_id, :tweet_it,
                                      {tag_ids: []}])
  end
end
```
