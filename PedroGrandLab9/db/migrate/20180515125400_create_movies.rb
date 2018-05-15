class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.integer :duration
      t.references :director
      t.timestamp :release_date
      t.references :address

      t.timestamps
    end
  end
end
