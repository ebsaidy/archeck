class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.string :department
      t.string :password_digest
      t.string :role
      t.string :remember_digest
      t.string :report_role
      t.string :added_by

      t.timestamps null: false
    end
  end
end
