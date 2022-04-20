module Categories
  class Update
    include Interactor
    include Interactor::Contracts

    expects do
      required(:category_params).filled
      required(:category)
    end

    on_breach do |breaches|
      context.fail!(errors: breaches)
    end

    def call
      context.category.assign_attributes(context.category_params)
      context.fail!(status: 422) unless context.category.save
    end
  end
end
