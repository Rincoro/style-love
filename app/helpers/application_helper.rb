module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :success then "bg-green-300"
    when :notice then "bg-green-500"
    when :alert  then "bg-red-500"
    when :error  then "bg-yellow-500"
    else "bg-gray-500"
    end
  end

  def default_meta_tags
    {
      site: "Style-LOVE",
      title: "推し活のコーデ投稿サービス",
      reverse: true,
      charset: "utf-8",
      description: "ライブや、推し活のコーデを共有し、自分のコーデの参考にすることができます。",
      canonical: "https://style-love.net/",
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: "https://style-love.net/",
        image: image_url("Style-love (2).png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary_large_image",
        image: image_url("Style-love (2).png")
      }
    }
  end
end
