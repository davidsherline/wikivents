FactoryGirl.define do
  factory :page_importer, class: WikiScraper::PageImporter do
    skip_create

    transient do
      url_importer factory: :article_url
    end

    initialize_with { new(url_importer) }
  end
end
