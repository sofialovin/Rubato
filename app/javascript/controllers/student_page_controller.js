import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "songs", "lessons", "lessonsContent", "songsContent"]

  connect() {
    console.log(this.element);
    console.log(this.songsTarget);
  }

  selectSongs() {
    console.log("Songs was clicked");
    this.songsTarget.classList.add("selected-item");
    this.lessonsContentTarget.style.visibility = "hidden";
  }

  selectLessons() {
    console.log("Lessons was clicked");
    this.lessonsTarget.classList.add("selected-item");
    this.songsContentTarget.style.display = "none";
    this.lessonsContentTarget.style.visibility = "visible";
  }
}
