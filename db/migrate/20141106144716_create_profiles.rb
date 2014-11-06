class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :location
      t.date :birthdate
      t.references :user, index: true

      t.timestamps
    end
  end
end
