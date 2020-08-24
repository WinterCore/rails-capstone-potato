class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
    end
    add_index :votes, [:article_id, :user_id]
  end
end
