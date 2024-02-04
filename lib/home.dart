import 'package:flutter/material.dart';
import 'notifications.dart';
import 'settings.dart';
import 'add_blog.dart' as AddBlogLib;
import 'account.dart';
import 'blog_post.dart'; // Adjust the path based on your project structure
import 'package:overlay_support/overlay_support.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<BlogPost> blogPosts = [
      BlogPost(
        title: 'Blog Post About Flowers',
        content: 'This is the content of the flower post.',
        date: DateTime.now(),
        image: 'assets/pink flowers.jpg',
        story:
            'In a small, enchanting garden nestled behind an old cottage, vibrant hues of pink flowers danced in the gentle breeze. Each petal seemed to whisper a unique tale, sharing secrets of the gardens rich history. As the sun dipped below the horizon, casting a warm glow on the petals, a magical atmosphere enveloped the space, captivating anyone lucky enough to witness this floral spectacle',
      ),
      BlogPost(
        title: 'Blog Post About Coffee',
        content: 'This is the content of the coffee post.',
        date: DateTime.now(),
        image: 'assets/coffee.jpg',
        story:
            'In a cozy café tucked away on a bustling street, the aroma of freshly brewed coffee filled the air. The barista, a passionate coffee enthusiast, crafted each cup with precision and care. Patrons reveled in the rich flavors, finding solace in the comforting ambiance. Amidst the chatter, the clinking of cups, and the subtle hum of the espresso machine, the café became a haven for coffee lovers, a place where every sip told a story of warmth and community.',
      ),
      BlogPost(
        title: 'Blog Post About Nature',
        content: 'Exploring the beauty of nature and its wonders.',
        date: DateTime.now(),
        image: 'assets/nature.jpg',
        story:
            'Deep within the heart of an untouched forest, the symphony of nature played in perfect harmony. Majestic trees stood tall, their leaves whispering tales of centuries past. Sunlight filtered through the dense canopy, illuminating a lush landscape teeming with life. Creatures big and small coexisted, creating a delicate balance that painted a vivid picture of the wonders hidden within the embrace of nature.',
      ),
      BlogPost(
        title: 'Tech Trends in 2024',
        content: 'Discover the latest technology trends shaping the future.',
        date: DateTime.now(),
        image: 'assets/Tech.jpg',
        story:
            'In the ever-evolving realm of technology, 2024 brought forth a wave of innovations that reshaped the digital landscape. From cutting-edge gadgets to breakthroughs in artificial intelligence, the year was a testament to humanitys boundless creativity. As people embraced these advancements, a sense of awe and anticipation filled the air, marking the beginning of a new era defined by the marriage of human ingenuity and technological prowess.',
      ),
      BlogPost(
        title: 'Delicious Recipes Collection',
        content: 'A compilation of mouth-watering recipes to try at home.',
        date: DateTime.now(),
        image: 'assets/recipes.jpg',
        story:
            'Within the heart of a bustling kitchen, the tantalizing aroma of diverse spices and sizzling ingredients wafted through the air. A culinary maestro, armed with an apron and a passion for flavors, embarked on a journey to curate a collection of mouth-watering recipes. Each dish, a masterpiece in its own right, invited individuals to savor the joy of cooking and indulge in the art of creating unforgettable culinary experiences.',
      ),
      BlogPost(
        title: 'Fitness Tips for a Healthy Lifestyle',
        content: 'Stay fit and healthy with these practical fitness tips.',
        date: DateTime.now(),
        image: 'assets/fitness.jpg',
        story:
            'Within the heart of a bustling kitchen, the tantalizing aroma of diverse spices and sizzling ingredients wafted through the air. A culinary maestro, armed with an apron and a passion for flavors, embarked on a journey to curate a collection of mouth-watering recipes. Each dish, a masterpiece in its own right, invited individuals to savor the joy of cooking and indulge in the art of creating unforgettable culinary experiences.',
      ),
      BlogPost(
        title: 'Travel Adventures Across the Globe',
        content: 'Embark on a journey through various travel destinations.',
        date: DateTime.now(),
        image: 'assets/travel.jpg',
        story: '',
      ),
      BlogPost(
        title: 'Book Recommendations for Bookworms',
        content: 'Explore a curated list of must-read books for book lovers.',
        date: DateTime.now(),
        image: 'assets/books.jpg',
        story: '',
      ),
      BlogPost(
        title: 'DIY Home Decor Ideas',
        content: 'Get creative with these do-it-yourself home decor projects.',
        date: DateTime.now(),
        image: 'assets/home.jpg',
        story: '',
      ),
      BlogPost(
        title: 'Gardening Tips for Green Thumbs',
        content:
            'Grow a vibrant and beautiful garden with these gardening tips.',
        date: DateTime.now(),
        image: 'assets/gardening.jpg',
        story: '',
      ),
      BlogPost(
        title: 'Inspirational Quotes to Motivate Your Day',
        content: 'Find inspiration and motivation in these powerful quotes.',
        date: DateTime.now(),
        image: 'assets/quote.jpg',
        story: '',
      ),
      // Add more posts if needed
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(233, 94, 125, 1),
        shadowColor: Colors.grey.shade600,
        title: const Text(
          'My Blog',
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
      drawer: Drawer(
        child: myDrawer(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int cardsInRow = (constraints.maxWidth / 300).floor();
          return _buildCardRow(context, blogPosts, cardsInRow);
        },
      ),
    );
  }

  Widget _buildCardRow(
      BuildContext context, List<BlogPost> blogPosts, int cardsInRow) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Wrap(
          spacing: 18.0,
          children: blogPosts.map((post) {
            return SizedBox(
                // width: MediaQuery.of(context).size.width / cardsInRow,
                child: GestureDetector(
              onTap: () {
                // Assuming 'post' is the current BlogPost
                showOverlay(context, post);
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset(
                        post.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.content),
                      onTap: () {
                        print('Tapped on ${post.title}');
                      },
                    ),
                  ],
                ),
              ),
            ));
          }).toList(),
        ),
      ),
    );
  }
}

