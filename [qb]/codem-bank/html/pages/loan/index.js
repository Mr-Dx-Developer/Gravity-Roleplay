import importTemplate from "../../js/util/importTemplate.js";

export default {
    template: await importTemplate("pages/loan/index.html"),

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
        },
        mouseOver(index) {
            this.hoveredIndex = index;
        },
        mouseLeave() {
            this.hoveredIndex = -1;
        },
        buyLoan() {
            postNUI("buyLoan", {
                data: this.fakeData
            });
            this.closeLoanModal();
        }
    },

    computed: {},

    watch: {},

    mounted() {},
    beforeDestroy() {
        window.removeEventListener("message", this.eventHandler);
    }
};
