ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara-webkit'

Capybara.run_server = false
Capybara.current_driver = :webkit
Capybara.app_host = "http://vancouver.craigslist.ca/"
Capybara::Webkit.configure do |config|
  config.allow_unknown_urls
end

module Spider
  class Craigslist
    include Capybara::DSL

    def search
      visit('/')
      page.find("a[href='/search/jjj']").click
      fill_in "query", with: "ruby"
      page.find('.searchbtn').click

      all('.row').each do |title|
        a = title.find('a');
        puts "#{a.text}"
      end
      # all("li.g h3").each do |h3|
      #   a = h3.find("a")
      #   puts "#{h3.text}  =>  #{a[:href]}"
      # end
    end
  end
end

spider = Spider::Craigslist.new
spider.search
