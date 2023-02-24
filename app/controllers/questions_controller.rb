# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authorize
  before_action :set_question, only: %i[show update destroy]

  def index
    @questions = Question.all

    render json: @questions
  end

  def show
    render json: @question
  end

  def create
    question = Question.new(question_params)
    if question.save
      render json: question, status: :created, locaton: question
    else
      render json: question.errors, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      render json: @question, status: :accepted
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @question.destroy
      render json: @question, status: :ok
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.permit(:texto, :evidence_id)
  end
end
