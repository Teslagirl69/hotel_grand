# frozen_string_literal: true

  class Admin::ReviewsController < ApplicationController
    attr_reader :review

    before_action :authenticate_admin!
    before_action :set_review, only: %i[show edit update destroy]
    # GET /reviews or /reviews.json
    def index
      @reviews = Review.all.order('reviews.created_at desc')
    end


    def update
      # @review
      respond_to do |format|
        if @review.update(review_params)
          format.html { redirect_to review_url(@review), notice: 'Review was successfully updated.' }

        end
      end
    end

    # DELETE /reviews/1 or /reviews/1.json
    def destroy
      @review.destroy

      respond_to do |format|
        format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }

      end
    end

    def toggle_status
      @review = Review.find(params[:id])
      if @review.pended?
        @review.published!
      elsif @review.published?
        @review.pended!
      end

      redirect_to admin_reviews_url, notice: 'Review status has been updated.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:author_name, :author_email, :body, :toggle_status)
    end
  end
