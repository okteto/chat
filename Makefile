install:
	gem install bundler:2.1.0
	bundle install
	yarn install --check-files

start:
	rm -f /app/tmp/pids/server.pid
	bundle exec rails server

debug: 
	rdebug-ide --host 0.0.0.0 -- bin/rails s -b 0.0.0.0