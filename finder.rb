module OkCuGit
  class Finder

    def initialize(repo_name)
      @repo = repo_name
    end

    def clone_repo
      `git clone https://github.com/#{@repo}.git 2>&1`
    end

    def change_directory
      Dir.chdir("#{@repo.split("/").last}")
    end

    def change_dir_to_root
      Dir.chdir("..")
    end

    def get_log
      `git log`
    end

    def all_contributors
      clone_repo
      change_directory

      log_arr = get_log.split("\n\n").map { |commit| commit.split("\n") }
      authors = log_arr.flatten.select { |entry| entry.start_with?("Author:") }.uniq

      authors = authors.map{ |author| author.sub("Author: ", "") }
    end

    def get_match
      all_contributors.sample(2).sort
    end
  end
end
