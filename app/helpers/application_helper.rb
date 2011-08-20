module ApplicationHelper
  def link_to_remote(name, url, options = {})
    html = options.delete(:html) || {}

    update = options.delete(:update)
    if update.is_a?(Hash)
      html["data-update-success"] = update[:success]
      html["data-update-failure"] = update[:failure]
    else
      html["data-update-success"] = update
    end

    html["data-update-position"] = options.delete(:position)
    html["data-method"]          = options.delete(:method)
    html["data-remote"]          = "true"

    html.merge!(options)

    url = url_for(url) if url.is_a?(Hash)
    link_to(name, url, html)
  end
end
