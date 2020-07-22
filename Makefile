start:
	rm -f /app/tmp/pids/server.pid
	bundle exec rails server -b 0.0.0.0

# debug:
#     rdebug-ide —-host 0.0.0.0 - rails s -b 0.0.0.0