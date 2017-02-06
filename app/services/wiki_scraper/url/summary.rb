module WikiScraper
  module URL
    class Summary
      BASE_URL = 'https://en.wikipedia.org/wiki/Portal:Current_events/'.freeze

      def initialize(date)
        @date = date.to_date
      end

      def url
        "#{BASE_URL}#{month}_#{year}"
      end

      private

      def month
        @date.strftime('%B')
      end

      def year
        @date.year
      end
    end
  end
end
