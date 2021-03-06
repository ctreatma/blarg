
if %w(development test).include? Rails.env
  require 'rubocop/rake_task'

  Rake::Task[:default].prerequisites.clear

  task default: [:rubocop, :spec]

  task :rubocop do
    RuboCop::RakeTask.new
  end
end
