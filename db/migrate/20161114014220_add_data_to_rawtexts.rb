class AddDataToRawtexts < ActiveRecord::Migration[5.0]
  def change
    add_column :rawtexts, :data, :string
  end
end
