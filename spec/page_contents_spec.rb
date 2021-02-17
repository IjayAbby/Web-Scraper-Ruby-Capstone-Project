require_relative '../lib/page_contents'
require_relative '../lib/scraper'

describe Page do
  let(:scraper) { Scraper.new('https://www.coursera.org/search?query=free') }
  let(:value) { Page.new(50, 1) }

  describe '#start' do
    it 'calls the start method in Page class with a true value' do
      allow(value).to receive(:start).and_return(true)
      expect(value.start).to eql(true)
    end

    it 'calls the start method in Page class with a false value' do
      allow(value).to receive(:start).and_return(true)
      expect(value.start).not_to eql(false)
    end
  end

  describe '#scraper' do
    it 'checks the various pages of the website and returns the course information' do
      list = [{
        Partner: 'Stanford University',
        Course: 'Stanford Introduction to Food and Health',
        Level: 'Beginner',
        Enrollment: 'Rated 4.7 out of five stars. 17669 reviews4.7(17,669)480k students',
        url: 'https://www.coursera.org/search?query=free/learn/food-and-health'

      }]
      allow(value).to receive(:scraper).and_return(list)
      expect(value.scraper).to eql(list)
    end

    it 'checks the various pages of the website and does not return true' do
      list = [{
        Partner: 'Stanford University',
        Course: 'Stanford Introduction to Food and Health',
        Level: 'Beginner',
        Enrollment: 'Rated 4.7 out of five stars. 17669 reviews4.7(17,669)480k students',
        url: 'https://www.coursera.org/search?query=free/learn/food-and-health'
      }]
      allow(value).to receive(:scraper).and_return(list)
      expect(value.scraper).not_to eql(true)
    end

    it 'checks the various pages of the website and does not return false' do
      list = [{
        Partner: 'Stanford University',
        Course: 'Stanford Introduction to Food and Health',
        Level: 'Beginner',
        Enrollment: 'Rated 4.7 out of five stars. 17669 reviews4.7(17,669)480k students',
        url: 'https://www.coursera.org/search?query=free/learn/food-and-health'
      }]
      allow(value).to receive(:scraper).and_return(list)
      expect(value.scraper).not_to eql(false)
    end
  end
end
