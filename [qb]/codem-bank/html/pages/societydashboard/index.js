import importTemplate from "../../js/util/importTemplate.js";

export default {
    template: await importTemplate("pages/societydashboard/index.html"),

    components: {},
    data: () => ({
        spendingChartSociety: false,

        interactionCategory: "main", // main  | withdraw | deposit
        categoryButtonData: [],

        withdrawOption: [{ amount: 10 }, { amount: 100 }, { amount: 1000 }, { amount: 10000 }, { amount: 100000 }, { amount: 1000000 }],
        depositOption: [{ amount: 10 }, { amount: 10000 }, { amount: 1000 }, { amount: 10000 }, { amount: 100000 }, { amount: 1000000 }],
        searchPlayerValue: "",
        currentPage: "", // sendrequest | awaiting | main
        searchPlayerResult: false,
        sendAmount: "",

        societymemberspage: "societymembers",
        isLocked: false
    }),
    methods: {
        kickSocietyPlayer(data) {
            postNUI("kickSocietyPlayer", data);
        },
        societyAcceptRequestData(value, data) {
            if (value == "accept") {
                postNUI("societyAcceptRequestData", data);
            }
            if (value == "decline") {
                postNUI("societyDeclineRequestData", data);
            }
        },

        sendRequestJob() {
            postNUI("sendRequestJob");
        },

        withdrawMoney() {
            if (this.sendAmount == "" || this.sendAmount <= 0) {
                return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["PLEASEENTERAVALIDAMOUNT"]);
            }
            postNUI("withdrawMoneySociety", { amount: this.sendAmount });
        },
        depositMoney() {
            if (this.sendAmount == "" || this.sendAmount <= 0) {
                return this.$store.dispatch("notification", this.$store.state.dashboardpage.locales["PLEASEENTERAVALIDAMOUNT"]);
            }
            postNUI("depositMoneySociety", { amount: this.sendAmount });
        },
        withdrawOptionClick(value) {
            postNUI("withdrawMoneySociety", { amount: value });
        },
        depositOptionClick(value) {
            postNUI("depositMoneySociety", { amount: value });
        },
        numpadClick(value) {
            if (value == 11) {
                value = 0;
            }
            this.sendAmount += value;
        },
        checkInput() {
            this.sendAmount = this.sendAmount.replace(/[^0-9]/g, "");
        },
        formatIbanNumber(jobname) {
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

        changeSocietyMembersPage(page) {
            this.societymemberspage = page;
        },

        changeInteractionCategory(category) {
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

        createChartSocietyJob() {
            const canvas = document.getElementById("myChartSocietyJob");
            if (canvas) {
                const ctx = canvas.getContext("2d");
                if (ctx) {
                    Chart.defaults.color = "#646365";
                    Chart.defaults.fontFamily = "gilroybold";
                    this.spendingChartSociety = new Chart(ctx, {
                        type: "line",

                        data: {
                            labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],

                            datasets: [
                                {
                                    label: "$",

                                    data: [
                                        this.$store.state.societydashboardpage.societyAccount.jobdata.spenddata.mon || 0,
                                        this.$store.state.societydashboardpage.societyAccount.jobdata.spenddata.tue || 0,
                                        this.$store.state.societydashboardpage.societyAccount.jobdata.spenddata.wed || 0,
                                        this.$store.state.societydashboardpage.societyAccount.jobdata.spenddata.thu || 0,
                                        this.$store.state.societydashboardpage.societyAccount.jobdata.spenddata.fri || 0,
                                        this.$store.state.societydashboardpage.societyAccount.jobdata.spenddata.sat || 0,
                                        this.$store.state.societydashboardpage.societyAccount.jobdata.spenddata.sun || 0
                                    ],
                                    borderWidth: 3,
                                    barThickness: 20,
                                    borderColor: "#C6B4FB",
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
                            hoverBackgroundColor: "#C6B4FB",
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
                }
            }
        }
    },

    computed: {
        ...Vuex.mapState({
            updateSocietyRequestData: state => state.updateSocietyRequestData,
            updateSocietyPlayersData: state => state.updateSocietyPlayersData,
            updateSocietyFirstAllData: state => state.updateSocietyFirstAllData,
            updateSocietySpendData: state => state.updateSocietySpendData,
            updateSocietyContributionData: state => state.updateSocietyContributionData
        })
    },

    watch: {
        async updateSocietySpendData(newValue, oldValue) {
            if (this.isLocked) return;

            if (newValue) {
                this.isLocked = true;
                if (this.spendingChartSociety) this.spendingChartSociety.destroy();

                await this.$nextTick();

                setTimeout(() => {
                    this.$store.state.societydashboardpage.societyAccount.jobdata.spenddata = newValue;
                    this.createChartSocietyJob();
                    this.isLocked = false;
                }, 500);
            }
        },
        updateSocietyRequestData(newValue, oldValue) {
            if (newValue) {
                this.$store.state.societydashboardpage.societyAccount.jobdata.requestdata = newValue;
            }
        },
        updateSocietyPlayersData(newValue, oldValue) {
            if (newValue) {
                this.$store.state.societydashboardpage.societyAccount.jobdata.playersdata = newValue;
            }
        },
        updateSocietyFirstAllData(newValue, oldValue) {
            if (newValue) {
                this.$store.state.societydashboardpage.societyAccount.jobdata = newValue;

                setTimeout(() => {
                    this.$store.state.societydashboardpage.societyAccount.jobdata.spenddata = newValue;

                    if (this.$store.state.societydashboardpage.societyAccount.jobdata.spenddata) {
                        this.createChartSocietyJob();
                    }
                }, 100);
            }
        },

        updateSocietyContributionData(newValue, oldValue) {
            if (newValue) {
                this.$store.state.societydashboardpage.societyAccount.jobdata.contributiondata = newValue;
            }
        }
    },

    mounted() {
        this.createChartSocietyJob();

        this.sendAmount = "";
        this.societymemberspage = "societymembers";
    },
    beforeDestroy() {
        window.removeEventListener("message", this.eventHandler);
    }
};
