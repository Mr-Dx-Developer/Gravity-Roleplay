import importTemplate from "../../js/util/importTemplate.js";

export default {
    template: await importTemplate("pages/dashboard/index.html"),

    components: {},
    data: () => ({
        spendingChart: false,

        interactionCategory: "main", // main | send | withdraw | deposit
        categoryButtonData: [],

        withdrawOption: [{ amount: 10 }, { amount: 100 }, { amount: 1000 }, { amount: 10000 }, { amount: 100000 }, { amount: 1000000 }],
        depositOption: [{ amount: 10 }, { amount: 10000 }, { amount: 1000 }, { amount: 10000 }, { amount: 100000 }, { amount: 1000000 }],
        searchPlayerValue: "",
        searchPlayerResult: false,
        sendAmount: "",
        playerIDModal: "",
        playerIbanModal: "",
        fakeData: false,
        allSpendings: 0,
        spendingAnalyticsData: [
            { name: "bills", icon: "billsicon", label: "Bills", amount: 0 },
            { name: "shopping", icon: "shoppingicon", label: "Shopping", amount: 0 },
            { name: "gas", icon: "gasicon", label: "Gas", amount: 0 },
            { name: "transfer", icon: "transfericon", label: "Transfer", amount: 0 }
        ],
        selectedsearchdata: false
    }),
    methods: {
        selectedSearchPlayer(data) {
            if (this.selectedsearchdata) {
                this.selectedsearchdata = false;
            } else {
                this.selectedsearchdata = data;
            }
        },
        closeFakeData() {
            this.fakeData = false;
        },
        sendMoneyToPlayerMost(val) {
            this.fakeData = val;
        },
        withdrawMoney() {
            if (this.sendAmount == "" || this.sendAmount <= 0) {
                return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["PLEASEENTERAVALIDAMOUNT"]);
            }
            if (this.$store.state.dashboardpage.atmAccount) {
                postNUI("withdrawMoneyAtmAccount", { amount: this.sendAmount, playerData: this.$store.state.dashboardpage.playerData });
            } else {
                postNUI("withdrawMoney", { amount: this.sendAmount });
            }
        },
        depositMoney() {
            if (this.sendAmount == "" || this.sendAmount <= 0) {
                return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["PLEASEENTERAVALIDAMOUNT"]);
            }
            if (this.$store.state.dashboardpage.atmAccount) {
                postNUI("depositMoneyAtmAccount", { amount: this.sendAmount, playerData: this.$store.state.dashboardpage.playerData });
            } else {
                postNUI("depositMoney", { amount: this.sendAmount });
            }
        },
        withdrawOptionClick(value) {
            if (this.$store.state.dashboardpage.atmAccount) {
                postNUI("withdrawMoneyAtmAccount", { amount: value, playerData: this.$store.state.dashboardpage.playerData });
            } else {
                postNUI("withdrawMoney", { amount: value });
            }
        },
        depositOptionClick(value) {
            if (this.$store.state.dashboardpage.atmAccount) {
                postNUI("depositMoneyAtmAccount", { amount: value, playerData: this.$store.state.dashboardpage.playerData });
            } else {
                postNUI("depositMoney", { amount: value });
            }
        },
        numpadClick(value) {
            if (value == 11) {
                value = 0;
            }
            this.sendAmount += value;
        },
        sendRequestToPlayer() {
            if (this.selectedsearchdata) {
                postNUI("sendRequestToPlayerIBAN", { playerIBAN: this.selectedsearchdata.iban, amount: this.sendAmount });
                this.selectedsearchdata = false;
                return;
            }
            if (this.sendAmount == "" || this.sendAmount <= 0) {
                return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["PLEASEENTERAVALIDAMOUNT"]);
            }
            if (this.playerIDModal == "" && this.playerIbanModal == "") {
                return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["PLEASEENTEREITHERPLAYERIDORIBAN"]);
            }

            if (this.playerIDModal !== "") {
                postNUI("sendRequestToPlayer", { playerID: this.playerIDModal, amount: this.sendAmount });
                this.playerIDModal = "";
                this.playerIbanModal = "";
                this.sendAmount = "";
            }

            if (this.playerIbanModal !== "") {
                postNUI("sendRequestToPlayerIBAN", { playerIBAN: this.playerIbanModal, amount: this.sendAmount });
                this.playerIDModal = "";
                this.playerIbanModal = "";
                this.sendAmount = "";
            }
        },
        sendMoneyToPlayer() {
            if (this.selectedsearchdata) {
                if (this.sendAmount == "" || this.sendAmount <= 0) {
                    return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["PLEASEENTERAVALIDAMOUNT"]);
                }
                postNUI("sendMoneyToPlayerIBAN", { playerIBAN: this.selectedsearchdata.iban, amount: this.sendAmount });
                this.selectedsearchdata = false;
            } else if (this.fakeData) {
                if (this.sendAmount == "" || this.sendAmount <= 0) {
                    return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["PLEASEENTERAVALIDAMOUNT"]);
                }
                postNUI("sendMoneyToPlayerIBAN", { playerIBAN: this.fakeData.iban, amount: this.sendAmount });
            } else {
                if (this.sendAmount == "" || this.sendAmount <= 0) {
                    return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["PLEASEENTERAVALIDAMOUNT"]);
                }
                if (this.playerIDModal == "" && this.playerIbanModal == "") {
                    return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["PLEASEENTEREITHERPLAYERIDORIBAN"]);
                }
                if (this.playerIDModal !== "") {
                    postNUI("sendMoneyToPlayer", { playerID: this.playerIDModal, amount: this.sendAmount });
                    this.playerIDModal = "";
                    this.playerIbanModal = "";
                    this.sendAmount = "";
                }

                if (this.playerIbanModal !== "") {
                    postNUI("sendMoneyToPlayerIBAN", { playerIBAN: this.playerIbanModal, amount: this.sendAmount });
                    this.playerIDModal = "";
                    this.playerIbanModal = "";
                    this.sendAmount = "";
                }
            }
        },
        checkInput() {
            this.sendAmount = this.sendAmount.replace(/[^0-9]/g, "");
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
        async searchPlayerName() {
            let response = await postNUI("searchPlayer", { data: this.searchPlayerValue });
            this.searchPlayerResult = response;
        },

        changeInteractionCategory(category) {
            this.searchPlayerValue = "";
            this.selectedsearchdata = false;
            this.searchPlayerResult = false;
            this.fakeData = false;
            this.playerIDModal = "";
            this.playerIbanModal = "";
            this.sendAmount = "";
            if (this.$store.state.dashboardpage.atmAccount) {
                if (category == "send") {
                    return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["YOUCANTSEE"]);
                }
                if (category == "request") {
                    return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["YOUCANTSEE"]);
                }
            }

            if (this.interactionCategory == category) {
                this.interactionCategory = "main";
                for (let key in this.categoryButtonData) {
                    this.categoryButtonData[key] = false;
                }

                return;
            }
            this.interactionCategory = category;

            for (let key in this.categoryButtonData) {
                this.categoryButtonData[key] = false;
            }

            this.categoryButtonData[category] = !this.categoryButtonData[category];
        },

        createChartSociety() {
            if (this.spendingChart) this.spendingChart.destroy();

            setTimeout(() => {
                const ctx = document.getElementById("myChartSociety");
                Chart.defaults.color = "#646365";
                Chart.defaults.fontFamily = "gilroybold";
                this.spendingChart = new Chart(ctx, {
                    type: "line",

                    data: {
                        labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],

                        datasets: [
                            {
                                label: "$",

                                data: [
                                    this.$store.state.dashboardpage.playerData.spenddata.mon || 0,
                                    this.$store.state.dashboardpage.playerData.spenddata.tue || 0,
                                    this.$store.state.dashboardpage.playerData.spenddata.wed || 0,
                                    this.$store.state.dashboardpage.playerData.spenddata.thu || 0,
                                    this.$store.state.dashboardpage.playerData.spenddata.fri || 0,
                                    this.$store.state.dashboardpage.playerData.spenddata.sat || 0,
                                    this.$store.state.dashboardpage.playerData.spenddata.sun || 0
                                ],
                                borderWidth: 3,
                                barThickness: 20,
                                borderColor: "#21405E",
                                tension: 0.4,
                                font: {
                                    size: 20,

                                    family: "gilroybold"
                                },
                                color: "white"
                            }
                        ]
                    },

                    options: {
                        hoverRadius: 12,
                        hoverBackgroundColor: "#0084FF",
                        responsive: true,
                        interaction: {
                            mode: "nearest",
                            intersect: false
                        },
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                display: false
                            }
                        },

                        scales: {
                            y: {
                                beginAtZero: true,
                                display: true,
                                ticks: {
                                    color: function (context) {
                                        if (context.tick.value === 0) {
                                        }
                                        return "rgba(255, 255, 255, 0.1)";
                                    },
                                    callback: function (value, index, ticks) {
                                        return value + "$";
                                    }
                                }
                            },
                            x: {
                                ticks: {
                                    font: {
                                        size: 15
                                    }
                                }
                            }
                        }
                    }
                });
            }, 250);
        }
    },

    computed: {
        formattediBanNumber() {
            if (!this.$store.state.dashboardpage.playerData.profiledata.iban) return;
            const ibanNumber = this.$store.state.dashboardpage.playerData.profiledata.iban;
            return this.formatIbanNumber(ibanNumber);
        },
        ...Vuex.mapState({
            updateSpendData: state => state.updateSpendData,
            updateMostSendPlayersData: state => state.updateMostSendPlayersData,
            updatePlayerSpendigsData: state => state.updatePlayerSpendigsData
        }),
        sortedMostSendData() {
            return this.$store.state.dashboardpage.playerData.mostsenddata.sort((a, b) => b.contribution - a.contribution);
        }
    },

    watch: {
        updateSpendData(newVal, oldVal) {
            if (newVal) {
                if (this.spendingChart) this.spendingChart.destroy();
                setTimeout(() => {
                    this.$store.state.dashboardpage.playerData.spenddata = newVal;
                    this.createChartSociety();
                }, 50);
            }
        },
        updateMostSendPlayersData(newVal, oldVal) {
            if (newVal) {
                if (this.$store.state.dashboardpage.playerData.mostsenddata) {
                    this.$store.state.dashboardpage.playerData.mostsenddata = false;
                    this.$store.state.dashboardpage.playerData.mostsenddata = newVal;
                }
            }
        },
        updatePlayerSpendigsData(newVal, oldVal) {
            if (newVal) {
                this.$store.state.dashboardpage.playerData.spendigsdata = newVal;
                for (let item of this.spendingAnalyticsData) {
                    if (newVal[item.name]) {
                        item.amount = newVal[item.name];
                    }
                }
                this.allSpendings = Object.values(newVal).reduce((acc, value) => acc + value, 0);
            }
        }
    },

    mounted() {
        let checkInterval = setInterval(() => {
            if (this.$store.state.dashboardpage.playerData) {
                this.createChartSociety();
                clearInterval(checkInterval);
            }
        }, 1000);
        this.playerIDModal = "";
        this.playerIbanModal = "";
        this.sendAmount = "";
        this.fakeData = false;
        this.interactionCategory = "main";
        let newVal = this.$store.state.dashboardpage.playerData.spendigsdata;
        for (let item of this.spendingAnalyticsData) {
            if (newVal[item.name]) {
                item.amount = newVal[item.name];
            }
        }
        this.selectedsearchdata = false;
        this.allSpendings = Object.values(newVal).reduce((acc, value) => acc + value, 0);
    },
    beforeDestroy() {
        window.removeEventListener("message", this.eventHandler);
    }
};
