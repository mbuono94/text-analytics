class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :date
      t.string :time
      t.string :direction
      t.string :number
      t.string :name
      t.string :text

      t.timestamps
    end
  end
end
