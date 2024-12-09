require 'spec_helper'

describe OhMyEmbed::Providers::Spotify do
  let(:provider) { OhMyEmbed::Providers::Spotify }
  let(:content_url) { 'http://open.spotify.com/track/298gs9ATwr2rD9tGYJKlQR' }

  it 'the content_url matches the schema' do
    expect(provider.regex).to match content_url
  end

  describe 'fetching' do
    it 'returns a rich response with required attributes' do
      VCR.use_cassette('spotify') do
        response = provider.fetch(content_url)

        expect(response).to be_a OhMyEmbed::Response

        expect(response.type).to eq :rich

        expect(response.provider_name).to eq 'Spotify'
        expect(response.provider_url).to eq 'https://spotify.com'

        expect(response.url).to eq content_url

        expect(response.title).to eq 'Dance Our Tears Away (feat. Kristin Amparo) - Radio Edit'

        expect(response.author).to be nil

        expect(response.thumbnail).to eq({
          url: 'https://image-cdn-ak.spotifycdn.com/image/ab67616d00001e02dc7755f577f76b1207e8d9f7',
          width: 300,
          height: 300,
        })

        expect(response.embed[:html]).to be_a String
        expect(response.embed[:width]).to eq 456
        expect(response.embed[:height]).to eq 152
      end
    end

    it 'follows 308 redirect' do
      VCR.use_cassette('spotify2') do
        response = provider.fetch("https://open.spotify.com/episode/3wQDSWBw5zGyVQnC502Kk6?si=f0b9a6e0f4ba45a2")

        expect(response).to be_a OhMyEmbed::Response

        expect(response.type).to eq :video

        expect(response.provider_name).to eq 'Spotify'
        expect(response.provider_url).to eq 'https://spotify.com'

        expect(response.url).to eq "https://open.spotify.com/episode/3wQDSWBw5zGyVQnC502Kk6?si=f0b9a6e0f4ba45a2"

        expect(response.title).to eq 'Grüne Zukunft gestalten - Einblicke in die Garten- und Landschaftsbau- Branche'

        expect(response.author).to be nil

        expect(response.thumbnail).to eq({
          url: 'https://image-cdn-ak.spotifycdn.com/image/ab67656300005f1f86dc8dce4803f4e64fede079',
          width: 300,
          height: 300,
        })

        expect(response.embed[:html]).to be_a String
        expect(response.embed[:width]).to eq 624
        expect(response.embed[:height]).to eq 351
      end
    end
  end
end
