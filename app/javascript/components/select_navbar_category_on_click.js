const selectNavbarCategoryOnClick = () => {
  const categories = document.querySelectorAll(".navbar-category");

  const lessonsCategory = document.querySelector(".lessons-category");
  const studentsCategory = document.querySelector(".students-category");
  const songLibraryCategory = document.querySelector(".song-library-category");

  const lessonsDashboardIdentifier = document.querySelector(".lessons-dashboard-identifier");
  const studentsIndexIdentifier = document.querySelector(".students-index-identifier");
  const songLibraryIdentifier = document.querySelector(".song-library-identifier");


  // categories.forEach((category) => {
  //   // console.log(category);
  //   category.addEventListener('click', () => {
  //     category.classList.add("selected-category");
  //   });
  // });

  if (lessonsDashboardIdentifier) {
    lessonsCategory.classList.add("selected-category");
  } else if (studentsIndexIdentifier) {
   studentsCategory.classList.add("selected-category");
  } else if (songLibraryIdentifier) {
   songLibraryCategory.classList.add("selected-category");
  };

};

export { selectNavbarCategoryOnClick };
