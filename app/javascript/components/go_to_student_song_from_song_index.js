const GoToStudentSongFromSongIndex = () => {

  const songLibraryIdentifier = document.querySelectorAll(".song-library-identifier");
  const dropdownItems = document.querySelectorAll(".dropdown-student");

  if (songLibraryIdentifier) {
    Array.from(dropdownItems).forEach((item) => {
      item.addEventListener('click', () => {
        localStorage.setItem("SongAdded", true);
      });
    });
  }
}

export { GoToStudentSongFromSongIndex };
