# CodeCore Day 42 - OAuth

Server --> Credentials  --> Twitter
Server <-- Tokens       <-- Twitter
Server --> Redirect     --> Twitter
Server <-- Info         <-- Twitter


- require a Gem
- we're using gem: omniauth

(https://github.com/intridea/omniauth)

### 1. Create an  application

#### apps.twitter.com

Name: Awesome Answer - Jan 2016  (must be unique)
Description: Awesome Answer Application
website: http://127.0.0.1:3000
Callback URL: http://127.0.0.1:3000/callbacks/twitter

**Note:** Someone created a service, so you can to point to local host.
`lvh.me:3000`

##### Permissions
Select "Read and Write" (so you can tweet on user's behalf)

##### Keys and Access Tokens

*app_keys.rb*

ENV["twitter_consumer_key"] = "...."
ENV["twitter_consumer_secret"] = "..."

###### Create an example to help other developers using your project
*app_key.rb.example*
ENV["email_user_name"] = "XXX"
ENV["email_password"] = "XXX"
ENV["twitter_consumer_key"] = "XXX"
ENV["twitter_consumer_secret"] = "XXX"

### 2. Setup Omniauth

Need to find specific omniauth for specific site.   
ie. omniauth-twitter

(https://github.com/arunagw/omniauth-twitter)

1. `gem 'omniauth-twitter'`
2. bundle


#### Create omniauth.rb

*config/initializers/omniauth.rb*
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, "API_KEY", "API_SECRET"
  provider :twitter, ENV["twitter_consumer_key"], ENV["twitter_consumer_secret"]
end
```

### 3. Set up routes
```ruby
get "/auth/twitter", as: :sign_in_with_twitter
get "/auth/twitter/callback" => "callbacks#twitter"
```

### 4. Setting up the link in the views

*routes*
```html
<%= link_to "Sign In With Twitter", sign_in_with_twitter_path %>
```

### 5. Setup Controller to deal with the info sent over by twitter

`bin/rails g controller callbacks`

*controllers/callbacks_controller.rb*
```ruby
class CallbacksController < ApplicationController

  # =============================================
  def twitter
    # search for the user with their uid/provider, if we find the user then
    #  we log the user in, otherwise, we create a new user account
    omniauth_data = request.env['omniauth.auth']
    user = User.where(provider: "twitter", uid: omniauth_data["uid"]).first

    if user
      sign_in(user)
      redirect_to root_path, notice: "Sign in!"
    else
      # ===========================================
      render json: request.env['omniauth.auth']
      # ===========================================
      # Create the user account
      user = User.create_from_twitter(omniauth_data)
      sign_in(user)
      redirect_to root_path, notice: "Signed in!"
    end
  end
  # =============================================
  ## Refactor
  def twitter
    omniauth_data = request.env['omniauth.auth']

    ## when you see a where, it means move to to the model
    # user = User.where(provider: "twitter", uid: omniauth_data["uid"]).first
    user = User.find_twitter_user(omniauth_data)

    user ||= User.create_from_twitter(omniauth_data)
    sign_in(user)
    redirect_to root_path, notice: "Signed In!"
  end
end
```

### 6. Storing User's twitter info in our database

`bin/rails g migration add_oauth_fields_to_users uid provider token twitter_secret twitter_raw_data:text`

```ruby
class AddOauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :twitter_token, :string
    add_column :users, :twitter_secret, :string
    add_column :users, :twitter_raw_data, :text
    add_index :users, [:uid, :provider] ## Add this
  end
end
```

`bin/rake db:migrate`

*app/models/user.rb*
```ruby
class User < ActiveRecord::Base
  # This enables us to sore a Hash to the twitter_data field and retrieve it as a Hash
  # Rails will take care of encoding/decoding the data of the Hash to and from the DB
  # It will be stored as Text in the DB
  serialize :twitter_data, Hash

  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
                    unless: :from_oauth?

  def from_oauth/?
    uid.present? && provider.present?
  end

  def self.create_from_twitter(twitter_data)
    name = twitter.data["info"]["name"].split(" ")

    # user = User.new(provider: "twitter",
    ## Choose to create right away
    User.create(provider: "twitter",
                uid: twitter_data["uid"]
                first_name: name[0],
                last_name: name[1],
                password: SecureRandom.hex,
                # it doesn't matter, because user won't be signing it with their password, because using twitter login.
                # because password is required, otherwise it won't pass

                twitter_token:twitter_data["credentials"]["token"]
                twitter_token:twitter_data["credentials"]["secret"]
                twitter_raw_data: twitter_data
                )            
  end

  def find_twitter_user(omniauth_data)
    where(provider: "twitter", uid: omniauth_data["uid"]).first
  end

end
```
