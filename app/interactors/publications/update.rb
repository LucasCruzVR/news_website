module Publications
  class Update
    include Interactor
    include Interactor::Contracts

    expects do
      required(:publication_params).filled
      required(:publication)
    end

    on_breach do |breaches|
      context.fail!(errors: breaches)
    end

    def call
      context.publication.assign_attributes(context.publication_params)
      aws_updload_response = Publications::AwsImageUpload.call(image: context.publication.file_image).response_url
      context.publication.url_image = aws_updload_response if aws_updload_response.present?
      context.fail!(status: 422) unless context.publication.save
    end
  end
end
