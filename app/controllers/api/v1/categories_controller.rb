module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @categories = Category.all
      end

      def show; end

      def create
        context = Category::Create.call(category_params: category_params)
        @category = context.category
        if context.success?
          render :show, status: :created
        else
          render json: { errors: context.category.errors.full_messages }, status: context.status
        end
      end

      def update
        context = Category::Update.call(category: @category,
                                        category_params: category_params)
        @category = context.category
        if context.success?
          render :show, status: :ok
        else
          render json: { errors: context.category.errors.full_messages }, status: context.status
        end
      end

      def destroy
        context = Category::Destroy.call(category: @category)
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
