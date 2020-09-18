import { Controller } from "stimulus"
export default class extends Controller {
    static targets = [ "highest_fret" ]
    update(event) {
      let formData = new FormData();
      formData.append("chord[highest_fret]", this.highest_fretTarget.highest_fret);
      fetch(this.data.get("update-url"), {
      body: formData,
      method: 'PATCH',
      dataType: 'script',
      credentials: "include",
      headers: {
              "X-CSRF-Token": getMetaValue("csrf-token")
       },
})
      .then(function(response) {
    if (response.status != 204) {
        event.target.checked = !event.target.checked
    }
})

    }
}
