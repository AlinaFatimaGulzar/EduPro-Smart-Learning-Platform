import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopularCoursesScreen extends StatefulWidget {
  const PopularCoursesScreen({Key? key}) : super(key: key);

  @override
  State<PopularCoursesScreen> createState() => _PopularCoursesScreenState();
}

class _PopularCoursesScreenState extends State<PopularCoursesScreen> {
  String selectedCategory = 'All';
  int _selectedIndex = 0;

  final List<String> categories = [
    'All',
    'Graphic Design',
    '3D Design',
    'Arts & I',
    'Programming',
    'Web Development',
  ];

  final List<Course> courses = [
    Course(
      title: 'Graphic Design Advanced',
      category: 'Graphic Design',
      price: '7058/-',
      rating: 4.2,
      students: 7830,
      isBookmarked: true,
      image: 'assets/course1.jpg',
    ),
    Course(
      title: 'Advertisement Design',
      category: 'Graphic Design',
      price: '800/-',
      rating: 3.9,
      students: 12680,
      isBookmarked: false,
      image: 'assets/course2.jpg',
    ),
    Course(
      title: 'Graphic Design Advanced',
      category: 'Programming',
      price: '599/-',
      rating: 4.2,
      students: 990,
      isBookmarked: true,
      image: 'assets/course3.jpg',
    ),
    Course(
      title: 'Web Developer conce..',
      category: 'Web Development',
      price: '499/-',
      rating: 4.9,
      students: 14580,
      isBookmarked: true,
      image: 'assets/course4.jpg',
    ),
    Course(
      title: 'Digital Marketing Course',
      category: 'SEO & Marketing',
      price: '1299/-',
      rating: 4.5,
      students: 8900,
      isBookmarked: false,
      image: 'assets/course5.jpg',
    ),
  ];

  List<Course> get filteredCourses {
    if (selectedCategory == 'All') {
      return courses;
    }
    return courses
        .where((course) => course.category == selectedCategory)
        .toList();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different screens based on index
    switch (index) {
      case 0:
      // Already on home
        break;
      case 1:
      // Navigate to My Courses
        break;
      case 2:
      // Navigate to Inbox
        break;
      case 3:
      // Navigate to Transaction
        break;
      case 4:
      // Navigate to Profile
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Popular Courses',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        children: [
          // Category Filter Chips
          Container(
            height: 60,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    backgroundColor: Colors.grey[200],
                    selectedColor: const Color(0xFF00897B),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ),

          // Courses List
          Expanded(
            child: filteredCourses.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No courses found',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                return CourseCard(
                  course: filteredCourses[index],
                  onTap: () {
                    // Navigate to course details
                  },
                  onBookmarkTap: () {
                    setState(() {
                      filteredCourses[index].isBookmarked =
                      !filteredCourses[index].isBookmarked;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF00897B),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            activeIcon: Icon(Icons.play_circle),
            label: 'MY COURSES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_outlined),
            activeIcon: Icon(Icons.inbox),
            label: 'INBOX',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'TRANSACTION',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}

class Course {
  final String title;
  final String category;
  final String price;
  final double rating;
  final int students;
  bool isBookmarked;
  final String image;

  Course({
    required this.title,
    required this.category,
    required this.price,
    required this.rating,
    required this.students,
    required this.isBookmarked,
    required this.image,
  });
}

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;
  final VoidCallback onBookmarkTap;

  const CourseCard({
    Key? key,
    required this.course,
    required this.onTap,
    required this.onBookmarkTap,
  }) : super(key: key);

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Graphic Design':
        return const Color(0xFFFF9800);
      case 'Programming':
        return const Color(0xFFFF6B6B);
      case 'Web Development':
        return const Color(0xFFFF9800);
      case 'SEO & Marketing':
        return const Color(0xFFFF9800);
      default:
        return const Color(0xFF00897B);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Course Image
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Container(
                  color: Colors.grey[900],
                  child: const Icon(
                    Icons.play_circle_outline,
                    color: Colors.white54,
                    size: 40,
                  ),
                ),
              ),
            ),

            // Course Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category Tag
                    Text(
                      course.category,
                      style: TextStyle(
                        color: _getCategoryColor(course.category),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Course Title
                    Text(
                      course.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3142),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // Price
                    Text(
                      course.price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Rating and Students
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFFFA726),
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          course.rating.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '|',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[400],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${course.students} Std',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Bookmark Button
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                icon: Icon(
                  course.isBookmarked
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: course.isBookmarked
                      ? const Color(0xFF00897B)
                      : Colors.grey[400],
                ),
                onPressed: onBookmarkTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}