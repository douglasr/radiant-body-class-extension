namespace :radiant do
  namespace :extensions do
    namespace :body_class do
      
      desc "Runs the both the migration and update tasks of the Body Class extension"
      task :install => [:environment, :migrate, :update]
      
      desc "Database migration of the BodyClass extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          BodyClassExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          BodyClassExtension.migrator.migrate
        end
      end
      
      desc "Update the app with any required files"
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[BodyClassExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(BodyClassExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end
      
    end
  end
end