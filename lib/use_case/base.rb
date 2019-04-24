module UseCase
  class Base
    def self.call(params:)
      new(params: params).call
    end

    def initialize(params:)
      @params = params
    end

    def call
      ActiveRecord::Base.transaction do
        validate! if defined?(validation_schema)
        persist
      end
    end

    private

    attr_reader :params

    # TODO: Implement Error handling
    def validate!
      validation_schema.tap do |validation|
        if validation.errors.present?
          raise StandardError, "Validation error: #{validation.messages}"
        end
      end
    end
  end
end
