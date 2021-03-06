class Book {
  String isbn;
  String title;
  String author;
  String publisher;
  double rating;
  String description;
  String bookThumbnail;
  String bookCover;
  List<Reviewer> reviewer;

  Book(
      {required this.isbn,
      required this.title,
      required this.author,
      required this.publisher,
      required this.rating,
      required this.description,
      required this.bookThumbnail,
      required this.bookCover,
      required this.reviewer});
}

class Reviewer {
  String photoProfile;
  String subject;
  double rating;
  String name;
  String description;

  Reviewer(
      {required this.photoProfile,
      required this.subject,
      required this.rating,
      required this.name,
      required this.description});
}

var booksList = [
  Book(
    isbn: '9780679455134',
    title: 'ULYSSES',
    publisher: "Shakespeare and Company",
    author: 'James Joyce',
    rating: 4.87,
    description:
        'Written as an homage to Homer’s epic poem The Odyssey, Ulysses follows its hero, Leopold Bloom, through the streets of Dublin. Overflowing with puns, references to classical literature, and stream-of-consciousness writing, this is a complex, multilayered novel about one day in the life of an ordinary man. Initially banned in the United States but overturned by a legal challenge by Random House’s Bennett Cerf, Ulysses was called “a memorable catastrophe” (Virginia Woolf), “a book to which we are all indebted” (T. S. Eliot), and “the most faithful X-ray ever taken of the ordinary human consciousness” (Edmund Wilson). Joyce himself said, “There is not one single serious line in [Ulysses].',
    bookThumbnail:
        'https://s3-us-west-2.amazonaws.com/tabs.web.media/5/7/5767/5767-square-1536.jpg',
    bookCover:
        'https://upload.wikimedia.org/wikipedia/commons/a/ab/JoyceUlysses2.jpg',
    reviewer: [
      Reviewer(
          photoProfile: "/images/reviewer1.jpg",
          subject: "Bukunya Bikin nangis",
          rating: 4.5,
          name: "Markona",
          description:
              "Bukunya sangat rekomended buat yang lagi galau, kalau mau baca silakan baca di tempat yang gelap dan banyak nyamuk."),
      Reviewer(
          photoProfile: "images/reviewer2.jpg",
          subject: "Cukup menarik",
          rating: 4.4,
          name: "Ujang",
          description:
              "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
      Reviewer(
          photoProfile: "images/reviewer3.jpg",
          subject: "Dekat dengan hati",
          rating: 4,
          name: "Inem",
          description:
              "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
      Reviewer(
          photoProfile: "images/reviewer4.jpg",
          subject: "Lorem Ipsum",
          rating: 3.5,
          name: "Khoceng Oren",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
      Reviewer(
          photoProfile: 'images/reviewer5.jpg',
          subject: "Lorem Ipsum",
          rating: 3.5,
          name: "Pak Budi",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ],
  ),
  Book(
      isbn: '9780593201060',
      title: 'THE GREAT GATSBY',
      publisher: "Charles Scribner's Sons",
      author: 'F. Scott Fitzgerald',
      rating: 4.75,
      description:
          'Set in the Jazz Age, The Great Gatsby tells the story of the mysterious millionaire Jay Gatsby, his decadent parties, and his love for the alluring Daisy Buchanan. Dismissed as “no more than a glorified anecdote, and not too probable at that” (The Chicago Tribune), The Great Gatsby is now considered a contender for “the Great American Novel.” Fitzgerald wanted to title the novel “Trimalchio in West Egg,” but both his wife and his editor preferred “The Great Gatsby.” Fitzgerald gave in, though he still thought that “the title is only fair, rather bad than good.”',
      bookThumbnail:
          'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781471173936/the-great-gatsby-9781471173936_hr.jpg',
      bookCover:
          'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781471173936/the-great-gatsby-9781471173936_hr.jpg',
      reviewer: [
        Reviewer(
            photoProfile: "images/reviewer1.jpg",
            subject: "Bukunya Bikin nangis",
            rating: 4.5,
            name: "Markona",
            description:
                "Bukunya sangat rekomended buat yang lagi galau, kalau mau baca silakan baca di tempat yang gelap dan banyak nyamuk."),
        Reviewer(
            photoProfile: "images/reviewer2.jpg",
            subject: "Cukup menarik",
            rating: 4.4,
            name: "Ujang",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer3.jpg",
            subject: "Dekat dengan hati",
            rating: 4,
            name: "Inem",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer4.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Khoceng Oren",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Reviewer(
            photoProfile: "images/reviewer5.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Pak Budi",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      ]),
  Book(
      isbn: '9780143108245',
      title: 'A PORTRAIT OF THE ARTIST AS A YOUNG MAN',
      publisher: 'B. W. Huebsch',
      author: 'James Joyce',
      rating: 4.49,
      description:
          'Published in 1916, James Joyce’s semiautobiographical tale of his alter ego, Stephen Dedalus, is a coming-of-age story like no other. A bold, innovative experiment with both language and structure, the work has exerted a lasting influence on the contemporary novel; Alfred Kazin commented that “Joyce dissolved mechanism in literature as effectively as Einstein destroyed it in physics.” Reviewing the book in The New Republic, H. G. Wells wrote, “Like some of the best novels in the world it is the story of an education; it is by far the most living and convincing picture that exists of an Irish Catholic upbringing.”',
      bookThumbnail: 'http://ecx.images-amazon.com/images/I/51DY8lRXVjL.jpg',
      bookCover: 'http://ecx.images-amazon.com/images/I/51DY8lRXVjL.jpg',
      reviewer: [
        Reviewer(
            photoProfile: "images/reviewer1.jpg",
            subject: "Bukunya Bikin nangis",
            rating: 4.5,
            name: "Markona",
            description:
                "Bukunya sangat rekomended buat yang lagi galau, kalau mau baca silakan baca di tempat yang gelap dan banyak nyamuk."),
        Reviewer(
            photoProfile: "images/reviewer2.jpg",
            subject: "Cukup menarik",
            rating: 4.4,
            name: "Ujang",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer3.jpg",
            subject: "Dekat dengan hati",
            rating: 4,
            name: "Inem",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer4.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Khoceng Oren",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Reviewer(
            photoProfile: "images/reviewer5.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Pak Budi",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      ]),
  Book(
      isbn: '9780679410430',
      title: 'LOLITA',
      author: 'Vladimir Nabokov',
      publisher: 'Olympia Press',
      rating: 4.52,
      description:
          'Lolita tells the story of middle-aged Humbert Humbert’s love for twelve-year-old Dolores Haze. The concept is troubling, but the novel defies any kind of label, though it has been heralded as a hilarious satire, a bitter tragedy, and even an allegory for U.S.-European relations. In Reading Lolita in Tehran, Azar Nafisi summarized the book as “hopeful, beautiful even, a defense not just of beauty but of life . . . Nabokov, through his portrayal of Humbert, has exposed all solipsists who take over other people’s lives.”',
      bookThumbnail:
          'https://upload.wikimedia.org/wikipedia/commons/5/57/Lolita_1955.JPG',
      bookCover:
          'https://upload.wikimedia.org/wikipedia/commons/5/57/Lolita_1955.JPG',
      reviewer: [
        Reviewer(
            photoProfile: "images/reviewer1.jpg",
            subject: "Bukunya Bikin nangis",
            rating: 4.5,
            name: "Markona",
            description:
                "Bukunya sangat rekomended buat yang lagi galau, kalau mau baca silakan baca di tempat yang gelap dan banyak nyamuk."),
        Reviewer(
            photoProfile: "images/reviewer2.jpg",
            subject: "Cukup menarik",
            rating: 4.4,
            name: "Ujang",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer3.jpg",
            subject: "Dekat dengan hati",
            rating: 4,
            name: "Inem",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer4.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Khoceng Oren",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Reviewer(
            photoProfile: "images/reviewer5.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Pak Budi",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      ]),
  Book(
      isbn: '9788466350945',
      title: 'BRAVE NEW WORLD',
      publisher: 'Chatto & Windus',
      author: 'Aldous Huxley',
      rating: 4.28,
      description:
          'Though Brave New World is less famous than George Orwell’s 1984, it arguably presents a world that more closely resembles our own: a world of easy sex, readily available and mood-altering pharmaceuticals, information overload, and mass production.  Juxtaposing Orwell’s and Huxley’s dystopias, the critic Neil Postman commented: “What Orwell feared were those who would ban books. What Huxley feared was that there would be no reason to ban a book, for there would be no one who wanted to read one. . . . Orwell feared that the truth would be concealed from us. Huxley feared the truth would be drowned in a sea of irrelevance.',
      bookThumbnail:
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/bfffaf13630039.562761884989f.jpg',
      bookCover:
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/bfffaf13630039.562761884989f.jpg',
      reviewer: [
        Reviewer(
            photoProfile: "images/reviewer1.jpg",
            subject: "Bukunya Bikin nangis",
            rating: 4.5,
            name: "Markona",
            description:
                "Bukunya sangat rekomended buat yang lagi galau, kalau mau baca silakan baca di tempat yang gelap dan banyak nyamuk."),
        Reviewer(
            photoProfile: "images/reviewer2.jpg",
            subject: "Cukup menarik",
            rating: 4.4,
            name: "Ujang",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer3.jpg",
            subject: "Dekat dengan hati",
            rating: 4,
            name: "Inem",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer4.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Khoceng Oren",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Reviewer(
            photoProfile: "images/reviewer5.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Pak Budi",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      ]),
  Book(
      isbn: '9780679600176',
      title: 'THE SOUND AND THE FURY',
      publisher: 'Jonathan Cape and Harrison Smith',
      author: 'William Faulkner',
      rating: 4.37,
      description:
          'Narrated by the Compson siblings—Benjy, a source of shame for his family due to his diminished mental capacity; brilliant and obsessive Quentin; and Jason, the cynic—as well as Dilsey, the powerful matriarch of their black servants, The Sound and the Fury is a tragedy of haunted lives. As each of these characters reflect on the fourth sibling, beautiful and free-spirited Caddy, Faulkner paints an indelible portrait of a family in disarray. While The Sound and the Fury was dismissed by its author as a “splendid failure,” it is now considered a masterpiece and played a crucial role in Faulkner being awarded the 1949 Nobel Prize in Literature.',
      bookThumbnail:
          'https://images.squarespace-cdn.com/content/507dba43c4aabcfd2216a447/1411579895420-PTVEL4CROZAICWNFFOB7/First+edition+cover+of+The+Sound+and+the+Fury?content-type=image%2Fjpeg',
      bookCover:
          'https://media4.popsugar-assets.com/files/2014/09/22/068/n/1922283/599df3ff477307c7_sound_and_the_fury/i/Sound-Fury-William-Faulkner.jpg',
      reviewer: [
        Reviewer(
            photoProfile: "images/reviewer1.jpg",
            subject: "Bukunya Bikin nangis",
            rating: 4.5,
            name: "Markona",
            description:
                "Bukunya sangat rekomended buat yang lagi galau, kalau mau baca silakan baca di tempat yang gelap dan banyak nyamuk."),
        Reviewer(
            photoProfile: "images/reviewer2.jpg",
            subject: "Cukup menarik",
            rating: 4.4,
            name: "Ujang",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer3.jpg",
            subject: "Dekat dengan hati",
            rating: 4,
            name: "Inem",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer4.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Khoceng Oren",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Reviewer(
            photoProfile: "images/reviewer5.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Pak Budi",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      ]),
  Book(
      isbn: '9780735280311',
      title: 'CATCH-22',
      publisher: 'Simon & Schuster',
      author: 'Joseph Heller',
      rating: 4.18,
      description:
          'Narrated by the Compson siblings—Benjy, a source of shame for his family due to his diminished mental capacity; brilliant and obsessive Quentin; and Jason, the cynic—as well as Dilsey, the powerful matriarch of their black servants, The Sound and the Fury is a tragedy of haunted lives. As each of these characters reflect on the fourth sibling, beautiful and free-spirited Caddy, Faulkner paints an indelible portrait of a family in disarray. While The Sound and the Fury was dismissed by its author as a “splendid failure,” it is now considered a masterpiece and played a crucial role in Faulkner being awarded the 1949 Nobel Prize in Literature.',
      bookThumbnail:
          'https://mir-s3-cdn-cf.behance.net/project_modules/disp/452ff49083859.560c8304b8a63.png',
      bookCover:
          'https://mir-s3-cdn-cf.behance.net/project_modules/disp/452ff49083859.560c8304b8a63.png',
      reviewer: [
        Reviewer(
            photoProfile: "images/reviewer1.jpg",
            subject: "Bukunya Bikin nangis",
            rating: 4.5,
            name: "Markona",
            description:
                "Bukunya sangat rekomended buat yang lagi galau, kalau mau baca silakan baca di tempat yang gelap dan banyak nyamuk."),
        Reviewer(
            photoProfile: "images/reviewer2.jpg",
            subject: "Cukup menarik",
            rating: 4.4,
            name: "Ujang",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer3.jpg",
            subject: "Dekat dengan hati",
            rating: 4,
            name: "Inem",
            description:
                "Buku menarik jika dipelajari lebih lanjut dan dibedah oleh para ahli bahasa"),
        Reviewer(
            photoProfile: "images/reviewer4.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Khoceng Oren",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Reviewer(
            photoProfile: "images/reviewer5.jpg",
            subject: "Lorem Ipsum",
            rating: 3.5,
            name: "Pak Budi",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      ]),
];

var favoriteBookList = [];
var queryList = [];
