class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, optional: true, foreign_key: true
      t.references :comment, optional: true, foreign_key: true

      t.timestamps
    end
  end
end
