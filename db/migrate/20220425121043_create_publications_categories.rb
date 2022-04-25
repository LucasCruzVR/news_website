class CreatePublicationsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :publications_categories do |t|
      t.integer :publication_id
      t.integer :category_id
      t.timestamps
    end

    add_foreign_key :publications_categories, :publications, column: :publication_id, name: 'publication_fk'
    add_foreign_key :publications_categories, :categories, column: :category_id, name: 'category_fk'
  end
end
