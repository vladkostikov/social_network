class ModifyTopics < ActiveRecord::Migration[7.0]
  def change
      add_index :topics, :alias, unique: true
      Topic.create :alias => 'text', :title => 'Текст'
      Topic.create :alias => 'images', :title => 'Картинки'
      Topic.create :alias => 'facts', :title => 'Факты'
  end
end
