# Adapted from http://www.agileprogrammer.com/dotnetguy/articles/BlogImporterInRuby.aspx
# Documentation on XMLRPC: http://www.xmlrpc.com/metaWeblogApi
# Documentation for content structure: http://cyber.law.harvard.edu/rss/rss.html
require 'xmlrpc/client'

class BlogClient
  def initialize(server, urlPath, blogid, username, password)
    @client = XMLRPC::Client.new(server, urlPath)
    @blogid = blogid
    @username = username
    @password = password
  end

  def newPost(content, publish)
    @client.call('metaWeblog.newPost', @blogid, @username, @password, content, publish)
  end

  def getPost(postid)
    @client.call('metaWeblog.getPost', postid, @username, @password)
  end

  def editPost(postid, content, publish)
    @client.call('metaWeblog.editPost', postid, @username, @password, content, publish)
  end
  
  def getCategories
    @client.call('metaWeblog.getCategories', @blogid, @username, @password)
  end
end
  
