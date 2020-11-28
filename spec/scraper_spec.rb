# spec/scraper_spec.rb

require '../lib/scraper'

describe Scraper do
  let(:scrap) { Scraper.new('https://www.newsinlevels.com/') }
  describe '#scraper' do
    it 'raise error for private methods' do
      expect { scrap.scraper }.to raise_error(NoMethodError)
    end
  end
end
