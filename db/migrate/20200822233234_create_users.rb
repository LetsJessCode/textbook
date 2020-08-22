class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :user_name
      t.password_digest :password

      t.timestamps
    end
  end
end
