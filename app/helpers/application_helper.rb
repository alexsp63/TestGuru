module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author:, repo:, title: 'TestGuru')
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow'
  end
end
