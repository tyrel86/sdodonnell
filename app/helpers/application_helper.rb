module ApplicationHelper

	def active?(link)
		link_rout_mappings = { '/' => 'home', '/home' => 'home',
													 '/biography' => 'bio', '/press-kit' => 'press',
													 '/deadly-memories' => 'dmbook', '/deadly-bayou' => 'dbbook',
													 '/news-events' => 'news', '/resources' => 'resources',
													 '/contact' => 'contact' }
		link_rout_mappings[request.path] == link or request.path[1..5] == link
	end

end
