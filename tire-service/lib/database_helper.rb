# frozen_string_literal: true

class DatabaseHelper
  def self.table_exists?(table_name)
    ActiveRecord::Base.connection.table_exists?(table_name)
  rescue ActiveRecord::NoDatabaseError
    false
  end
end
