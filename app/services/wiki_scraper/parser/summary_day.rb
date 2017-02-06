module WikiScraper
  module Parser
    class SummaryDay
      def initialize(day)
        @day = day
      end

      def date
        @day.css('span.bday').text.to_date
      end

      def links
        @day.css('td.description > ul > li > a:first').collect do |link|
          link.attr('href')
        end
      end
    end
  end
end
