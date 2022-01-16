module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author:, repo:, title: 'TestGuru')
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow'
  end

  def flash_message(flash_key)
    content_tag :p, flash[flash_key], class: "flash #{flash_key}" if flash[flash_key]
  end
end
