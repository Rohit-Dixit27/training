class PostCreate
  def initialize(params)
    @name = params[:name]
  end

  def book_create
    Post.create!(name: @name)
  end
end