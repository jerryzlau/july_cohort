require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    @col ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    @col.first.map!(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      #define getter method
      define_method(col) do
        attributes[col]
      end

      #define setter method
      define_method("#{col.to_s}=") do |arg|
        attributes[col] = arg
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name || self.to_s.tableize

  end

  def self.all
    # ...
    data = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    parse_all(data)
  end

  def self.parse_all(results)
    # ...
    objects = []
    results.each do |data|
      objects << self.new(data)
    end
    objects
  end

  def self.find(id)
    # ...
    wanted_data = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{self.table_name}.id = #{id}
    SQL

    if wanted_data.empty?
      nil
    else
      self.new(wanted_data.first)
    end
  end

  def initialize(params = {})
    # ...
    params.each do |key, val|
      unless self.class.columns.include?(key.to_sym)
        raise "unknown attribute '#{key}'"
      else
        self.send("#{key}=", val)
      end
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    values = []
    self.class.columns.each do |col|
      values << self.send("#{col}")
    end
    values
  end

  def insert
    # ...
    columns = self.class.columns
    col_names = columns[1..-1].join(",")
    question_marks = (["?"] * (columns.length-1)).join(",")

    inputs = attribute_values[1..-1]
    DBConnection.execute(<<-SQL, *inputs)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    columns = self.class.columns
    set = columns[1..-1].join("= ?, ") + "= ?"
    table_id = "#{self.class.table_name}.id = #{self.id}"
    inputs = attribute_values[1..-1]

    DBConnection.execute(<<-SQL, *inputs)
      UPDATE
        #{self.class.table_name}
      SET
        #{set}
      WHERE
        #{table_id}
    SQL
  end

  def save
    # ...
    self.id.nil? ? insert : update
  end
end
