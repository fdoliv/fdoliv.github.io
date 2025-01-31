require 'net/http'
require 'json'

module Jekyll
  class BlueskyPost < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @username = text.strip
    end

    def render(context)
      uri = URI("https://bsky.social/xrpc/app.bsky.feed.getAuthorFeed?actor=#{@username}")
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)

      if data['feed']
        post = data['feed'].first['post']['record']['text']
        "<div class='bluesky-post'><p>@#{@username}</p><p>#{post}</p></div>"
      else
        '<p>Erro ao carregar posts do Bluesky.</p>'
      end
    end
  end
end

Liquid::Template.register_tag('bluesky_post', Jekyll::BlueskyPost)
