class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :content   :null => false
      t.belongs_to(:user, foreign_key: true)

      t.timestamps
    end
  end
end
