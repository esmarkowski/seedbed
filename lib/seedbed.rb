require 'rails'
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
  
  def self.available_seeds
    @path = "db/seeds"
    basedir = File.join( File.expand_path(@path), "**" , "*.rb")
    files = Dir.glob( basedir ).collect{|d| d.split( File.expand_path(@path) ).last.split('/')[1..-1].collect{|s| s.split('.rb').first.to_sym} }
    namespaces = Hash.new{ |h,k| h[k] = Hash.new &h.default_proc }
    files.each do |path|
      sub = namespaces
      path.each{ |dir| sub[dir]; sub = sub[dir] }
    end
    namespaces
  end
  
  def self.tasks
    build_tree( SeedBed.available_seeds )
  end
  
  private 
  
  def self.build_tree(b)
    fil = ""
    b.keys.each do |t|
      fil << "desc \"plants seeds for #{t}\" \n"
      if b[t].empty?
      fil << "task :#{t} do |tsk| \n"
        fil << "puts tsk.scope[2..-1].join('/') \n"
        fil << "SeedBed.plant( tsk.scope[2..-1].join('/') + '/' + '#{t}' )\n"
      fil << "end \n"
      else
        fil << "namespace :#{t} do \n"
          fil << build_tree( b[t]  )
          fil << "\n"
        fil << "end \n"
      end
    end
    fil
    # branch.keys.reject{|k| branch[k].empty? }.each do |ns|
    #   namespace ns do 
    #     branch[ns].keys.each do |t|
    #       desc "Runs seed for #{t}"
    #       task t do 
    #         puts "task #{t}"
    #       end
    #     end
    #   end
    # end
  end
  
  
end

require 'seedbed/system'
require 'seedbed/railtie' if defined?(Rails)
