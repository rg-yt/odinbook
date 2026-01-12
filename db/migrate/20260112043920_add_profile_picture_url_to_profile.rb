class AddProfilePictureUrlToProfile < ActiveRecord::Migration[8.1]
  def change
    add_column :profiles, :profile_picture_url, :string, default: "https://wallpapers-clan.com/wp-content/uploads/2022/12/sanrio-pfp-6.jpg"
  end
end
