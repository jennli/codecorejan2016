require "sinatra"
require "sinatra/reloader"
require "pony"
# require_relative 'model/methods'

get "/" do
  erb :index , layout: :app_layout
end

get "/survey" do
  erb :survey , layout: :app_layout
end

post "/survey" do
  @survey_results = [:guardian, :rational, :idealist, :artisan]

  @answer_one = params["question-one"]
  @answer_two = params["question-two"]
  @answer_three = params["question-three"]

  @result = calculate_result(@answer_one, @answer_two, @answer_three)

  if !(@answer_one &&   @answer_two && @answer_three)
    erb :survey , layout: :app_layout

  else
    case @result
    when @survey_results[0]
      erb @survey_results[0], layout: :app_layout

    when @survey_results[1]
      erb @survey_results[1], layout: :app_layout

    when @survey_results[2]
      erb @survey_results[2], layout: :app_layout

    when @survey_results[3]
      erb @survey_results[3], layout: :app_layout
    end
  end
end


  def calculate_result(one, two, three)
    if one == "deadline" && three == "facts"
      @survey_results[0]
    elsif two == "rational" && three == "ideas"
      @survey_results[1]
    elsif two == "compassionate" && three == "ideas"
      @survey_results[2]
    else
      @survey_results[3]
    end
  end
  #
  # def send_email
  #   Pony.options = {
  # :subject => "RE: personality survey survey",
  # :body => "Someone took your survey.",
  # :via => :smtp,
  # :via_options => {
  #   :address              => 'smtp.gmail.com',
  #   :port                 => '587',
  #   :enable_starttls_auto => true,
  #   :user_name            => 'noreply@cdubs-awesome-domain.com',
  #   :password             => ENV["SMTP_PASSWORD"],
  #   :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
  #   :domain               => "localhost.localdomain"


  # end
