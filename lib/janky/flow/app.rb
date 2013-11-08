module Janky
  module Flow
    class App < Sinatra::Base

      get %r{\/\*\/([-_\+\.a-zA-z0-9\/]+)} do |branch_name|
        authorize_index
        @builds = Build.queued.where(:branch_id => Branch.where(:name => branch_name)).first(50)
        mustache :index
      end

    end
  end

  class App
    use Janky::Flow::App
  end
end
