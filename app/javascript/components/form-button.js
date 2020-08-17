const OpenFormOnBtnClick = () => {
  const buttons = document.querySelectorAll('.reveal-form-button');
  buttons.forEach((btn) => {
    const field = btn.parentElement.querySelector('.form-wrapper');
    const cancelForm = btn.parentElement.querySelector('.cancel-form');
    btn.addEventListener('click', () => {
      if (field.classList.contains('d-none')) {
        field.classList.remove('d-none');
        cancelForm.classList.remove('d-none');
        btn.classList.add('d-none');
        cancelForm.classList.add('cancel-btn');
      } else {
        field.classList.add('d-none');
        btn.classList.remove('cancel-btn');
        btn.innerHTML = "Add notes";
      };
    });

    cancelForm.addEventListener('click', () => {
      field.classList.add('d-none');
      cancelForm.classList.add('d-none');
      btn.classList.remove('d-none');

    });
  });
}

export { OpenFormOnBtnClick };


// On ‘Add Button’:
// Reveal Field
// Hide ‘Add Button’ (itself)
// Reveal ‘Cancel Button’


// 2. On ‘Cancel Button’:
// Hide Field
// Hide Cancel Button (itself)
// Reveal ‘Add Button’
