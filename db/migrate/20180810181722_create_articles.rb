class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer  :guide_id
      t.string   :title
      t.integer  :pageid
      t.string   :wikipedia_url
      t.text     :intro
      t.decimal  :latitude
      t.decimal  :longitude

      t.timestamps
    end
  end
end
