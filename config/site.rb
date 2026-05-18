# Configure your Sitepress site
site = Sitepress::Site.new(root_path: ".")

# Configure the development server
Sitepress.server = Sitepress::ApplicationServer.new(site)
Sitepress.server.live_reload = true

# Add build processes (uncomment to enable)
Sitepress.server.add_process :css, "bundle exec rake tailwindcss_watch"
# Sitepress.server.add_process :js, "esbuild ./assets/javascripts/site.js --outdir=./public --watch"

# Support live-reload from models and layouts
Sitepress::ApplicationServer.class_eval do
  private

  def site_watch_paths
    [
      site.pages_path.to_s,
      site.helpers_path.to_s,
      site.assets_path.to_s,
      site.models_path.to_s,
      site.root_path.join("layouts").to_s
    ].select { |p| File.directory?(p) }
  end
end
