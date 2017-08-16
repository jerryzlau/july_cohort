class User
  attr_accessor :fname, :lname

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM users")
    self.from_data(data)
  end

  def self.from_data(data)
    users = data.map { |datum| User.new(datum) }
    if users.empty?
      nil
    elsif users.count == 1
      users.first
    else
      users
    end
  end

  def self.find_by_name(fname, lname)
    data = QuestionDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ?
        AND
        lname = ?
    SQL

    User.from_data(data)
  end

  def self.find_by_id(id)
    data = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    User.from_data(data)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    data = QuestionDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    Question.from_data(data)
  end

  def authored_replies
    data = QuestionDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    Question.from_data(data)
  end

  def to_s
    "<id: #{@id} name: #{@fname} #{@lname}>"
  end

  def inspect
    self.to_s
  end


end
