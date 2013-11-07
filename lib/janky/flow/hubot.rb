module Janky
  class Hubot < Sinatra::Base

    get %r{\/\*\/([-_\+\.a-zA-z0-9\/]+)} do |branch_name|
      branch_summary branch_name
    end

    def branch_summary(branch_name)
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
