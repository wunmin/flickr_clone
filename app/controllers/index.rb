enable :sessions

# helper do
# 	def current_user
# 		@user = User.find(session[:id]) if session[:id]
# 	end
# end

# before do
# 	if current_user.nil?
# 		redirect to "/login"
# 	else
# 		session[:url] = request.path
# 	end
# end

get '/' do
	@albums = Album.all
	erb :index
end

get "/albums/:album_id" do
	@album = Album.find(params[:album_id])
	erb :album_show
end

get "/photos/new" do
	if !session[:id].nil?
		# If there is a session, can upload picture
		erb :photo_new
	else
		redirect to "/login"
	end
end

post "/photos" do
	@album = Album.find_or_create_by(name: params[:album_name])

	@photo = Photo.create(
		title: params[:title],
		photo_desc: params[:photo_desc],
		file: params[:file],
		album_id: @album.id)

	redirect to "/albums/#{@album.id}/photos/#{@photo.id}"
end

get "/albums/:album_id/photos/:photo_id" do
	@photo = Photo.find(params[:photo_id])
	erb :photo_show
end

get "/login" do
	@user = User.new
	erb :login
end

post "/login" do
	# @user will be nill or an User object
	@user = User.authenticate(params[:user][:username], params[:user][:password])
	if @user == nil
		redirect to "/login"
	else
		# If the user is successfully authenticated, set a new session
		session[:id] = @user.id
		redirect to("/")
	end
end

post "/new_user" do
	@new_user = User.create(params[:new_user])
	if @new_user == nil
		erb :login
	else
		session[:id] = @new_user.id
		redirect to("/")
	end
end

get "/logout" do
	session.clear
	redirect to "/"
end
