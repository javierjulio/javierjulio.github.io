require "html-proofer"

OUTPUT_PATH = "build"

def run_command(command)
  puts "+ #{command}"
  system command
end

task :build do
  run_command "rm -rf #{OUTPUT_PATH}"
  run_command "bundle exec sitepress compile --output-path #{OUTPUT_PATH}"
end
task compile: :build

task :server do
  run_command "bundle exec sitepress server"
end
task serve: :server
task s: :server

task test: :build do
  HTMLProofer.check_directory(
    OUTPUT_PATH,
    cache: { timeframe: { internal: "1w" } },
    checks: %w(Favicon Images Links OpenGraph Scripts),
    disable_external: true # disables external link checking
  ).run
end

task default: :test
