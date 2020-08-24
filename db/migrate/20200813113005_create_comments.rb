class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :author, null: false, index: true, foreign_key: { to_table: :users }
      t.references :article, null: false, index: true, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
