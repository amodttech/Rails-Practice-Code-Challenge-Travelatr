class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent
        self.posts.last(5)
    end 

    def average
        age = self.bloggers.map {|blogger| blogger.age}
        age.inject {|sum, el| sum + el}/age.count
    end 

    def most_likes
        self.posts.max_by {|post| post.likes}
    end
end
