module AdminHelper
	def helper_bg_status object
		if object.status=="deleted" 
			'btn-danger'
		elsif object.status=="inactive"
			'btn-warning'
		elsif object.status=="active"
			'btn-success'
		else
			''
		end
	end
end
