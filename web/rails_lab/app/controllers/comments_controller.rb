class CommentsController < ApplicationController

  def create
    render text: params
  end

end
