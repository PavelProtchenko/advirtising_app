class CreatePromotionVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :promotion_videos do |t|
      t.string :name
      t.float :duration, precision: 2
      t.integer :frequency_per_minute

      t.timestamps
    end
  end
end
