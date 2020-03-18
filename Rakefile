require "html-proofer"

def default_options
  {
    assume_extension: ".html",
    typhoeus: {
      ssl_verifypeer: false,
      ssl_verifyhost: 0,
      timeout: 3
    }
  }
end

def run_html_proofer(**options)
  HTMLProofer.check_directory(
    jekyll_site_directory,
    default_options.merge(options)
  ).run
end

def jekyll_config
  File.exist?("_config.yml") ? YAML.load_file("_config.yml") : {}
end

def jekyll_site_directory
  jekyll_config["destination"] || "./_site"
end

def baseurl
  jekyll_config["baseurl"] || ""
end

task :build do
  # system "rm -rf #{jekyll_site_directory}"
  system "bundle exec jekyll build --incremental"
end

task test: :build do
  run_html_proofer(
    cache: {
      timeframe: '1w'
    },
    check_html: true,
    # check_favicon: true,
    check_img_http: true,
    check_opengraph: true,
    check_external_hash: true,
    parallel: {
      in_processes: 3
    },
    url_ignore: [],
    url_swap: {
      /^#{baseurl}/ => ""
    }
  )
end

task default: :test
