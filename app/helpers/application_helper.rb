module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def active_link_to(text, path)
    classes = 'active' if current_page?(path)
    link_to text, path, class: classes
  end
end
