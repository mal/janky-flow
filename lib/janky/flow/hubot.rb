module Janky
  module Flow
    class Hubot < Sinatra::Base

      get '/help' do
        fail "downstream app not set" unless @app.respond_to? :call
        status, headers, body = @app.call env
        @response.status = status
        @response.body = body.body[0].sub! "ci status\n", "\\0ci status */develop\n"
        @response.headers.merge! headers.reject { |k| k == 'Content-Length' }
        nil
      end

      get %r{\/\*\/([-_\+\.a-zA-z0-9\/]+)} do |branch_name|
        content_type "text/plain"
        repos = Repository.all(:include => [:branches, :commits, :builds]).map do |repo|
          branch = repo.branch_for(branch_name)

          "%-17s %-13s %-10s %40s" % [
            repo.name,
            branch.status,
            repo.campfire_room,
            repo.uri
          ]
        end
        repos.join("\n")
      end

    end
  end

  class Hubot
    use Janky::Flow::Hubot
  end
end
