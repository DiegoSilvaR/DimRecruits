class CreateJobOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :job_offers do |t|
      t.string :title
      t.text :description
      t.text :requirements
      t.decimal :salary
      t.date :expiration_date

      t.timestamps
    end
  end
end
