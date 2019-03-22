# Dream Lines [Backend]



Working through
https://semaphoreci.com/community/tutorials/setting-up-a-bdd-stack-on-a-rails-5-application

####Why do I need to do this??
bundle install --path vendor/bundle
By passing the --path parameter we are telling bundler to install gems in the bdd-app/vendor/bundle directory. If you leave off the parameter, gems will be installed globally, which isn’t a good practice if you are working on more than one Ruby application on the development machine.
