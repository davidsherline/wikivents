module WikiScraper
  module Parser
    class Article
      def initialize(document)
        @document = document
      end

      def title
        @document.css('h1#firstHeading').text
      end

      def summary
        # This pattern sucks. But breaking in a #map exits with nil.
        # So I'm leaving it.
        result = []

        @document.css('div#mw-content-text').children.each do |node|
          break if node.attr('class').try(:match, /toc/)
          next if node.name != 'p'
          next if node.text.empty?
          node.search('sup').each(&:remove)
          result << node.text
        end

        result.join("\n")
      end

      def image_url
        @document.css('table.infobox img')[0].try(:attr, 'src')
      end

      def to_hash
        {
          title: title,
          summary: summary,
          image_url: image_url
        }
      end
    end
  end
end
