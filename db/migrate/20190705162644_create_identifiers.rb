class CreateIdentifiers < ActiveRecord::Migration[5.2]
  def change
    create_table :identifiers do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
