let firstInstance;

const initVideoBackground = (volume) => {
    const videoBackgrounds = new VideoBackgrounds('[data-vbg]', {});
    const firstElement = document.querySelector('[data-vbg]');
    firstInstance = videoBackgrounds.get(firstElement);

    firstElement.addEventListener('video-background-ready', function(event) {
        firstInstance.play();
        firstInstance.unmute();
        firstInstance.setVolume(volume);
     });

};

const YTBGVideo = (action) => {
    if (!firstInstance) return;

    if (action === 'unmute') {
        firstInstance.unmute();
    } else if (action === 'mute') {
        firstInstance.mute();
    }
};

export { initVideoBackground, YTBGVideo };
