# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all.published.order(created_at: :desc).page params[:page]
  end

  # GET /reviews/1 or /reviews/1.json
  def show
    @review = Review.find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end


  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:author_name, :author_email, :body)
  end
end
