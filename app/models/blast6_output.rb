class Blast6Output < ActiveRecord::Base
  self.inheritance_column = :type
  def self.import(file)
    CSV.foreach(file.path, headers: true, col_sep: "\t") do |row|
      self.create! row.to_hash
    end
  end

end