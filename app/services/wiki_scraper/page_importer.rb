module WikiScraper
  class PageImporter
    def initialize(url_formatter)
      @url_formatter = url_formatter
    end

    def page
      @page ||= parse_html
    end

    private

    def parse_html
      Nokogiri::HTML(fetch_html)
    end

    def fetch_html
      open(@url_formatter.url)
    end
  end
end
