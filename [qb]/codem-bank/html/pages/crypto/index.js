import importTemplate from "../../js/util/importTemplate.js";

export default {
    template: await importTemplate("pages/crypto/index.html"),

    components: {},
    data: () => ({
        bitcoinValue: 1,

        requiredBuyBitcoin: {
            ADA: 100,
            BTC: 1,
            ETH: 50,
            XRP: 100,
            BNB: 1,
            USDC: 50,
            SOL: 5,
            DOGE: 250
        },

        fakeData: {},
        hoveredIndex: -1,
        wantLoanModal: false
    }),
    methods: {
        bitcoinValueFunc(val) {
            this.bitcoinValue = parseInt(this.bitcoinValue, 10);

            if (val == "+") {
                this.bitcoinValue += 1;
            } else if (val == "-") {
                if (this.bitcoinValue > 1) {
                    this.bitcoinValue -= 1;
                }
            }
        },
        checkInput() {
            this.bitcoinValue = this.bitcoinValue.replace(/[^0-9]/g, "");
        },
        buyBitcoin() {
            if (this.fakeData) {
                this.fakeData.bitconAmount = this.bitcoinValue;
                let amount = this.requiredBuyBitcoin[this.fakeData.requestname];
                if (this.bitcoinValue < amount) {
                    this.$store.dispatch("notification", this.$store.state.dashboardpage.locales['MINIMUMAMOUNTYOU'] + amount + " " + this.fakeData.requestname + "");
                    return;
                }
                if (this.bitcoinValue > 1000) {
                    this.$store.dispatch("notification", this.$store.state.dashboardpage.locales['YOUCANGETAMAXIMUMOF1000']);
                } else {
                    postNUI("buyBitcoin", { data: this.fakeData });
                }
            }
        },
        openLoanModal(data, index) {
            this.wantLoanModal = true;
            this.fakeData = data;
            this.hoveredIndex = index;
        },
        closeLoanModal() {
            this.wantLoanModal = false;
            this.fakeData = {};
            this.bitcoinValue = 1;
        },
        mouseOver(index) {
            this.hoveredIndex = index;
        },
        mouseLeave() {
            this.hoveredIndex = -1;
        }
    },

    computed: {},

    watch: {},

    mounted() {
        for (let key in this.$store.state.cryptopage.cryptodata) {
            fetch(`https://min-api.cryptocompare.com/data/price?fsym=${this.$store.state.cryptopage.cryptodata[key].requestname}&tsyms=USD`)
                .then(response => response.json())
                .then(data => {
                    const coinValue = data.USD;

                    this.$store.state.cryptopage.cryptodata[key].value = coinValue;
                })
                .catch(error => {
                    this.$store.state.cryptopage.cryptodata[key].value = "ERROR";
                });
        }
    },
    beforeDestroy() {
        window.removeEventListener("message", this.eventHandler);
    }
};
