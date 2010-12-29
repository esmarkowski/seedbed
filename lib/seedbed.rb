class SeedBed
  def plant( file )
    require  "db/seeds/#{file}.rb"
  end
  
  def seed_msg( msg )
    puts ""
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    puts msg
    puts ""
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
  end
end

require 'seedbed/system'