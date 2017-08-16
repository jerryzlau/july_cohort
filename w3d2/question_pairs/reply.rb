class Reply
  attr_accessor :title, :body
  attr_reader :user_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM replies")
    self.from_data(data)
  end

  def self.from_data(data)
    replies = data.map { |datum| self.new(datum) }
    if replies.empty?
      nil
    elsif replies.count == 1
      replies.first
    else
      replies
    end
  end

  def self.find_by_user_id(user_id)
    data = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    self.from_data(data)
  end

  def self.find_by_question_id(question_id)
    data = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    self.from_data(data)
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @parent_reply_id = options['parent_reply_id']
    @question_id = options['question_id']
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    data = QuestionDBConnection.instance.execute(<<-SQL, @parent_reply_id)
      SELECT p.id, p.user_id, p.parent_reply_id, p.question_id
      FROM replies AS c
      JOIN replies AS p
      ON c.parent_reply_id = p.id
      WHERE p.id = ?
    SQL

    Reply.from_data(data)
  end

  def child_reply
    data = QuestionDBConnection.instance.execute(<<-SQL, @id)
      SELECT *
      FROM replies AS child
      WHERE child.parent_reply_id = ?
    SQL

    Reply.from_data(data)
  end

end
