# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authorize
  before_action :set_answer, only: %i[show update destroy]

  def index
    @answers = Answer.all
    render json: { answers: @answers }, status: :ok
  end

  def show
    render json: { answer: @answer }, status: :ok
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      render json: { answer: @answer }, status: :created
    else
      render json: { errors: @answer.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @answer.update(answer_params)
      render json: @answer, status: :accepted
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @answer.destroy
      ender json: @answer, status:	:no_content
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:alternative_id, :user_id, :evidences_id)
  end
end
