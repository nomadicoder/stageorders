class Stage < ActiveRecord::Base
  has_many :stages
  has_one :support_unit
  has_many :stage_status

  def self.find_all_stages
    Stage.order(:number)
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |stage|
        csv << stage.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |stage|
        csv << stage.attributes.values_at(*column_names)
      end
    end
  end
end
