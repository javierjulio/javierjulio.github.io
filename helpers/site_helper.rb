module SiteHelper
  def author_name = "Javier Julio"
  def author_email = "jjfutbol@gmail.com"

  def site_url = "https://javierjulio.com"
  def site_title = author_name
  def site_description
    <<~DESCRIPTION.squish
      A Brooklyn based full stack developer with an eye for
      design and details. Currently, designing, building and
      automating solutions at Jackpocket in NYC.
    DESCRIPTION
  end
end
