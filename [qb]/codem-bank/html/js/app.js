import dashboardModule from "./modules/dashboard.js";
import transactionModule from "./modules/transaction.js";
import billModule from "./modules/bill.js";
import loanModule from "./modules/loan.js";
import cryptoModule from "./modules/crypto.js";
import savingModule from "./modules/saving.js";
import societydashboardModule from "./modules/societydashboard.js";
import societytransactionModule from "./modules/societytransaction.js";
import profileModule from "./modules/profile.js";

const Modules = {
    dashboardpage: dashboardModule,
    transactionpage: transactionModule,
    billpage: billModule,
    loanpage: loanModule,
    cryptopage: cryptoModule,
    savingpage: savingModule,
    societydashboardpage: societydashboardModule,
    societytransactionpage: societytransactionModule,
    profilepage: profileModule
};
import dashboardpage from "../pages/dashboard/index.js";
import transactionpage from "../pages/transaction/index.js";
import billpage from "../pages/bill/index.js";
import loanpage from "../pages/loan/index.js";
import cryptopage from "../pages/crypto/index.js";
import savingpage from "../pages/saving/index.js";
import societydashboardpage from "../pages/societydashboard/index.js";
import societytransactionpage from "../pages/societytransaction/index.js";
import profilepage from "../pages/profile/index.js";

const store = Vuex.createStore({
    components: {
        dashboardpage: dashboardpage,
        transactionpage: transactionpage,
        billpage: billpage,
        loanpage: loanpage,
        cryptopage: cryptopage,
        savingpage: savingpage,
        societydashboardpage: societydashboardpage,
        societytransactionpage: societytransactionpage,
        profilepage: profilepage
    },

    state: {
        activePage: "profilepage",
        Locales: false,

        notifications: [],
        timeout: false,
        updateSpendData: false,
        updateSocietyRequestData: false,
        updateSocietyPlayersData: false,
        updateSocietyFirstAllData: false,
        updateSocietySpendData: false,
        updateSocietyContributionData: false,
        updateNotificationData: false,
        updateMostSendPlayersData: false,
        updatePlayerSpendigsData: false
    },
    getters: {},
    mutations: {
        SET_ACTIVE_PAGE(state, page) {
            state.activePage = page;
        },

        updateSpendigsData(state, payload) {
            state.updatePlayerSpendigsData = payload;
        },
        setPlayerDataSpendData(state, payload) {
            state.updateSpendData = payload;
        },
        setSocietyDataSpendData(state, payload) {
            state.updateSocietySpendData = payload;
        },
        scoietyUpdateRequestData(state, payload) {
            state.updateSocietyRequestData = payload;
        },
        societyUpdatePlayersData(state, payload) {
            state.updateSocietyPlayersData = payload;
        },
        societyUpdateFirstData(state, payload) {
            state.updateSocietyFirstAllData = payload;
        },
        scoietyUpdateContributionData(state, payload) {
            state.updateSocietyContributionData = payload;
        },
        updateMostSendData(state, payload) {
            state.updateMostSendPlayersData = payload;
        }
    },
    actions: {
        notification({ state }, text) {
            const timeout = 4000;
            let id = Date.now();
            if (state.notifications.length > 0) {
                if (state.timeout) {
                    clearTimeout(state.timeout);
                    state.timeout = false;
                }
                state.notifications = [];
            }
            state.notifications.push({
                id: id,
                text: text,
                timeout: timeout
            });
            state.timeout = setTimeout(() => {
                state.notifications = state.notifications.filter(notification => notification.id != id);
            }, timeout);
        }
    },

    modules: Modules
});

