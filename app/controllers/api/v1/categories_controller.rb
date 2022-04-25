module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[show update destroy]

      def index
        @categories = Category.order(name: :asc)
      end

      def show; end

      def create
        context = Categories::Create.call(category_params: category_params)
        @category = context.category
        if context.success?
          render :show, status: :created
        else
          render json: { errors: context.category.errors.full_messages }, status: context.status
        end
      end

      def update
        context = Categories::Update.call(category: @category,
                                          category_params: category_params)
        @category = context.category
        if context.success?
          render :show, status: :ok
        else
          render json: { errors: context.category.errors.full_messages }, status: context.status
        end
      end

      def destroy
        context = Categories::Destroy.call(category: @category)
        if context.success?
          head :ok
        else
          render json: { errors: context.category.errors.full_messages }, status: context.status
        end
      end

      private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.permit(:id, :name)
      end
    end
  end
end
