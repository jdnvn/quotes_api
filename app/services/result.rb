module Result
  class ServiceResult
    attr_reader :value

    def initialize(value:)
      @value = value
    end

    def success? ; end
    def failure? ; end
  end

  class SuccessResult < ServiceResult
    def success?
      true
    end

    def failure?
      false
    end
  end

  class FailureResult < ServiceResult
    attr_reader :error

    def initialize(value:)
      @error = value
    end

    def success?
      false
    end

    def failure?
      true
    end
  end
end
