class Member
  attr_accessor :name, :photo_url, :thumb_photo_url, :bio

  def initialize(attrs={})
    attrs.each do |key, val|
      self.send("#{key}=",val)
    end
  end

end
