class UserDatabase
  def initialize
    @users = []
  end

  def insert(user)
    user = user.dup
    user[:id] = next_id

    @users.push(user)

    user
  end

  private

  def next_id
    @users.length + 1
  end
end
