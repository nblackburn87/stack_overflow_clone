class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:notice] = "Question Posted"
      redirect_to root_url
    else
      flash[:alert] = "invalid input"
      render 'new'
    end
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    if @question.update question_params
      flash[:notice] = "Question updated"
      redirect_to root_url
    else
      flash[:alert] = "Invalid input"
      render 'edit'
    end
  end

  def show
    @question = Question.find params[:id]
  end

  def destroy
    @question = Question.find params[:id]
    if @question.destroy
      flash[:notice] = "Question deleted"
      redirect_to root_url
    end
  end



private
  def question_params
    params.require(:question).permit(:question)
  end
end
