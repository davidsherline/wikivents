module WikiScraper
  module URL
    class Article
      BASE_URL = 'https://en.wikipedia.org'.freeze

      def initialize(path)
        @path = path
      end

      def url
        BASE_URL + @path
      end
    end
  end
end
