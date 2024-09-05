const selectors = {
    // Main UI
    main: '.container',
    // Speed Traps
    cameraFlash: '.camera-flash',
};

function getElements() {
    const elements = {};
    for (const key in selectors) {
        elements[key] = document.querySelector(selectors[key]);
    }
    return elements;
}

function HandleCameraFlash(elements) {
    elements.main.style.display = 'flex';
    elements.cameraFlash.style.display = 'flex';
    elements.cameraFlash.style.opacity = '1';
    setTimeout(() => {
        elements.cameraFlash.style.opacity = '0';
        setTimeout(() => {
            elements.main.style.display = 'none';
            elements.cameraFlash.style.display = 'none';
        }, 1000);
    }, 100);
}



// MAIN LISTENER
let mainListener;

if (mainListener) {
    window.removeEventListener('message', mainListener);
}

mainListener = (event) => {
    const data = event.data;
    const elements = getElements();

    if (data.action === 'cameraFlash') {
        HandleCameraFlash(elements);
        return;
    }
};

window.addEventListener('message', mainListener);