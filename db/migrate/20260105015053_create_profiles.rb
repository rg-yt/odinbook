class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username
      t.string :location
      t.text :bio

      t.timestamps
    end

    add_index :profiles, :username, unique: true


    User.find_each do |user|
      if user.profile.nil?
        user.create_profile!(username: user.email.split("@").first)
      end
    end
  end
end
