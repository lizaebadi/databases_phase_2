require 'user_account_repository'


RSpec.describe User_accountRepository do 

  def reset_user_accounts_table
    seed_sql = File.read('spec/seeds_user_accounts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_user_accounts_table
  end

  it 'gets all students' do 

    repo = User_accountRepository.new

    users = repo.all

    expect(users.length).to eq 2

    expect(users[0].id).to eq  1
    expect(users[0].email_address).to eq 'david@gmail.com'
    expect(users[0].username).to eq 'David2022'

    expect(users[1].id).to eq  2
    expect(users[1].email_address).to eq 'john@gmail.com'
    expect(users[1].username).to eq 'John123'

  end 

  it 'gets a single student' do 

    repo = User_accountRepository.new

    user = repo.find(1)

    expect(user.id).to eq  1
    expect(user.email_address).to eq 'david@gmail.com'
    expect(user.username).to eq 'David2022'
  end 

  it 'creates a new user account' do 

    repo = User_accountRepository.new

    new_user = User_account.new 
    new_user.email_address = 'new@gmail.com'
    new_user.username = 'new123'
    
    repo.create(new_user)

    all_users = repo.all 
    last_user = all_users.last

    expect(last_user.id).to eq 3 
    expect(last_user.email_address).to eq 'new@gmail.com'
    expect(last_user.username).to eq 'new123'
  end 

  it 'deletes a user account' do 

    repo = User_accountRepository.new 

    deleted_user = repo.delete(1)

    users = repo.all

    expect(users.length).to eq 1 
  end 
end 