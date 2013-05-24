class AppDelegate < ProMotion::Delegate

  def on_load(app, options)
    membersScreen = MembersScreen.new(nav_bar: true)
    membersScreen.group_id = meetup_group_id

    PM.logger.debug "Loading MeetupGroupId #{meetup_group_id}"
    open(membersScreen)
  end

  def meetup_group_id
    @meetup_group_id ||= "MeetupGroupId".info_plist.to_i
  end
end
