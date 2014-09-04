desc 'Resets the application to a clean slate'
task :reset do
  %w( db:reset user play:hangman ).each do |task|
    Rake::Task[task].invoke
  end
end
