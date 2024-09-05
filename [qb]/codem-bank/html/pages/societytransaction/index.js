import importTemplate from "../../js/util/importTemplate.js";

export default {
    template: await importTemplate("pages/societytransaction/index.html"),

    components: {},
    data: () => ({
        transactionSwiperValue: false,
        searchbarValue: "",
        hoveredIndex: null,
        shortBox: false,
        oldData: false
    }),
    methods: {
        filternotificationdataAll() {
            this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata = this.oldData;
        },
        filternotificationdata(identifier) {
            this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata = false
            this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata = this.oldData 
            let data = this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata;
            let filteredData = data.filter(item => item.identifier == identifier);
            this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata = filteredData;
        },
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
                this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata.sort((a, b) => {
                    return this.parseCustomDate(b.date) - this.parseCustomDate(a.date);
                });
            } else {
                this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata.sort((a, b) => {
                    return this.parseCustomDate(a.date) - this.parseCustomDate(b.date);
                });
            }
        },

        parseCustomDate(str) {
            const [day, month, year, hour, minute] = str.split(/[/ :]/).map(Number);
            return new Date(year, month - 1, day, hour, minute);
        },
        transactionSwiper() {
            if (this.transactionSwiperValue) {
                this.transactionSwiperValue.destroy();
            }

            this.transactionSwiperValue = new Swiper("#mainswipertranscation", {
                slidesPerView: 9,
                loop: false,
                spaceBetween: 0,
                slidesPerGroup: 9

                // navigation: {
                //     nextEl: "#mainswiperleft",
                //     prevEl: "#mainswiperright"
                // }
            });
        }
    },

    computed: {
        filterByTermTransactionData() {
            if (this.searchbarValue.length > 0) {
                if (
                    !this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata ||
                    this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata.length <= 0
                ) {
                    return this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata;
                }
                return this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata.filter(name => {
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
                return this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata;
            }
        },
        reversedTransaction() {
            return this.filterByTermTransactionData.slice().reverse();
        }
    },

    watch: {},

    mounted() {
        this.oldData = this.$store.state.societydashboardpage.societyAccount.jobdata.notificationdata;
        setTimeout(() => {
            this.transactionSwiper();
        }, 100);
    },
    beforeDestroy() {
        window.removeEventListener("message", this.eventHandler);
    }
};
