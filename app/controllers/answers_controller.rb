class AnswersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @answers = Answer.all
  end

  def new
    @user = current_user
    @question = Question.find params[:question_id]
    @answer = Answer.new
  end

  def create
    @question = Question.find params[:question_id]
    @answer = Answer.new answer_params
    if @answer.save
      flash[:notice] = "Answer Posted"
      redirect_to root_url
    else
      flash[:alert] = "invalid input"
      render 'new'
    end
  end

  def edit
    @answer = Answer.find params[:id]
  end

  def update
    @user = User.find params[:user_id]
    @question = Question.find params[:question_id]
    @answer = Answer.find params[:id]
    if @answer.update answer_params
      flash[:notice] = "Answer updated"
      redirect_to :back
    else
      flash[:alert] = "Invalid input"
      render 'edit'
    end
  end

  def show
    @answer = Answer.find params[:id]
  end

  def destroy
    @answer = Answer.find params[:id]
    if @answer.destroy
      flash[:notice] = "Answer deleted"
      redirect_to root_url
    end
  end



private
  def answer_params
    params.require(:answer).permit(:answer, :user_id, :question_id, :chosen_answer)
  end
end
