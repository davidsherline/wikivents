module WikiScraper
  module URL
    class Article
      attr_reader :url

      def initialize(url)
        @url = url
      end
    end
  end
end
