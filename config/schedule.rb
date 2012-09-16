set :output, "#{path}/log/cron.log"

every 1.minute do
  runner 'Doorman.check'
end