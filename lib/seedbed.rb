class SeedBed
  def plant( file )
    require  "db/seeds/#{file}.rb"
  end
end

require 'seedbed/system'