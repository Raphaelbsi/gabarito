# frozen_string_literal: true

class AlternativesController < ApplicationController
  before_action :authorize
  before_action :set_alternative, only: %i[show update destroy]

  def index
    @alternatives = Alternative.all
    render json: @alternatives
  end

  def show
    render json: @alternativa
  end

  def create
    @alternative = Alternative.new(alternative_params)
    if @alternative.save
      render json: @alternative, status: :created, location: @alternative
    else
      render json: @alternative.errors, status: :unprocessable_entity
    end
  end

  def update
    if @alternative.update(alternative_params)
      render json: @alternative
    else
      render json: @alternative.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @alternative.destroy
      render json: @alternative, status:	:no_content
    else
      render json: @alternative.errors, status: :unprocessable_entity
    end
  end

  private

  def set_alternative
    @alternative = Alternative.find(params[:id])
  end

  def alternative_params
    params.require(:alternative).permit(:text, :correct, :question_id)
  end
end
