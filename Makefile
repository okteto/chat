install:
	gem install bundler:2.1.0
	bundle install

start:
	rm -f /app/tmp/pids/server.pid
	bundle exec rails server -b 0.0.0.0

debug: 
	rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 1234 -- bin/rails s -b 0.0.0.0