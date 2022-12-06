class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(search) #self.でクラスメソッドとしている
    if search
      Post.joins(:customer).where(['posted_text LIKE ? OR blog LIKE ? OR customers.name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Post.all #全て表示。
    end
  end

  def get_header_image(resize: "560", gravity: "center", crop: "560x120+0+0")
    unless header_image.attached?
      file_path = Rails.root.join('app/assets/images/header.jpeg')
      header_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    header_image.variant(resize: "560", gravity: "center", crop: "560x120+0+0").processed
  end

  def get_avatar_image(resize: "120x120^", gravity: "center", crop: "120x120+0+0")
    unless avater_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      avater_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    avater_image.variant(resize: "120x120^", gravity: "center", crop: "120x120+0+0").processed
  end

end
