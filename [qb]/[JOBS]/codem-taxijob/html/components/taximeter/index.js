import importTemplate from "../../utils/importTemplate.js";

export default {
  template: await importTemplate("./components/taximeter/index.html"),
  data: () => ({
    taximeter: {
      header: 'Dowtown Cab Area',
      fare: 0,
      playerMode: false,
      enabled: false,
      customerInVeh: false,
      npcDriveChoice: false,
      vehicleHealth: 0,
      time: 0,
      billPlayer : false,
      billPlayers : [],

    }
  }),
  methods: {
    setTaxiMeterData(payload) {
      this.taximeter[payload.key] = payload.value
    },
    eventHandler(event) {
      switch (event.data.action) {
        case "setTaxiMeterData":
          this.setTaxiMeterData({
            key: event.data.payload.key,
            value: event.data.payload.value,
          })
          break

        default:
          break
      }
    }
  },
  computed: {
    ...Vuex.mapState({
      locales: (state) => state.locales,
    }),
    timer() {
      let totalSeconds = this.taximeter.time;
      totalSeconds %= 3600;
      let minutes = Math.floor(totalSeconds / 60);
      let seconds = totalSeconds % 60;
      return `${minutes}:${seconds}`
    }
  },
  mounted() {
    window.addEventListener("message", this.eventHandler);
  },
  beforeDestroy() {
    window.removeEventListener("message", this.eventHandler);

  }
}