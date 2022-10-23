class ApplicationController < ActionController::Base
	before_action  :is_css_available, :is_js_available

	private
	def is_css_available
		file = File.join(Rails.root, "app", "assets", "stylesheets", "#{params['controller']}_#{params['action']}.scss")
		@is_css_available = File.exists?(file)
	end

	def is_js_available
		file = File.join(Rails.root, "app", "assets", "javascripts", "#{params['controller']}_#{params['action']}.js")
		@is_js_available = File.exists?(file)
	end
end
