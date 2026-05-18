module SiteHelper
  def author_name = "Javier Julio"
  def author_email = "jjfutbol@gmail.com"

  def site_url = "https://javierjulio.com"
  def site_url_host = url_host(site_url)
  def site_title = author_name
  def site_description
    <<~DESCRIPTION.squish
      A Brooklyn based full stack developer with an eye for
      design and details. Currently, designing, building and
      automating solutions at Jackpocket in NYC.
    DESCRIPTION
  end

  def github_profile = "https://github.com/javierjulio"
  def github_profile_host = github_profile.gsub(/[A-Za-z]+:\/\/(www\.)?/, "")

  def url_host(url) = URI.parse(url).host.gsub("www.", "")

  def location_name = "Brooklyn, NY"

  def resume_path = "/resume/"
end
