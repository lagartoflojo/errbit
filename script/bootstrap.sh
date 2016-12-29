#!/usr/bin/env sh

echo "Errbit::Application.config.secret_token = '$(bundle exec rake secret)'" > config/initializers/__secret_token.rb && \
  bundle exec rake db:seed && \
  bundle exec rake db:mongoid:create_indexes && \
  bundle exec unicorn -c ./config/unicorn.default.rb
