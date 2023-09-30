class AddUserRefToStores < ActiveRecord::Migration[5.1]
  def change
    add_reference :stores, :user, foreign_key: true
  end
end
