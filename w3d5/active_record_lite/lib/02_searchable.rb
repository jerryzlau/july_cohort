require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    # ...
    where_clause = params.keys.join(" = ? AND ") + " = ?"
    inputs = params.values
    data = DBConnection.execute(<<-SQL, *inputs )
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_clause}
    SQL

    parse_all(data)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
