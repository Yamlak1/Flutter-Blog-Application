import 'package:flutter/material.dart';
import 'package:blog_app/blog_post.dart' as BlogPostLib;

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  String _title = '';
  String _content = '';
  String _image = '';
  DateTime _date = DateTime.now(); // Added for the date
  String _story = ''; // Added for the story

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(233, 94, 125, 1),
        shadowColor: Colors.grey.shade600,
        title: Text(
          'Add blog',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              print('Search button pressed');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Blog Title'),
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Blog Content'),
                onChanged: (value) {
                  setState(() {
                    _content = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Blog Image URL'),
                onChanged: (value) {
                  setState(() {
                    _image = value;
                  });
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Blog Date (YYYY-MM-DD)'),
                onChanged: (value) {
                  try {
                    // Parse the value to DateTime and update _date
                    setState(() {
                      _date = DateTime.parse(value);
                    });
                  } catch (e) {
                    // Handle invalid date format
                    print('Invalid date format');
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Blog Story'),
                maxLines: 5, // Allowing multiple lines for the story
                onChanged: (value) {
                  setState(() {
                    _story = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Create a BlogPost object with user-entered information
                  BlogPostLib.BlogPost newBlogPost = BlogPostLib.BlogPost(
                    title: _title,
                    content: _content,
                    image: _image,
                    date: _date,
                    story: _story,
                  );

                  // Display the BlogPost information in a Card
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(newBlogPost.title),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(newBlogPost.content),
                            Image.network(newBlogPost.image),
                            Text('Date: ${newBlogPost.date}'),
                            Text('Story: ${newBlogPost.story}'),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Save Blog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