class myDrawer extends StatelessWidget {
  const myDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Yamlak F.'),
            accountEmail: Text('yamalk@gmail.com'),
            otherAccountsPictures: <Widget>[
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              )
            ],
            decoration: BoxDecoration(
              color: Color.fromRGBO(233, 94, 125, 1),
            ),
          ),
          MenuList(),
        ],
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(
            Icons.add,
          ),
          title: const Text("Add blog"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddBlogLib.AddBlog()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.account_circle,
          ),
          title: const Text("Account"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Account()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Notifications'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Notifications()));
          },
        ),
        const Divider(
          color: Colors.blueGrey,
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Settings()));
          },
        ),
      ],
    );
  }
}

void showOverlay(BuildContext context, BlogPost blogPost) {
  late OverlayEntry overlayEntry;

  // Create an OverlayEntry
  overlayEntry = OverlayEntry(
    builder: (context) => Align(
      alignment: Alignment.center,
      child: YourOverlayWidget(
        blogPost: blogPost,
        onClose: () {
          // Close the overlay when needed
          overlayEntry.remove();
        },
      ),
    ),
  );

  // Insert the overlay
  Overlay.of(context)!.insert(overlayEntry);
}

class YourOverlayWidget extends StatelessWidget {
  final BlogPost blogPost;
  final VoidCallback onClose;

  YourOverlayWidget({required this.blogPost, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Material(
          color: Color.fromRGBO(233, 94, 125, 1),
          child: Container(
            color: Colors.black.withOpacity(0.5), // Overlay color
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  blogPost.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  blogPost.content,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          blogPost.image,
                          fit: BoxFit.cover,
                          height: 200.0, // Set the desired height
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          blogPost.story,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(alignment: Alignment.center),
                  onPressed: onClose,
                  child: Text(
                    'Close Overlay',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
