module WikiScraper
  class EventsCreator
    def initialize(date)
      @date = date.to_date
    end

    def create
      summary_day.links.each do |link|
        # Not all links go to Wikipedia pages
        next if link =~ /http/

        Event.create(article_attributes_for(link))
      end
    end

    private

    def day
      Day.find_or_create_by(date: @date)
    end

    def summary_day
      summary_days.detect { |day| day.date == @date }
    end

    def summary_days
      WikiScraper::Parser::Summary.new(summary_page).days
    end

    def summary_page
      WikiScraper::PageImporter.new(summary_url).page
    end

    def summary_url
      WikiScraper::URL::Summary.new(@date)
    end

    def article_attributes_for(link)
      article_url = WikiScraper::URL::Article.new(link)
      article_page = WikiScraper::PageImporter.new(article_url).page
      WikiScraper::Parser::Article.new(article_page).to_hash.merge(day: day)
    end
  end
end
