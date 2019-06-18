class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest  #need to call has_secure_password macro in user .rb, allows to use authenticate
    end
  end
end
