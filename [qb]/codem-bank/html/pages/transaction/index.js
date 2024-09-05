import importTemplate from "../../js/util/importTemplate.js";

export default {
    template: await importTemplate("pages/transaction/index.html"),

    components: {},
    data: () => ({
        searchbarValue: "",
        hoveredIndex: null,
        shortBox: false
    }),
    methods: {
        openShortBox() {
            this.shortBox = !this.shortBox;
        },
        mouseOver(index) {
            this.hoveredIndex = index;
        },
        mouseLeave() {
            this.hoveredIndex = -1;
        },
        sortData(val) {
            if (val == "latest") {
                this.$store.state.dashboardpage.playerData.notificationdata.sort((a, b) => {
                    return this.parseCustomDate(b.date) - this.parseCustomDate(a.date);
                });
            } else {
                this.$store.state.dashboardpage.playerData.notificationdata.sort((a, b) => {
                    return this.parseCustomDate(a.date) - this.parseCustomDate(b.date);
                });
            }
        },

        parseCustomDate(str) {
            const [day, month, year, hour, minute] = str.split(/[/ :]/).map(Number);
            return new Date(year, month - 1, day, hour, minute);
        }
    },
    watch: {},
    computed: {
        filterByTermTransactionData() {
            if (this.searchbarValue.length > 0) {
                if (
                    !this.$store.state.dashboardpage.playerData.notificationdata ||
                    this.$store.state.dashboardpage.playerData.notificationdata.length <= 0
                ) {
                    return this.$store.state.dashboardpage.playerData.notificationdata;
                }
                return this.$store.state.dashboardpage.playerData.notificationdata.filter(name => {
                    return (
                        String(name.to).toLowerCase().includes(this.searchbarValue.toLowerCase()) ||
                        String(name.from).toLowerCase().includes(this.searchbarValue.toLowerCase()) ||
                        String(name.label).toLowerCase().includes(this.searchbarValue.toLowerCase()) ||
                        String(name.type).toLowerCase().includes(this.searchbarValue.toLowerCase()) ||
                        String(name.date).toLowerCase().includes(this.searchbarValue.toLowerCase()) ||
                        String(name.amount).toLowerCase().includes(this.searchbarValue.toLowerCase())
                    );
                });
            } else {
                return this.$store.state.dashboardpage.playerData.notificationdata;
            }
        },
        reversedTransaction() {
            return this.filterByTermTransactionData.slice().reverse();
        }
    },

    mounted() {
        (this.searchbarValue = ""), (this.hoveredIndex = null), (this.shortBox = false);
    },
    beforeDestroy() {
        window.removeEventListener("message", this.eventHandler);
    }
};
