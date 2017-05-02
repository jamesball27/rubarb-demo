class User
  attr_reader :errors

  def initialize(username, password)
    @username = username
    @password = password
  end

  def errors
    @errors ||= []
  end

  def valid?
    valid = true

    if @username.empty?
      errors << "Username can't be blank"
      valid = false
    end

    if @password.empty?
      errors << "Password can't be blank"
      valid = false
    end

    valid
  end

  def save
    return false unless valid?
    true
  end

end
