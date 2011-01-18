require 'seedbed'
require 'rails'

class SeedBed
  class Railtie < Rails::Railtie
    rake_tasks do 
      load "tasks/tasks.rake"
    end
  end
end