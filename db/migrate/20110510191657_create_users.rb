class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	t.column :username, :string
	t.column :password, :string
	t.column :userfirstname, :string
	t.column :userlastname, :string
	t.column :useremail, :string
	t.column :userphone, :string
	t.column :createdate, :datetime
	t.column :admin, :boolean
	t.column :rank, :integer
    end
  end

  def self.down
    drop_table :users
  end
end
