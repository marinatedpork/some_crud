def list_posts(posts)
	post_string = "<div class='post'>"
	posts.each do |post|
		post_string << "<div><h1>#{post.title}</h1>"
		post_string << make_delete_button(post)
		post_string << make_edit_button(post)
		post_string << "<p class='post_body'>#{post.body}</p>"
		post_string << list_comments(post)
		post_string << "</div>"
	end
	return post_string << "</div>"
end

def list_a_post(post)
	post_string = "<div class='post'>"
	post_string << "<div><h1>#{post.title}</h1>"
	post_string << make_delete_button(post)
	post_string << make_edit_button(post)
	post_string << "<p class='post_body'>#{post.body}</p>"
	post_string << list_comments(post)
	post_string << "</div>"
	return post_string << "</div>"
end

def list_comments(post)
	comment_string = "<div class='comment'>"	
	post.comments.each do |comment|
		comment_string << "<p>#{comment.text}</p>"
	end
	return comment_string << "</div>"
end

def render_edit(post)
	edit_string = "<div><form id='/posts/#{post.id}/edit' class='submitEdit'>Title:<input type='text' name='title' value='#{post.title}'><br>"
  edit_string << "<input type='text' name='body' value='#{post.body}'><br>"
  return edit_string << "<input type='submit' value='Submit'></form></div>"
end

def make_delete_button(post)
  "<form id='/posts/#{post.id}/delete' method='GET' class='deletePost'>
    <input type='submit' value='DELETE' name=""/>
  </form>"
end

def make_edit_button(post)
	"<form id='/posts/#{post.id}/edit' method='GET' class='editPost'>
		<input type='submit' value='EDIT' name=""/>
	</form>"
end