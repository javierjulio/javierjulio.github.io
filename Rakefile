require "html-proofer"
require "sitepress-core"

BUILD_DIR = "build"

def run_command(command)
  puts "+ #{command}"
  system command, exception: true
end

task :build do
  run_command "rm -rf #{BUILD_DIR}"
  run_command "bundle exec sitepress compile --output-path #{BUILD_DIR}"
  html = File.read("layouts/redirect_template.html")
  Sitepress::Site.new.resources.each do |resource|
    Array(resource.data["redirect_from"]).each do |old_path|
      FileUtils.mkdir_p(File.join(BUILD_DIR, old_path))
      File.write(File.join(BUILD_DIR, old_path, "index.html"), html.gsub("{PATH}", resource.request_path))
    end
  end
end
task compile: :build

task :server do
  run_command "bundle exec sitepress server"
end
task serve: :server
task s: :server

task html_proofer: :build do
  HTMLProofer.check_directory(
    BUILD_DIR,
    cache: { timeframe: { internal: "1w" } },
    checks: %w(Favicon Images Links OpenGraph Scripts),
    disable_external: true # disables external link checking
  ).run
end

task :herb do
  run_command "bundle exec herb analyze"
  run_command "bundle exec herb lint"
end

task test: [:html_proofer, :herb]

task default: :test
