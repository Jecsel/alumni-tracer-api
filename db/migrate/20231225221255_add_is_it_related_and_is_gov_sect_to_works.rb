class AddIsItRelatedAndIsGovSectToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :is_it_related, :boolean, default: false
    add_column :works, :is_gov_sect, :boolean, default: false
  end
end
