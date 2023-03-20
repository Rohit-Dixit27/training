class MyApp
  def call(env)
    [200,{ 'content-type' => 'text/html' },[ '<h1>hello</h1' ]]
  end
end 

run MyApp.new