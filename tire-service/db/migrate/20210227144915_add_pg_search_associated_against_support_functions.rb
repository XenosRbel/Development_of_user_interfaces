class AddPgSearchAssociatedAgainstSupportFunctions < ActiveRecord::Migration[5.2]
  def up
    safety_assured do
      say_with_time("Adding support functions for pg_search :associated_against") do
        if ActiveRecord::Base.connection.send(:postgresql_version) < 80400
          execute <<-'SQL'
  CREATE AGGREGATE array_agg(anyelement) (
    SFUNC=array_append,
    STYPE=anyarray,
    INITCOND='{}'
  )
          SQL
        end
      end
    end
  end

  def down
    safety_assured do
      say_with_time("Dropping support functions for pg_search :associated_against") do
        if ActiveRecord::Base.connection.send(:postgresql_version) < 80400
          execute <<-'SQL'
  DROP AGGREGATE array_agg(anyelement);
          SQL
        end
      end
    end
  end
end
