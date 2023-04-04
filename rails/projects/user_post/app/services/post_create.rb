class PostCreate
  def initialize(params)
    @name = params[:name]
  end

  def call
    book_create
  end

  def book_create
    Post.create!(name: @name)
  end
end