class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications, comment: 'News from Website' do |t|
      t.string :title, null: false, comment: 'News title'
      t.string :subtitle, null: false, comment: 'News subtitle/simple text'
      t.text :content, null: false, comment: 'News content'
      t.string :url_image, comment: 'News image'
      t.timestamps
    end
  end
end
