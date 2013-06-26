get '/' do

  @cat_log = Category.all
  erb :index
end

get '/categories/:id' do |id|
  @category = Category.find(id)
  erb :posts
end

post '/create_post/:id' do 
  p "we go to one"
  category = Category.find(params[:id])
  new_post = category.posts.create(params[:posting])

  redirect "/postform/#{new_post.id}?test=completed"
end

get '/postform/:id' do
  p "we got to two"
  @id = params[:id]
  if params[:test]
    @complete = params[:id]
  end
  erb :post_form
end

get '/single_post/:id' do
  @post = Post.find(params[:id])
  erb :single_post
end


get '/edit_post/:id' do
  p "we go to edit post"
  @post = Post.find(params[:id])
  erb :update_post
end

get '/update_post/:id' do
  @complete = params[:id]
  @post = Post.find(params[:id])
  @post.update_attributes(params[:posting])
  p "somehow got here"
  erb :update_post
end

post '/update_post/:id' do
  @complete = params[:id]
  p params[:posting]
  @post = Post.find(params[:id])
  @post.update_attributes(params[:posting])
  p "somehow got here"
  erb :update_post
  end






