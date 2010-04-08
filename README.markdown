VANITY PUBLISHING, 140 CHARACTERS AT A TIME
===================================

Everything you need to make a real goddamned, physical book of your twitter feed.

Well, nearly everything. These scripts will help you generate some XML:FO that you can run through your favourite XSL:FO processor (I used apache's FOP) to render a whole goddamned book.

So...

	$ ./get_tweets username password > all_my_tweets.tsv
	$ ./generate_xml < all_my_tweets.tsv > all_my_tweets.xml
	$ xsltproc tweetbook.xsl tweetbook.fo
	$ fop tweetbook.fo tweetbook.pdf
	
Right now, I'm getting one printed using Lulu.com, I'll let you know how it goes.