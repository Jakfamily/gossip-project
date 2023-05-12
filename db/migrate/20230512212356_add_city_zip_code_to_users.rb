class AddCityZipCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :city_zip_code, :integer
  end
end
