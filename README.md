janky-flow
==========

This is a gem to extend [Janky](https://github.com/github/janky) with
features that are useful when using the git-flow branching strategy.

Hubot usage
-----------

One new hubot command has been added to allow checking the status of
a specific branch on all repos:

    hubot ci status */develop

_This requires a [hubot script](https://github.com/github/hubot-scripts)._

Installing
----------

Follow the normal [guide](https://github.com/github/janky#deploying)
until you reach the `bundle install` command; then:

    $ echo 'gem "janky-flow"' >> Gemfile
    $ sed -i '1a require "janky-flow"' config/environment.rb
    $ git add Gemfile config/environment.rb

Then continue with `bundle install` and follow the rest of the steps
outlined.
