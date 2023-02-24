# frozen_string_literal: true

class EvidencesController < ApplicationController
  before_action :authorize
  before_action :set_evidence, only: %i[show update destroy]
  # GET /evidences
  def index
    @evidences = Evidence.all

    render json: @evidences, include: [:questions]
  end

  # GET /evidences/1
  def show
    render json: @evidence, include: [questions: { include: :alternatives }]
  end

  # POST Create Evidence /evidences
  def create
    evidence = Evidence.new(evidence_params)
    if evidence.save
      render json: evidence, status: :created, location: evidence
    else
      render json: evidence.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evidences/1

  def update
    if @evidence.update(evidence_params)
      render json: @evidence, status: :accepted
    else
      render json: @evidence.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @evidence.destroy
      render json: @evidence, status: :no_content
    else
      render json: @evidence.errors, status: :unprocessable_entity
    end
  end

  private

  def set_evidence
    @evidence = Evidence.find(params[:id])
  end

  def evidence_params
    params.require(:evidence).permit(:name, :description)
  end
end
