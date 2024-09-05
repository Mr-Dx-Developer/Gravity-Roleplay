import importTemplate from "../../js/util/importTemplate.js";

export default {
    template: await importTemplate("pages/profile/index.html"),

    components: {},
    data: () => ({
        leavejob: false,
        openChangePin: false,
        passwordText: ""
    }),
    methods: {
        changePin() {
            if (this.passwordText.length == 4) {
                postNUI("changePin", { pin: this.passwordText });
                this.passwordText = "";
                this.openChangePin = false;
            }
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
        isEntered(index) {
            return index <= this.passwordText.length;
        },
        changeATMpinModal(val) {
            this.openChangePin = val;
        },
        okayRequest(data) {
            if (data) {
                postNUI("sendMoneyToPlayerIBAN", { playerIBAN: data.iban, amount: data.amount });
            }
        },
        rejectRequest(data) {
            if (data) {
                postNUI("rejectMoneyRequest", { playerIBAN: data.iban, amount: data.amount });
            }
        },
        clearAllPushNotification() {
            postNUI("clearAllPushNotification");
            this.$store.state.dashboardpage.playerData.pushnotificationdata = [];
        },
        leaveMyJob() {
            postNUI("leaveMyJob");
            this.leavejob = false;
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
        closeleavemodal(val) {
            this.leavejob = val;
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
        }
    },

    computed: {
        formattediBanNumber() {
            if (!this.$store.state.dashboardpage.playerData.profiledata.iban) return;
            const ibanNumber = this.$store.state.dashboardpage.playerData.profiledata.iban;
            return this.formatIbanNumber(ibanNumber);
        },
        formattediBanNumberJob() {
            if (!this.$store.state.dashboardpage.myJob) return;
            const ibanNumber = this.$store.state.dashboardpage.myJob;
            return this.formatIbanNumberJob(ibanNumber);
        },
        getProfileIncome() {
            let totalamount = 0;
            for (let key in this.$store.state.dashboardpage.playerData.notificationdata) {
                let type = this.$store.state.dashboardpage.playerData.notificationdata[key].type;
                if (type == "+") {
                    totalamount += this.$store.state.dashboardpage.playerData.notificationdata[key].amount;
                }
            }
            return totalamount;
        },
        getProfileExpense() {
            let totalamount = 0;
            for (let key in this.$store.state.dashboardpage.playerData.notificationdata) {
                let type = this.$store.state.dashboardpage.playerData.notificationdata[key].type;
                if (type == "-") {
                    totalamount += this.$store.state.dashboardpage.playerData.notificationdata[key].amount;
                }
            }
            return totalamount;
        }
    },

    watch: {},

    mounted() {},
    beforeDestroy() {
        window.removeEventListener("message", this.eventHandler);
    }
};
