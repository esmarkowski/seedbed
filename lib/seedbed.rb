class SeedBed
  
  @@debug = false
  
  
  
  def plant( file )
    puts "Loading #{File.expand_path("db/seeds/#{file.to_s}.rb")}" if SeedBed.debug
    require File.expand_path("db/seeds/#{file.to_s}.rb")
  end
  
  def self.message( msg )
    puts ""
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    puts msg
    puts ""
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
  end
  
  def self.debug=(d)
    @@debug = d
  end
  
  def self.debug
    @@debug
  end
  
end

require 'seedbed/system'