class PostPolicy
	attr_reader :user, :post

    def initialize(user, post)
      @user = user
      @post = post
    end

    def index?
    	@user.role == 'admin'
    end
end
