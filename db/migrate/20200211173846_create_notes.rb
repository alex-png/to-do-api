class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.references :user, foreign_key: true
    end
  end
end
