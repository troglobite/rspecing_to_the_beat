RSpec.configure do |c|
  c.before(:suite) do
    Sequel.extension :migration
    Sequel::Migrator.run(DB, 'db/migrations')
    DB[:expenses].truncate

    FileUtils.remove_file('log/sequel.log')
    FileUtils.mkdir_p('log')
    require 'logger'
    DB.loggers << Logger.new('log/sequel.log')
  end

  c.around(:example, :db) do |example|
    DB.log_info("Starting Example: #{example.description}")
    DB.transaction(rollback: :always) do
      example.run
    end
    DB.log_info("Ending Example: #{example.description}\n")
  end
end