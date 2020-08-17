const showAvatar = () => {
  const input = document.querySelector( '.file-optional' );
  if (input) {
    const label  = input.nextElementSibling;
    const labelVal = label.innerHTML;

    input.addEventListener('change', event => {
      let fileName = '';
      if (input.files && input.files.length > 0) {
        fileName = input.value.split("\\").pop();
        const avatarText = document.getElementById("avatar-text");
        avatarText.innerText = fileName;
        console.log(fileName);
      }
    });
  }
}
export { showAvatar };
