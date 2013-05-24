class MemberViewController < UIViewController
  extend IB

  outlet :name, UILabel
  outlet :image, UIImageView
  outlet :bio, UILabel

  attr_accessor :member

  def viewDidLoad
    super
    
    navigationItem.title = member.name

    name.text = member.name
    bio.text = member.bio

    if member.photo_url
      image.setImageWithURL(member.photo_url.nsurl, placeholderImage: "50x50".uiimage)
    else
      image.image = "50x50".uiimage
    end
  end


end
