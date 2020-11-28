# spec/scraper_spec.rb

require_relative '../lib/scraper'

describe Scraper do
  let(:scrap) { Scraper.new('https://www.newsinlevels.com/') }
  describe '#new' do
    it 'creates a new object' do
      expect(scrap).to be_a(Scraper)
    end
  end
  describe '#scraper' do
    it 'raise error for private methods' do
      expect { scrap.scraper }.to raise_error(NoMethodError)
    end
  end
  describe '#print1' do
    it 'raise error for private methods' do
      expect { scrap.print1 }.to raise_error(NoMethodError)
    end
  end
  describe '#print2' do
    it 'raise error for private methods' do
      expect { scrap.print2 }.to raise_error(NoMethodError)
    end
  end
  describe '#condition' do
    it 'raise error for private methods' do
      expect { scrap.condition }.to raise_error(NoMethodError)
    end
  end
end
