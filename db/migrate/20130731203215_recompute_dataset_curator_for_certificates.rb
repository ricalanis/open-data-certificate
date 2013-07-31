class RecomputeDatasetCuratorForCertificates < ActiveRecord::Migration
  def up
    puts "...this may take some time\n"
    # this may still result in curator:nil for some certificates (where it's not supplied, or
    # there isn't a matching question on the survey)
    Certificate.where(curator:nil).find_each(batch_size: 20) {|c| c.update_from_response_set}
  end

  def down
  end
end
