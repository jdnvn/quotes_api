class BaseService
  def initialize(**args)
    puts args
  end

  def call
    puts 'called BaseService'
  end

  def success(value)
    Result::SuccessResult.new(value: value)
  end

  def failure(value)
    Result::FailureResult.new(value: value)
  end
end
