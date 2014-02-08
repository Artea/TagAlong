class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :when
      t.string :where
      t.boolean :attend

      t.timestamps
    end
  end
end