const app = Vue.createApp({
    components: {
        dashboardpage: dashboardpage,
        transactionpage: transactionpage,
        billpage: billpage,
        loanpage: loanpage,
        cryptopage: cryptopage,
        savingpage: savingpage,
        societydashboardpage: societydashboardpage,
        societytransactionpage: societytransactionpage,
        profilepage: profilepage
    },
    data: () => ({
        show: false,
        playerData: {},
        cryptoSwiperValue: false,
        fakeData: false,
        fakeDataLoan: false,
        bitcoinValue: 0,
        requiredSellBitcoin: {
            ADA: 100,
            BTC: 1,
            ETH: 50,
            XRP: 100,
            BNB: 1,
            USDC: 50,
            SOL: 5,
            DOGE: 250
        },
        atmPage: false,
        curentAtmPage: "", // main || login
        atmAccount: false,
        passwordText: "",
        ibanText: "",
        notificationPage: false,
        lockedPage: false,
        oldDataSocietyTransaction: false
    }),

    watch: {},

    beforeDestroy() {
        window.removeEventListener("keyup", this.updateNavbarActive);
    },
    mounted() {
        window.addEventListener("keyup", this.keyHandler);
        window.addEventListener("message", this.eventHandler);
    },

    methods: {
        ...Vuex.mapMutations({}),
        showNotificationPage(val) {
            this.notificationPage = val;
        },
        isEntered(index) {
            return index <= this.passwordText.length;
        },
        enterpasscode(index) {
            index = index + 1;
            if (index == 10) {
                this.passwordText = this.passwordText.slice(0, -1);
                return;
            }
            if (index == 11) {
                index = 0;
            }
            if (this.passwordText.length < 4) {
                this.passwordText += index.toString();
            }
        },
        changeAtmPage(page) {
            this.curentAtmPage = page;
        },
        joinAtmSelf() {
            if (!this.atmAccount) return;
            postNUI("joinAtmSelf", this.atmAccount);
            this.ibanText = "";
            this.passwordText = "";
        },
        cancelSaving() {
            if (this.$store.state.dashboardpage.playerData.savingdata.length == 0) return;
            this.$store.state.savingpage.cancelSaving = true;
        },
        payLoan(val) {
            if (val == "single") {
                postNUI("payLoan");
            } else if (val == "all") {
                postNUI("payLoanAll");
            }
        },
        checkInput() {
            if (this.bitcoinValue.length > 0) {
                this.bitcoinValue = this.bitcoinValue.replace(/[^0-9]/g, "");
            }
            if (this.ibanText.length > 0) {
                this.ibanText = this.ibanText.replace(/[^0-9]/g, "");
            }
        },
        changeActivePage(page) {
            if (this.activePage == page) return;
            if (this.lockedPage[page] === false) {
                this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["THESYSTEMISNOTACTIVE"]);
                return;
            }
            this.$store.commit("SET_ACTIVE_PAGE", page);
            if (this.$refs[page]) {
                const img = this.$refs[page];
                img.classList.add("image-change-animation");
                setTimeout(() => {
                    img.classList.remove("image-change-animation");
                }, 1000);
            }

            if (page == "cryptopage") {
                if (this.$store.state.dashboardpage.playerData.cryptodata.length > 0) {
                    if (this.cryptoSwiperValue) this.cryptoSwiperValue.destroy();
                    this.calculaterCrypto();
                    setTimeout(() => {
                        this.cryptoSwiper();
                    }, 150);
                }
            }
        },
        loginATMAccount() {
            if (this.ibanText.length < 0) {
                return postNUI("shownotify", this.$store.state.dashboardpage.locales["PLEASEENTEREITHERIBAN"]);
            }
            if (this.ibanText.length < 6) {
                return postNUI("shownotify", this.$store.state.dashboardpage.locales["NOLESS"]);
            }
            if (this.ibanText.length > 6) {
                return postNUI("shownotify", this.$store.state.dashboardpage.locales["NOMORE"]);
            }
            if (this.passwordText.length < 4) {
                return postNUI("shownotify", this.$store.state.dashboardpage.locales["ENTERPASSWORD"]);
            }
            postNUI("loginATMAccount", { iban: this.ibanText, password: this.passwordText });
            this.ibanText = "";
            this.passwordText = "";
        },
        formatIbanNumber(number) {
            if (typeof number === "number") {
                number = number.toString();
            }
            const part1 = "**";
            const part2 = number.substring(0, 2);
            const part3 = number.substring(2);
            return `${part1}${part2} ${part3}`;
        },

        cryptoSwiper() {
            if (this.cryptoSwiperValue) {
                this.cryptoSwiperValue.destroy();
            }

            this.cryptoSwiperValue = new Swiper("#mainswiper", {
                slidesPerView: 1,
                loop: false,
                spaceBetween: 30,
                slidesPerGroup: 1,

                navigation: {
                    nextEl: "#mainswiperleft",
                    prevEl: "#mainswiperright"
                }
            });
            const initialSlideIndex = this.cryptoSwiperValue.activeIndex;
            const initialSlideData = this.$store.state.dashboardpage.playerData.cryptodata[initialSlideIndex];
            this.fakeData = initialSlideData;

            this.cryptoSwiperValue.on("slideChange", () => {
                const activeSlideIndex = this.cryptoSwiperValue.activeIndex;
                const activeSlideData = this.$store.state.dashboardpage.playerData.cryptodata[activeSlideIndex];
                this.fakeData = activeSlideData;
            });
        },
        sellCrypto(val) {
            if (val == "single") {
                if (this.bitcoinValue == 0) return;
                if (!this.fakeData) return;

                let amount = this.requiredSellBitcoin[this.fakeData.bitcoinname];
                if (this.bitcoinValue < amount) {
                    this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["MINUMUMAMOUNT"] + " " + amount + "");
                    return;
                }
                this.fakeData.sellamount = this.bitcoinValue;
                postNUI("sellCrypto", { data: this.fakeData });
            }
            if (val == "all") {
                if (!this.fakeData) return;
                postNUI("sellCryptoAll", { data: this.fakeData });
            }
        },
        async calculaterCrypto() {
            for (let key in this.$store.state.dashboardpage.playerData.cryptodata) {
                let bitcoinname = this.$store.state.dashboardpage.playerData.cryptodata[key].bitcoinname;
                try {
                    const response = await fetch(`https://min-api.cryptocompare.com/data/price?fsym=${bitcoinname}&tsyms=USD`);
                    const data = await response.json();
                    const coinValue = data.USD;
                    this.$store.state.dashboardpage.playerData.cryptodata[key].price = coinValue;
                } catch (error) {
                    console.error("error");
                }
            }
        },
        keyHandler(e) {
            if (e.which == 27) {
                this.$store.commit("SET_ACTIVE_PAGE", "");
                this.show = false;
                postNUI("close");
                this.$store.state.societydashboardpage.societyAccount.allow = false;
                this.$store.state.societydashboardpage.societyAccount.boss = false;
                this.$store.state.societydashboardpage.societyAccount.jobdata = false;
                this.$store.state.societydashboardpage.currentPage = "sendrequest";
                this.$store.state.dashboardpage.atmAccount = false;
                this.atmPage = false;
                this.curentAtmPage = "";
            }
        },
        closeBankPage() {
            this.show = false;
            postNUI("close");
            this.$store.state.societydashboardpage.societyAccount.allow = false;
            this.$store.state.societydashboardpage.societyAccount.boss = false;
            this.$store.state.societydashboardpage.societyAccount.jobdata = false;
            this.$store.state.societydashboardpage.currentPage = "sendrequest";
            this.$store.state.dashboardpage.atmAccount = false;
        },
        formatIbanNumberJob(jobname) {
            if (!jobname || typeof jobname !== "string") {
                return "**** **** **** ****";
            }
            const segmentLengths = [1, 4, 4, 4];
            const resultSegments = [];
            let startIndex = 0;
            segmentLengths.forEach(length => {
                resultSegments.push(jobname.substr(startIndex, length));
                startIndex += length;
            });
            const result = resultSegments.join(" ");

            return result.padStart(19, "*");
        },
        timeDifference(notificationTime) {
            const currentTime = new Date();
            const timeParts = notificationTime.split(":");
            const notificationDate = new Date(
                currentTime.getFullYear(),
                currentTime.getMonth(),
                currentTime.getDate(),
                parseInt(timeParts[0]),
                parseInt(timeParts[1]),
                parseInt(timeParts[2])
            );

            const diff = currentTime - notificationDate;

            const minutesPassed = Math.floor(diff / 1000 / 60);

            return minutesPassed;
        },

        eventHandler(event) {
            switch (event.data.action) {
                case "updateCryptoData":
                    this.$store.state.dashboardpage.playerData.cryptodata = event.data.payload;
                    this.fakeData = false;
                    setTimeout(() => {
                        if (this.cryptoSwiperValue) {
                            this.cryptoSwiperValue.destroy();
                        }
                    }, 100);
                    if (this.$store.state.dashboardpage.playerData.cryptodata.length > 0) {
                        this.calculaterCrypto();
                        setTimeout(() => {
                            this.cryptoSwiper();
                        }, 150);
                    }
                    break;
                case "CHECK_NUI":
                    postNUI("loaded", true);
                    break;
                case "loaduidata":
                    this.$store.state.dashboardpage.playerData = event.data.payload;

                    break;
                case "OPEN_BANK_MENU_FOR_ATM":
                    this.atmPage = false;
                    this.$store.state.dashboardpage.playerMoneyData.money = event.data.payload.money;
                    this.$store.state.dashboardpage.playerMoneyData.bank = event.data.payload.bank;
                    this.$store.state.dashboardpage.playerData = event.data.payload.allData;

                    this.show = true;
                    this.$store.state.dashboardpage.atmAccount = true;
                    this.$store.commit("SET_ACTIVE_PAGE", "dashboardpage");
                    break;
                case "OPEN_BANK_MENU":
                    this.atmPage = false;
                    this.$store.state.dashboardpage.playerMoneyData.money = event.data.payload.money;
                    this.$store.state.dashboardpage.playerMoneyData.bank = event.data.payload.bank;
                    this.$store.state.dashboardpage.playerData = event.data.payload.allData;

                    this.show = true;

                    this.$store.commit("SET_ACTIVE_PAGE", "dashboardpage");
                    break;
                case "UPDATE_PLAYER_BANK_MONEY":
                    this.$store.state.dashboardpage.playerMoneyData.bank = event.data.payload;
                    break;
                case "UPDATE_PLAYER_CASH_MONEY":
                    this.$store.state.dashboardpage.playerMoneyData.money = event.data.payload;
                    break;
                case "configLockedPage":
                    this.lockedPage = event.data.payload;

                    break;
                case "UPDATE_REQUEST_DATA":
                    if (this.$store.state.dashboardpage.playerData.requestdata) {
                        this.$store.state.dashboardpage.playerData.requestdata.push(event.data.payload);
                    }
                    break;
                case "UPDATE_SOCIETY_NOTIFICATION_DATA":
                    if (this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata) {
                        this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata.push(event.data.payload);
                        // this.oldDataSocietyTransaction.push(event.data.payload);
                    }
                    break;
                case "REFRESH_REQUEST_DATA":
                    this.$store.state.dashboardpage.playerData.requestdata = event.data.payload;
                    break;
                case "UPDATE_SPEND_DATA":
                    this.$store.commit("setPlayerDataSpendData", event.data.payload);
                    break;
                case "UPDATE_SOCIETY_SPEND_DATA":
                    this.$store.commit("setSocietyDataSpendData", event.data.payload);
                    break;
                case "loanDataUpdate":
                    this.$store.state.dashboardpage.playerData.loandata = event.data.payload;
                    break;
                case "updateSavingData":
                    this.$store.state.dashboardpage.playerData.savingdata = event.data.payload;
                    break;
                case "configLoanData":
                    this.$store.state.loanpage.loandata = event.data.payload;
                    break;
                case "configSavingData":
                    this.$store.state.savingpage.savingdata = event.data.payload;
                    break;
                case "configBitcoinData":
                    this.$store.state.cryptopage.cryptodata = event.data.payload;
                    break;
                case "SEND_NOTIFICATION":
                    this.$store.dispatch("notification", event.data.payload);
                    break;
                case "SEND_PLAYER_IDENTIFIER":
                    this.$store.state.dashboardpage.identifier = event.data.payload;
                    break;
                case "UPDATE_SOCIETY_CONTRIBUTION_DATA":
                    this.$store.commit("scoietyUpdateContributionData", event.data.payload);
                    break;
                case "UPDATE_SPENDINGS_DATA":
                    this.$store.commit("updateSpendigsData", event.data.payload);
                    this.$store.state.dashboardpage.playerData.spendigsdata = event.data.payload;
                    break;
                case "UPDATE_MYSELF_JOB":
                    this.$store.state.dashboardpage.myJob = event.data.payload;
                    break;
                case "UPDATE_SOCIETY_REQUEST":
                    this.$store.commit("scoietyUpdateRequestData", event.data.payload);
                    break;
                case "UPDATE_MOST_SEND_PLAYERS_DATA":
                    if (this.$store.state.dashboardpage.playerData.mostsenddata) {
                        this.$store.commit("updateMostSendData", event.data.payload);
                    }

                    break;
                case "UPDATE_NOTIFICATION_DATA":
                    if (this.$store.state.dashboardpage.playerData.notificationdata) {
                        this.$store.state.dashboardpage.playerData.notificationdata.push(event.data.payload);
                    }
                    break;
                case "UPDATE_PUSH_NOTIFICATION_DATA":
                    if (this.$store.state.dashboardpage.playerData.pushnotificationdata) {
                        this.$store.state.dashboardpage.playerData.pushnotificationdata.push(event.data.payload);
                    }
                    break;
                case "UPDATE_SOCIETY_PLAYERSDATA":
                    this.$store.commit("societyUpdatePlayersData", event.data.payload);
                    this.$store.state.societydashboardpage.societyAccount.jobdata.playersdata = event.data.payload;
                    break;
                case "FIRST_DATA_SOCIETY":
                    this.$store.commit("societyUpdateFirstData", event.data.payload);
                    this.$store.state.societydashboardpage.currentPage = "main";
                    break;
                case "KICK_MEMBER_SOCIETY":
                    this.$store.state.societydashboardpage.societyAccount.allow = true;
                    this.$store.state.societydashboardpage.societyAccount.boss = false;
                    this.$store.state.societydashboardpage.societyAccount.jobdata = false;
                    this.$store.state.societydashboardpage.currentPage = "sendrequest";
                    break;
                case "OPEN_SOCIETY_MENU":
                    this.$store.state.societydashboardpage.societyAccount.allow = true;
                    this.$store.state.societydashboardpage.societyAccount.jobdata = event.data.payload;
                    this.oldDataSocietyTransaction = this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata;
                    let bossFilter = event.data.payload.playersdata.filter(
                        player => player.identifier == this.$store.state.dashboardpage.identifier && player.boss === true
                    );
                    if (bossFilter.length > 0) {
                        this.$store.state.societydashboardpage.societyAccount.boss = true;
                    } else {
                        this.$store.state.societydashboardpage.societyAccount.boss = false;
                    }
                    this.$store.state.societydashboardpage.currentPage = "main";
                    this.$store.commit("setSocietyDataSpendData", event.data.payload.spenddata);
                    break;
                case "DEFAULT_SOCIETY_MENU":
                    this.$store.state.societydashboardpage.societyAccount.allow = true;
                    this.$store.state.societydashboardpage.societyAccount.boss = false;
                    this.$store.state.societydashboardpage.societyAccount.jobdata = false;
                    this.$store.state.societydashboardpage.currentPage = "sendrequest";
                    break;
                case "OPEN_REQUEST_SOCIETY":
                    this.$store.state.societydashboardpage.societyAccount.allow = true;
                    this.$store.state.societydashboardpage.societyAccount.boss = false;
                    this.$store.state.societydashboardpage.societyAccount.jobdata = false;
                    this.$store.state.societydashboardpage.currentPage = "sendrequest";
                    break;
                case "AWAITINGREQUEST":
                    this.$store.state.societydashboardpage.societyAccount.allow = true;
                    this.$store.state.societydashboardpage.societyAccount.boss = false;
                    this.$store.state.societydashboardpage.societyAccount.jobdata = false;
                    this.$store.state.societydashboardpage.currentPage = "awaiting";
                    break;
                case "SEND_BILLINGDATA":
                    this.$store.state.billpage.billdata = event.data.payload;
                    break;
                case "SOCIETY_MONEY":
                    this.$store.state.societydashboardpage.societyMoney = event.data.payload;
                    break;
                case "ATM_ACCOUNT":
                    this.atmAccount = event.data.payload;
                    this.atmPage = true;
                    this.curentAtmPage = "main";
                    break;
                case "configLocales":
                    this.$store.state.dashboardpage.locales = event.data.payload;
                    break;
                case "configCurrencyUnit":
                    this.$store.state.dashboardpage.currencyUnit = event.data.payload;

                    break;
                default:
                    break;
            }
        }
    },
    computed: {
        ...Vuex.mapState({
            activePage: state => state.activePage,
            updateSpendData: state => state.updateSpendData,
            updateSocietyRequestData: state => state.updateSocietyRequestData,
            updateSocietyPlayersData: state => state.updateSocietyPlayersData,
            notifications: state => state.notifications,
            updateSocietyFirstAllData: state => state.updateSocietyFirstAllData,
            updateSocietySpendData: state => state.updateSocietySpendData,
            updateSocietyContributionData: state => state.updateSocietyContributionData,
            updateNotificationData: state => state.updateNotificationData,

            updateMostSendPlayersData: state => state.updateMostSendPlayersData
        }),
        formattediBanNumber() {
            if (!this.$store.state.dashboardpage.playerData.profiledata) return;
            const ibanNumber = this.$store.state.dashboardpage.playerData.profiledata.iban;
            return this.formatIbanNumber(ibanNumber);
        },
        topFourNotifications() {
            let notifications = [...this.$store.state.dashboardpage.playerData.notificationdata];
            return notifications.reverse().slice(0, 5);
        },
        topFourNotificationsSociety() {
            let notifications = [...this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata];
            return notifications.reverse().slice(0, 5);
        },
        iconSource() {
            return iconName => {
                if (iconName === "withdrawiconsmall") {
                    return "./images/transfericonsmall2.png";
                } else if (iconName === "gasiconsmall") {
                    return "./images/gasiconsmall2.png";
                } else if (iconName === "shoppingiconsmall") {
                    return "./images/shoppingiconsmall.png";
                } else if (iconName === "billiconsmall") {
                    return "./images/billsicon.png";
                } else {
                    return `./images/${iconName}2.png`;
                }
            };
        },
        bankPageName() {
            return activePage => {
                if (activePage == "dashboardpage") {
                    return this.$store.state.dashboardpage.locales["PAGEDASBOARD"];
                }
                if (activePage == "transactionpage") {
                    return this.$store.state.dashboardpage.locales["PAGETRANSACTIONS"];
                }
                if (activePage == "billpage") {
                    return this.$store.state.dashboardpage.locales["PAGEBILL"];
                }
                if (activePage == "loanpage") {
                    return this.$store.state.dashboardpage.locales["PAGELOAN"];
                }
                if (activePage == "savingpage") {
                    return this.$store.state.dashboardpage.locales["PAGESAVING"];
                }
                if (activePage == "cryptopage") {
                    return this.$store.state.dashboardpage.locales["PAGECRYPTO"];
                }
                if (activePage == "profilepage") {
                    return this.$store.state.dashboardpage.locales["PAGEPROFIL"];
                }
                if (activePage == "societydashboardpage") {
                    return this.$store.state.dashboardpage.locales["PAGESOCIETY"];
                }
                if (activePage == "societytransactionpage") {
                    return this.$store.state.dashboardpage.locales["PAGESOCIETYTRANSACTION"];
                }
            };
        },
        formattediBanNumberJob() {
            if (!this.$store.state.dashboardpage.myJob) return;
            const ibanNumber = this.$store.state.dashboardpage.myJob;
            return this.formatIbanNumberJob(ibanNumber);
        }
    }
});

app.use(store).mount("#app");
var resourceName = "codem-bank";

if (window.GetParentResourceName) {
    resourceName = window.GetParentResourceName();
}

window.postNUI = async (name, data) => {
    try {
        const response = await fetch(`https://${resourceName}/${name}`, {
            method: "POST",
            mode: "cors",
            cache: "no-cache",
            credentials: "same-origin",
            headers: {
                "Content-Type": "application/json"
            },
            redirect: "follow",
            referrerPolicy: "no-referrer",
            body: JSON.stringify(data)
        });
        return !response.ok ? null : response.json();
    } catch (error) {
        // console.log(error)
    }
};

function clicksound(val) {
    let audioPath = `./sound/${val}`;
    audioPlayer = new Howl({
        src: [audioPath]
    });
    audioPlayer.volume(0.4);
    audioPlayer.play();
}
