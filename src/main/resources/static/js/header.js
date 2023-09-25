const navDropdown = document.querySelector('.nav-dropdown')
navDropdown.addEventListener('change', function() {
    const selectedValue = this.value;
    if(selectedValue) {
        window.location.href = selectedValue;
    }
});