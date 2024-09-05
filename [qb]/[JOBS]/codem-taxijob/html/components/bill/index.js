import importTemplate from "../../utils/importTemplate.js";

export default {
  template: await importTemplate("./components/bill/index.html"),
  data: () => ({
    showBill: false,
    billData: {
      passengers: 0,
      amount: 0,
      billOwner: '',
      date: 0,
    },

  }),
  methods: {
    payBill(){
      this.showBill = false
      postNUI("payBill", this.billData);
    },
    secondsToDate(seconds) {
      const date = new Date(null);
      date.setSeconds(seconds); // specify value for SECONDS here
      let day = date.getDate() + 1;
      let month = date.getMonth() + 1;

      if (day < 10) {
        day = "0" + day;
      }
      if (month < 10) {
        month = "0" + month;
      }

      return `${day}.${month}.${date.getFullYear()}`;
    },
    eventHandler(event) {
      switch (event.data.action) {
        case "ShowBill":
          this.showBill = true
          this.billData = event.data.payload
          break;
        default:
          break
      }
    }
  },
  computed: {
    totalAmount(){
      return this.billData.amount + this.cabFee + this.tax
    },
    ...Vuex.mapState({
      cabFee: (state) => state.cabFee,
      tax: (state) => state.tax,
      locales: (state) => state.locales,

    }),
  },
  mounted() {
    window.addEventListener("message", this.eventHandler);
  },
  beforeDestroy() {
    window.removeEventListener("message", this.eventHandler);

  }
}