module Categories
  class Destroy
    include Interactor
    include Interactor::Contracts

    expects do
      required(:category).filled
    end

    on_breach do |breaches|
      context.fail!(errors: breaches)
    end

    def call
      context.fail!(status: 422) unless context.category.destroy
    end
  end
end
