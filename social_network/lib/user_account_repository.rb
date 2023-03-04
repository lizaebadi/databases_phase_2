require 'user_account'

class User_accountRepository

  def all
    arr_users = []

    sql = 'SELECT id, email_address, username FROM user_accounts;'

    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user_account = User_account.new 

      user_account.id = record['id'].to_i
      user_account.email_address = record['email_address']
      user_account.username = record['username']
      arr_users << user_account
    end 

    return arr_users
  end

  def find(id)
    sql_params = [id]
    sql = 'SELECT id, email_address, username FROM user_accounts WHERE id = $1;'

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    user = User_account.new
    
    record = result_set[0]

    user.id = record['id'].to_i
    user.email_address = record['email_address']
    user.username = record['username']

    return user
  end

  # Add more methods below for each operation you'd like to implement.

   # create a new user account
   # one argument: new user details
  def create(user_account)
    #user_account = User_account.new
    # executes the SQL query:
    sql = 'INSERT INTO user_accounts (email_address, username) VALUES ($1, $2);'
    sql_params = [user_account.email_address, user_account.username]

    DatabaseConnection.exec_params(sql, sql_params)
    return nil
    # doesn't return anything. 
  end


  # Deletes a single user_account 
  # one argument: the user account to delete
  def delete(id)
    #executes the SQL query:
    sql_params = [id]
    sql = 'DELETE FROM user_accounts WHERE id = $1;'
    DatabaseConnection.exec_params(sql, sql_params)

    return nil
    #doesn't return anything 
  end
end