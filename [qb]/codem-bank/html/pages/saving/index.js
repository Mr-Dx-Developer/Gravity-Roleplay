import importTemplate from "../../js/util/importTemplate.js";

export default {
    template: await importTemplate("pages/saving/index.html"),

    components: {},
    data: () => ({
        fakeData: false,
        hoveredIndex: -1,
        wantLoanModal: false
    }),
    methods: {
        openLoanModal(data, index) {
            this.wantLoanModal = true;
            this.fakeData = data;
            this.hoveredIndex = index;
        },
        closeLoanModal() {
            this.wantLoanModal = false;
            this.fakeData = false;
            this.$store.state.savingpage.cancelSaving = false;
        },
        mouseOver(index) {
            this.hoveredIndex = index;
        },
        mouseLeave() {
            this.hoveredIndex = -1;
        },
        buySaving() {
            if (this.fakeData) {
                postNUI("buySaving", this.fakeData);
                this.wantLoanModal = false;
                this.fakeData = false;
                this.$store.state.savingpage.cancelSaving = false;
            }
        },
        cancelSaving() {
            postNUI("cancelSaving");
            this.wantLoanModal = false;
            this.fakeData = false;
            this.$store.state.savingpage.cancelSaving = false;
        }
    },

    computed: {},

    watch: {},

    mounted() {},
    beforeDestroy() {
        window.removeEventListener("message", this.eventHandler);
    }
};
