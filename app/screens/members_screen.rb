class MembersScreen < ProMotion::TableScreen
  title "Members"

  attr_accessor :group_id

  def on_load
    MeetupAPI.members_for_group(group_id) do |results, error|
      if error.nil?
        @members = results
        reset_table_data_cache
        update_table_data
      else
        puts "Error occured: #{error.message}"
      end
    end
  end

  def table_data
    [{
      title: "",
      cells: member_cells
    }]
  end

  def view_member_details(args={})
    member = args.fetch(:member)

    detail_vc = MemberViewController.alloc.initWithNibName "MemberViewController", bundle: nil
    detail_vc.member = member

    open detail_vc
  end

  private 

  def member_cells
    @member_cells ||=begin
      members = @members || []
      cells = []
      
      members.each do |m|
        cells << {
          title: m.name,
          subtitle: m.bio,
          cell_identifier: 'member_cell',
          cell_style: UITableViewCellStyleSubtitle,
          accessory_type: UITableViewCellAccessoryDisclosureIndicator,
          remote_image: {
            url: m.thumb_photo_url,
            placeholder: '50x50'
          },
          action: :view_member_details,
          arguments: {member: m}
        }
      end

      cells
    end
  end


  def reset_table_data_cache
    @member_cells=nil
  end
end
