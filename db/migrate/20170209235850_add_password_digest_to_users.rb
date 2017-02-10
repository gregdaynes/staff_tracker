class AddPasswordDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :people, :password
    add_column :people, :password_digest, :string
  end
end
