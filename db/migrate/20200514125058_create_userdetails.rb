class CreateUserdetails < ActiveRecord::Migration[6.0]
  def change
    create_table :userdetails do |t|
      t.string :useraddress
      t.string :userstate
      t.string :usercity
      t.string :userpincode
      t.integer :userid
      t.timestamps
    end
  end
end
