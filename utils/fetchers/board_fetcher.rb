require 'trello'

class BoardFetcher
  def self.fetch(client, member_id)
    raise Trello::Error if client.nil? || member_id.nil? || member_id.empty?
    JSON.parse(client.get("/members/#{member_id}/boards", {filter: :open, fields: :name, organization: true}))
  end
end