module Publications
  class Destroy
    include Interactor
    include Interactor::Contracts

    expects do
      required(:publication)
    end

    on_breach do |breaches|
      context.fail!(errors: breaches)
    end

    def call
      context.fail!(status: 422) unless context.publication.destroy
    end
  end
end
