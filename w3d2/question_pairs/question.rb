class Question
  attr_accessor :title, :body
  attr_reader :user_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
    self.from_data(data)
  end

  def self.from_data(data)
    questions = data.map { |datum| self.new(datum) }
    if questions.empty?
      nil
    elsif questions.count == 1
      questions.first
    else
      questions
    end
  end

  def self.find_by_user_id(user_id)
    data = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    self.from_data(data)
  end

  def self.find_by_id(id)
    data = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    self.from_data(data)
  end

  def self.most_followed(n)
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

    QuestionFollow.from_data(data)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    User.find_by_id(@user_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end
end
