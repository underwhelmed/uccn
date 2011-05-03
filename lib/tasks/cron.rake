require "heroku"
require "heroku/command"

task :cron => :environment do
  Rake::Task['backups:backup'].invoke
end

namespace :backups do
  desc "create a pg_dump and send to S3"
  task :backup => :environment do
 
    HEROKU_USERNAME = ENV["HIREFIRE_EMAIL"]
    HEROKU_PASSWORD = ENV["HIREFIRE_PASSWORD"]
    APP_NAME = 'uccn'
    BACKUP_BUCKET = 'uccn-db-backups'
    PATH_INSIDE_BUCKET = ''
  
    puts "Backup started @ #{Time.now}"

    heroku = Heroku::Client.new HEROKU_USERNAME, HEROKU_PASSWORD

    puts "Capturing new pg_dump"
    Heroku::Command.run_internal 'pgbackups:capture', ['--expire', '--app', APP_NAME], heroku
   
    puts "Opening S3 connection"
    AWS::S3::Base.establish_connection!(
      :access_key_id     => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    )

    begin
      bucket = AWS::S3::Bucket.find(BACKUP_BUCKET)
    rescue AWS::S3::NoSuchBucket
      AWS::S3::Bucket.create(BACKUP_BUCKET)
      bucket = AWS::S3::Bucket.find(BACKUP_BUCKET)
    end

    puts "Opening new pg_dump"
    pg_backup = Heroku::Command::Pgbackups.new(['--app', APP_NAME], heroku)
    local_pg_dump = open(pg_backup.pgbackup_client.get_latest_backup['public_url'])
    puts "Finished opening new pg_dump"

    puts "Uploading to S3 bucket"
    AWS::S3::S3Object.store(Time.now.to_s(:number), local_pg_dump, bucket.name + PATH_INSIDE_BUCKET)

    puts "Backup completed @ #{Time.now}"
  end
 
end