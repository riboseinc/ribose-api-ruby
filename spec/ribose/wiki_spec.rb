require "spec_helper"

RSpec.describe Ribose::Wiki do
  describe ".all" do
    it "retrieves the list of wiki pages" do
      space_id = 123_456

      stub_ribose_wiki_list_api(space_id)
      wikis = Ribose::Wiki.all(space_id)

      expect(wikis.count).to eq(2)
      expect(wikis.first.name).to eq("Wiki Page One")
      expect(wikis.last.name).to eq("Wiki Page Two")
    end
  end

  describe ".fetch" do
    it "retrieves the details for a wiki page" do
      wiki_id = 456_789
      space_id = 123_456

      stub_ribose_wiki_fetch_api(space_id, wiki_id)
      wiki = Ribose::Wiki.fetch(space_id, wiki_id)

      expect(wiki.name).to eq("Wiki Page One")
      expect(wiki.history.current_ver).to eq(1)
      expect(wiki.updater.name).to eq("John Doe")
    end
  end
end
