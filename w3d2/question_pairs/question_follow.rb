class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM question_follows")
    self.from_data(data)
  end

  def self.from_data(data)
    follows = data.map { |datum| User.new(datum) }
    if follows.empty?
      nil
    elsif follows.count == 1
      follows.first
    else
      follows
    end
  end

  def self.followers_for_question_id(question_id)
    data = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        u.id, u.fname, u.lname
      FROM
        users u, question_follows qf
      WHERE
        u.id = qf.user_id
        AND
        qf.question_id = ?
    SQL

    User.from_data(data)
  end

  # TODO: go back to medium
  # def self.followed_questions_for_id(user_id)
  #   data = QuestionDBConnection.instance.execute(<<-SQL, user_id)
  #     SELECT
  #       *
  #     FROM
  #       users
  #     WHERE
  #       id = ?
  #   SQL
  #
  #   Question.from_data(data)
  # end

  def self.most_followed_questions(n)
    data = QuestionDBConnection.instance.execute(<<-SQL, n)
      SELECT
        q.id, q.title, q.body, q.user_id
      FROM
        questions q
      LEFT OUTER JOIN
        question_follows f
      ON q.id = f.question_id
      GROUP BY q.id
      ORDER BY COUNT(*) DESC
      LIMIT ?
    SQL

    Question.from_data(data)
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

end
