class Component < ActiveRecord::Base
  belongs_to :form
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |component|
        csv << component.attributes.values_at(*column_names)
      end
    end
  end
end
