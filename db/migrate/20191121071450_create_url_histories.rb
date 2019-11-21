class CreateUrlHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :url_histories do |t|
      t.string :scheme
      t.string :user
      t.string :password
      t.string :host
      t.integer :port
      t.string :path
      t.string :query
      t.string :opaque
      t.string :fragment

      t.timestamps
    end
  end
end
