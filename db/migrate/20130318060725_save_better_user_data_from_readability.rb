class SaveBetterUserDataFromReadability < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :token
      t.string :token_secret
      t.text :body
      t.remove :name
    end
  end

  def down
    change_table :users do |t|
      t.string :name
      t.remove :token
      t.remove :token_secret
      t.remove :body
    end
  end
end
