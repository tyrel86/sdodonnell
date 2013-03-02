atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @posts.each do |item|
    next if item.updated_at.blank?

    feed.entry( item ) do |entry|
      entry.url blog_url entry
      entry.title item.title
      entry.content ( item.content.html_safe )

      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

      entry.author "S.D. O'Donnell"
    end
  end
end
