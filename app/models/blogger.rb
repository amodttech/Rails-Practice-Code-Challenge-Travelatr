class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, inclusion: {in: 1..100 }
    validates :bio, length:{ minimum:30}




    def most_likes
        self.posts.max_by {|post| post.likes}
    end

    def self.active?
        self.posts.count >= 1
    end



    #def featured_post
    #    self.posts.order(likes: :desc)[0]
    #end

    #def total_likes
    #    self.posts.inject(self.posts[0].likes) do |sum, post|
    #        sum + post.likes
     #   end
    #end
end


