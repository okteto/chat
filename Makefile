build-pro:
	/Users/pablo/github.com/okteto/okteto/bin/okteto build \
	-f Dockerfile \
	--build-arg RUBY_VERSION="2.6.5" \
	--build-arg PG_MAJOR="11" \
	--build-arg NODE_MAJOR="11" \
	--build-arg YARN_VERSION="1.22.4" \
	--build-arg BUNDLER_VERSION="2.1.4" \
	# -t pchico83/rails-k8s-demo:prod
	-t okteto.dev/rails-k8s-demo:prod

build-dev:
	/Users/pablo/github.com/okteto/okteto/bin/okteto build \
	-f Dockerfile.dev \
	--build-arg RUBY_VERSION="2.6.5" \
	--build-arg PG_MAJOR="11" \
	--build-arg NODE_MAJOR="11" \
	--build-arg YARN_VERSION="1.22.4" \
	--build-arg BUNDLER_VERSION="2.1.4" \
	# -t pchico83/rails-k8s-demo:dev
	-t okteto.dev/rails-k8s-demo:dev

upgrade-dev:
	helm upgrade chat chart --install

start:
	rm -f /app/tmp/pids/server.pid
	bundle exec rails server -b 0.0.0.0

# debug:
#     rdebug-ide —-host 0.0.0.0 - rails s -b 0.0.0.0