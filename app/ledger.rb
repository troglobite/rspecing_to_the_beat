require_relative "../config/sequel"

module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)
  VALID_KEYS = ["payee", "amount", "date"].freeze

  class Ledger
    def record(expense)
      message = validate_payload(expense)
      return RecordResult.new(false, nil, message) unless message.empty?

      DB[:expenses].insert(expense)
      id = DB[:expenses].max(:id)
      RecordResult.new(true, id, nil)
    end

    def expenses_on(date)
      DB[:expenses].where(date: date).all
    end

    def validate_payload(expense)
      message = ""
      VALID_KEYS.each do |key|
        message += "Invalid expense: #{key} is required" unless expense.key?(key)
      end
      message
    end
  end
end