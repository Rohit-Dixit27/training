require "base64"

class ImageConvert
  def initialize(params)
    @path = params.tempfile.path
    @content_type = params.content_type
  end

   def convert
     File.open(@path, "rb") do |img|
       base64_image = Base64.strict_encode64(img.read)
       "data:#{ @content_type };base64,#{ base64_image }"
      end
   end
end