desc 'Migrate DataMapper database'
task :migrate do
  DataMapper.auto_migrate!
end