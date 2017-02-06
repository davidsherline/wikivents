module WikiScraper
  module Parser
    class Summary
      def initialize(document)
        @document = document
      end

      def days
        @document.css('table.vevent').collect do |day|
          WikiScraper::Parser::SummaryDay.new(day)
        end
      end
    end
  end
end
