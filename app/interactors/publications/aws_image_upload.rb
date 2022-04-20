module Publications
  class AwsImageUpload
    include Interactor
    include Interactor::Contracts

    expects do
      required(:image).filled
    end

    def call
      bucket_name = 'news-website-ruby'
      image_name = "news-website-#{rand(0..100)}/#{Publication.last.id + 1}.jpg"
      file = context.image.tempfile
      bucker_region = 'us-east-1'
      object_aws = Aws::S3::Client.new(region: bucker_region)
      context.response_url = send_image?(object_aws, bucket_name, image_name, file)
    end

    def send_image?(object_aws, bucket_name, image_name, file)
      response = object_aws.put_object(
        bucket: bucket_name,
        key: image_name,
        body: file
      )
      if response.etag
        "https://news-website-ruby.s3.amazonaws.com/#{image_name}"
      else
        false
      end
    end
  end
end
