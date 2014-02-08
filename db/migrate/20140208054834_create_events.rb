class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.string :name
      t.datetime :when

      t.timestamps
    end
  end
end
