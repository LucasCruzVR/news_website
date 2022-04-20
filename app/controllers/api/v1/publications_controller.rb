module Api
  module V1
    class PublicationsController < ApplicationController
      before_action :set_publication, only: %i[show update destroy]

      def index
        @publications = Publication.all
      end

      def show; end

      def create
        context = Publications::Create.call(publication_params: publication_params)
        @publication = context.publication
        if context.success?
          render :show, status: :created
        else
          render json: { errors: context.publication.errors.full_messages }, status: context.status
        end
      end

      def update
        context = Publications::Update.call(publication: @publication,
                                            publication_params: publication_params)
        @publication = context.publication
        if context.success?
          render :show, status: :ok
        else
          render json: { errors: context.publication.errors.full_messages }, status: context.status
        end
      end

      def destroy
        context = Publications::Destroy.call(publication: @publication)
        if context.success?
          head :ok
        else
          render json: { errors: context.publication.errors.full_messages }, status: context.status
        end
      end

      private

      def set_publication
        @publication = Publication.find(params[:id])
      end

      def publication_params
        params.permit(:id, :title, :subtitle, :content, :file_image)
      end
    end
  end
end
