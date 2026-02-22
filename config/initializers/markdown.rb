# Restart the server to see changes made to this file.
# Redcarpet documentation: https://github.com/vmg/redcarpet
class ApplicationMarkdown < MarkdownRails::Renderer::Rails
  # Reformats punctuation like " and " into “ and ” instead.
  # https://github.com/vmg/redcarpet#also-now-our-pants-are-much-smarter
  # https://daringfireball.net/projects/smartypants/
  # include Redcarpet::Render::SmartyPants

  include MarkdownRails::Helper::Rouge

  def rouge_formatter
    ::Rouge::Formatters::HTML.new(rouge_theme)
  end

  def block_code(code, language)
    content_tag :pre, class: ["highlight"] do
      content_tag :code, data: { lang: language } do
        raw highlight_code code, language
      end
    end
  end

  # For access to `ActionController::Base.helpers`, uncomment the delegators below.
  # Several are already included in `MarkdownRails::Renderer::Rails`, but you can add more here.
  # Run `bin/rails runner "puts ActionController::Base.helpers.public_methods.sort"` for available methods.
  #
  # delegate \
  #   :request,
  #   :cache,
  #   :turbo_frame_tag,
  # to: :helpers

  # Flags: https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use
  def enable
    [:fenced_code_blocks]
  end
end

MarkdownRails.handle :md, :markdown do
  ApplicationMarkdown.new
end
