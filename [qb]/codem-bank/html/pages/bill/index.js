import importTemplate from "../../js/util/importTemplate.js";

export default {
    template: await importTemplate("pages/bill/index.html"),

    components: {},
    data: () => ({
        showTooltip: null,
        animationTable: {
            blueborder: false,
            whitebackground: false,
            paidText: false
        },
        paybutton: false,
        shortBox: false,
        billDeatils: false,
        searchbarValue: ""
    }),
    methods: {
        openShortBox() {
            this.shortBox = !this.shortBox;
        },
        sortData(val) {
            if (val == "latest") {
                this.$store.state.billpage.billdata.sort((a, b) => {
                    return new Date(b.date) - new Date(a.date);
                });
            } else {
                this.$store.state.billpage.billdata.sort((a, b) => {
                    return new Date(a.date) - new Date(b.date);
                });
            }
        },

        closePayModal() {
            this.billDeatils = false;
            this.paybutton = false;
            this.animationTable.blueborder = false;
            this.animationTable.whitebackground = false;
            this.animationTable.paidText = false;
        },
        showBill(data) {
            this.billDeatils = data;
        },
        async payBill() {
            if (this.billDeatils.id) {
                let result = await postNUI("payBill", { id: this.billDeatils.id, amount: this.billDeatils.amount, tax: this.billDeatils.tax });
                if (result) {
                    this.paybutton = true;
                    this.animationTable.blueborder = true;
                    this.animationTable.whitebackground = true;
                    this.animationTable.paidText = true;
                    setTimeout(() => {
                        this.billDeatils = false;
                        this.paybutton = false;
                        this.animationTable.blueborder = false;
                        this.animationTable.whitebackground = false;
                        this.animationTable.paidText = false;
                    }, 500);
                    this.$store.state.billpage.billdata = result;
                } else {
                    console.log("fatura ödenemedi.");
                }
            } else {
                console.log("fatura id sine ulaşılamadı.");
            }
        }
    },

    computed: {
        filterByTermTransactionData() {
            if (this.searchbarValue.length > 0) {
                if (!this.$store.state.billpage.billdata || this.$store.state.billpage.billdata.length <= 0) {
                    return this.$store.state.billpage.billdata;
                }
                return this.$store.state.billpage.billdata.filter(name => {
                    return (
                        String(name.name).toLowerCase().includes(this.searchbarValue.toLowerCase()) ||
                        String(name.targetname).toLowerCase().includes(this.searchbarValue.toLowerCase()) ||
                        String(name.label).toLowerCase().includes(this.searchbarValue.toLowerCase()) ||
                        String(name.invoicelabel).toLowerCase().includes(this.searchbarValue.toLowerCase()) ||
                        String(name.date).toLowerCase().includes(this.searchbarValue.toLowerCase()) ||
                        String(name.amount).toLowerCase().includes(this.searchbarValue.toLowerCase())
                    );
                });
            } else {
                return this.$store.state.billpage.billdata;
            }
        }
    },

    watch: {},

    mounted() {
        (this.shortBox = false), (this.billDeatils = false), (this.searchbarValue = "");
    },
    beforeDestroy() {
        window.removeEventListener("message", this.eventHandler);
    }
};
