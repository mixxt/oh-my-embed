module OhMyEmbed
  module Providers
    class Soundcloud < OhMyEmbed::Provider
      # Soundcloud oembed documentation:
      # https://developers.soundcloud.com/docs/oembed

      self.endpoint = 'https://soundcloud.com/oembed'
      self.schemes = [
        '//soundcloud.com/*',
        '//*.soundcloud.com/*',
      ]
    end
  end
end
