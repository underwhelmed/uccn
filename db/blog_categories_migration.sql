select
'post = Post.find_by_slug("' + bp.slug + '"); post.category_ids = [' + 
	STUFF((SELECT ',' + convert(varchar, bpc.blogcategoryid)
			FROM BlogPostCategory bpc 
		   where bpc.blogpostid = bp.id
		  FOR XML PATH('')), 1, 1, '') 
+ ']; post.save!'
 
FROM BlogPost bp
order by publishedon desc