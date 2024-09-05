"use strict";

import UM from '../../../config.js';
import handlers from './handlers.js';
import { fetchData } from './utils/fetchData.js';
import { initVideoBackground, YTBGVideo } from './utils/ytvideo.js';

const loadingScreenV3 = Vue.createApp({
    data() {
        return {
            pagestore: false,
            pageaboutus: false,
            randomtext: UM.RandomInfo.text[1],
            music: null,
            mute: false,
            muteicon: false,
            steam: {
                name: "no steam",
                avatar: "assets/images/no-image.jpg",
            },
            discord: {
                name: "no discord",
                avatar: "assets/images/no-image.jpg",
                banner: "",
                badges: "",
            },
            changeLog: UM.ChangeLog,
            mainSettings: UM.MainSettings,
            page: {
                storecard: UM.Store,
                aboutus: UM.AboutUs,
                social: UM.UserSocial,
                playermonth: UM.PlayerOfTheMonth,
                settings: UM.Settings,
                video: UM.BackgroundSettings,
            },
            RGButton: false,
            clearinvrgb: null,
            clearinvrgbA: null,
            popup: false,
            url: '',
        }
    },
    methods: {
        async getGithubChangeLog() {
            if (!UM.ChangeLog.github.enabled) return;
            const response = await fetchData(`https://raw.githubusercontent.com/${UM.ChangeLog.github.username}/${UM.ChangeLog.github.repository}/${UM.ChangeLog.github.branch}/${UM.ChangeLog.github.path}`);
            const data = await response.text();
            UM.ChangeLog.page.content = data;
        },
        randomText() {
            setInterval(() => {
                let random = Math.floor(UM.RandomInfo.text.length * Math.random())
                this.randomtext = UM.RandomInfo.text[random];
             }, UM.RandomInfo.time);
        },
        randomRGB() {
            if (this.mainSettings.extra.autoRGB) {
                this.clearinvrgbA = setInterval(() => {
                    this.rgbColor()
                }, 1000);
            }
        },
        randomRGButton() {
            this.RGButton = !this.RGButton
            if (this.clearinvrgbA) {
                clearInterval(this.clearinvrgbA)
                this.clearinvrgbA = null
                this.RGButton = false
            }
            if (this.RGButton) {
                this.clearinvrgb = setInterval(() => {
                this.rgbColor()
                }, 800);
             } else {
                clearInterval(this.clearinvrgb)
            }
        },
        changeColor(variable, color) {
            document.documentElement.style.setProperty(variable, color);
         },
        rgbColor() {
            let color1 = Math.floor(Math.random() * 255) + 1;
            let color2 = Math.floor(Math.random() * 255) + 1;
            let color3 = Math.floor(Math.random() * 255) + 1;
            this.changeColor('--main', 'rgb(' + color1 + ',' + color2 + ',' + color3 + ')')
        },
        musicPlay() {
            if (!this.page.video.musicBackground.enabled) return;
            this.music = document.getElementById("music");
            this.music.volume = this.page.video.musicBackground.volume;
            this.music.play();
        },
        musicMute() {
            this.toggleMuteState();

            if (this.mute) {
                this.pauseMusicOrMuteVideo();
            } else {
                this.playMusicOrUnmuteVideo();
            }
        },
        toggleMuteState() {
            this.mute = !this.mute;
            this.muteicon = !this.muteicon;
        },
        pauseMusicOrMuteVideo() {
            if (this.music) {
                this.music.pause();
            } else {
                YTBGVideo('mute');
            }
        },
        playMusicOrUnmuteVideo() {
            if (this.music) {
                this.music.play();
            } else {
                YTBGVideo('unmute');
            }
        },
        randomBG() {
            let images = UM.BackgroundSettings.imageBackground.randomIMG.imglist
            let randomImage = Math.floor((Math.random() * images.length));
            this.page.video.imageBackground.defaultIMG = `assets/images/bg/${images[randomImage]}`
        },
        backgroundMain() {
            document.documentElement.style.setProperty('--opactitynum', this.mainSettings.opacity);
            if (UM.BackgroundSettings.videoBackground.youtubeVID.enabled) {
                this.page.video.imageBackground.defaultIMG = `https://img.youtube.com/vi/${UM.BackgroundSettings.videoBackground.youtubeVID.link}/maxresdefault.jpg`
                initVideoBackground(UM.BackgroundSettings.videoBackground.youtubeVID.volume);
            } else if (UM.BackgroundSettings.imageBackground.randomIMG.enabled) {
                this.page.video.imageBackground.defaultIMG = UM.BackgroundSettings.imageBackground.defaultIMG.link
                setInterval(() => {
                    this.randomBG()
                }, 4000);
            }
              else {
                this.page.video.imageBackground.defaultIMG = UM.BackgroundSettings.imageBackground.defaultIMG.link
            }
        },
        StoreAboutUS() {
            if (!UM.AboutUs.enabled) {
                this.popup = !this.popup
                if (!window.invokeNative) return;
                window.invokeNative('openUrl', this.page.storecard.url);
            } else {
                this.pageaboutus = !this.pageaboutus
            }
        },
        ChangeLogURL() {
                this.url = this.changeLog.url.link
                this.popup = !this.popup
        },
        async GetDiscordData(discordid) {
            if (!discordid) return;
            const data = await fetchData(`${UM.API.discord}${discordid}`);
            this.discord.badges = data.badges || ''
            this.discord.avatar = data.avatar.link || ''
            this.discord.banner = data.banner.link || ''
            this.discord.name = data.username || ''
        },
        GetSteamData(data) {
            if (!data) return;
            const getJson = JSON.parse(data).response.players[0];
            this.steam.name = getJson.personaname
            this.steam.avatar = getJson.avatarfull
        }

    },
    mounted() {
        if (window.nuiHandoverData) {
            const data = window.nuiHandoverData;
            if (this.page.social.discord) this.GetDiscordData(data.discord || false)
            if (this.page.social.steam)  this.GetSteamData(data.steam || false)
        }
        window.addEventListener("message", function(e) {
            (handlers[e.data.eventName] || function() {})(e.data);
         });

        this.getGithubChangeLog();
        this.changeColor('--main', this.mainSettings.color);
        this.musicPlay();
        this.randomText();
        this.randomRGB();
        this.backgroundMain();

    },
    beforeUnmount() {
        window.removeEventListener('message', this.eventHandler);
        document.removeEventListener('keyup', this.keyupHandler);
    },
}).mount('body');