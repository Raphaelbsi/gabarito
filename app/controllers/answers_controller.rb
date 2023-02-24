# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authorize

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      render json: { answer: @answer }, status: :created
    else
      render json: { errors: @answer.errors }, status: :unprocessable_entity
    end
  end

  def index
    @answer = Answer.all
    render json: { answers: @answer }, status: :ok
  end

  def show
    @answer = Answer.find(params[:id])
    render json: { answer: @answer }, status: :ok
  end

  private

  def answer_params
    params.require(:answer).permit(:alternatives_id, :user_id)
  end
end
