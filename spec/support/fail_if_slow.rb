RSpec.configure do |config|
  config.add_setting :fail_if_slower_than

  config.around(:example, :fail_if_slower_than) do |example|
    start_time = Time.now
    run_limit = example.metadata[:fail_if_slower_than]
    example.run
    execute_time = start_time - Time.now
    if (execute_time > run_limit)
      raise "Example run time to slow run time must be now slower then #{run_limit} was #{start_time - Time.now}"
    end
  end
end