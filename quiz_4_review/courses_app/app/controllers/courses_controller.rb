class CoursesController < ApplicationController

  def index
    @courses = Course.all
    respond_to do |format|
      format.html {render}
      format.json {render json: @courses}
    end
  end

  # def index
  #   @questions = Question.all
  #   respond_to do |format|
  #     format.html { render }
  #     format.json { render json: @questions.select(:id, :title, :body, :view_count, :created_at, :updated_at) }
  #   end
  # end

end
