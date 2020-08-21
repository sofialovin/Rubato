import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "songs", "lessons", "lessonsContent", "songsContent", "allLessonsRightSide", "SongRightSide", "songsList", "songListRightSide"]

  connect() {
    //console.log(this.element);
    //console.log(this.songsTarget);
    if (this.hasLessonsTarget) {
      this.lessonsTarget.classList.add("selected-item");
      this.songsTarget.classList.remove("selected-item");
      this.songsContentTarget.style.display = "none";
      this.lessonsContentTarget.style.display = "";
      this.SongRightSideTarget.style.display = "none";
      this.allLessonsRightSideTarget.style.display = "";
    }
    // if (this.hasSongsListTarget) {
    //   this.songsListTarget.firstElementChild.classList.add("active");
    //   this.songListRightSideTarget.firstElementChild.classList.add("active");
    // }
  }

  selectSongs() {
      // console.log("Songs was clicked");
      this.songsTarget.classList.add("selected-item");
      this.lessonsTarget.classList.remove("selected-item");
      console.log(this.songsListTarget);
      this.songsListTarget.children.forEach((song) => {
        console.log(song.innerHtml);
      });
      const counter = 0;
      // this.songsListTarget.children[0].forEach(child => {
      //     console.log("something");
      // })

      // this.songsListTarget.firstElementChild.classList.add("active");
      // this.songListRightSideTarget.firstElementChild.classList.add("active");
      this.lessonsContentTarget.style.display = "none";
      this.songsContentTarget.style.display = "";
      this.allLessonsRightSideTarget.style.display = "none";
      this.SongRightSideTarget.style.display = "";
  }

  selectLessons() {
    if (this.hasLessonsTarget) {
    // console.log("Lessons was clicked");
    this.lessonsTarget.classList.add("selected-item");
    this.songsTarget.classList.remove("selected-item");
    this.songsContentTarget.style.display = "none";
    this.lessonsContentTarget.style.display = "";
    this.SongRightSideTarget.style.display = "none";
    this.allLessonsRightSideTarget.style.display = "";
    }
  }

}
