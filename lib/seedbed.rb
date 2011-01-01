class SeedBed
  
  @@debug = true
  attr_accessor :path
  
  def plant( file )
    @path = "db/seeds"
    yield self if block_given?
    expanded_path = File.expand_path("#{@path}/#{file.to_s}.rb")
    puts "Growing #{expanded_path}" if SeedBed.debug
    require expanded_path
    
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