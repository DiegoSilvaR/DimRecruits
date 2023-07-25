class CreateJoinTableCandidateJobOffer < ActiveRecord::Migration[7.0]
  def change
    create_join_table :candidates, :job_offers do |t|
      # t.index [:candidate_id, :job_offer_id]
      # t.index [:job_offer_id, :candidate_id]
    end
  end
end
