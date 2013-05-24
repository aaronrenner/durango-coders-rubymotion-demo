class MeetupAPI

  def self.members_for_group(groupId, &block)
    BW::HTTP.get("https://api.meetup.com/2/members", payload: {signed: true, key: api_key, group_id: groupId}) do | response |
      output = []
      error = nil
      
      if response.ok?
        json = BW::JSON.parse(response.body.to_str)
        json["results"].each do | result |
          output << Member.new(name: result.fetch("name"),
                              bio: result.fetch("bio"){"(None given)"},
                              thumb_photo_url: result.fetch("photo"){{}}.fetch("thumb_link"){nil},
                              photo_url: result.fetch("photo"){{}}.fetch("photo_link"){nil}
                              )
                              
        end
      else
        error = response.error_message
      end

      block.call(output,error)

    end

  end

  def self.api_key
    "MeetupAPIKey".info_plist
  end

end
