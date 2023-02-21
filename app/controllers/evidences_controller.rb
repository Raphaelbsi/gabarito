# frozen_string_literal: true

class EvidencesController < ApplicationController
  before_action :set_evidence, only: %i[show update destroy]
  # GET /evidences
  def index
    @evidences = Evidence.all

    render json: @evidences
  end

  # GET /evidences/1
  def show
    render json: @evidence
  end

  # POST Create Evidence /evidences
  def create
    @evidence = Evidence.create(evidence_params)
  end

  private

  def set_evidence
    @evidence = Evidence.find(params[:id])
  end

  def evidence_params
    params.permit(:name)
  end
end
