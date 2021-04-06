class AddGhUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gh_username, :string
  end
end
