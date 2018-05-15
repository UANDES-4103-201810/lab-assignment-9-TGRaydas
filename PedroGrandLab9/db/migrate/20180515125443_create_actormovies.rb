class CreateActormovies < ActiveRecord::Migration[5.1]
  def change
    create_table :actormovies do |t|
      t.string :role
      t.references :actor
      t.references :movie

      t.timestamps
    end
  end
end
