import importTemplate from "../../utils/importTemplate.js";

export default {
  template: await importTemplate("./components/vip/index.html"),
  data: () => ({

  }),
  computed: {
    ...Vuex.mapState({
      vipMissions: (state) => state.vipMissions,
      playerData: (state) => state.playerData,
      selectedVehicleRealIndex: (state) => state.selectedVehicleRealIndex,
      locales: (state) => state.locales,

    }),

  },
  methods: {

    ...Vuex.mapMutations({
      setSelectedMission: "setSelectedMission",
      createNotification: "createNotification",
    }),
    getRemainHours(seconds) {
      if (seconds) {

        const date2 = new Date(seconds * 1000);
        const date1 = new Date();
        var diff = date2.valueOf() - date1.valueOf();
        var diffInHours = diff / 1000 / 60 / 60; // Convert milliseconds to hours
        return diffInHours?.toFixed(0);
      } else {
        return false
      }
    },
    startVip(mission) {
      if (this.selectedVehicleRealIndex == 'false') {
        postNUI('notify', this.locales.select_vehicle)
        return
      }
      postNUI('startVip', {
        selectedVehicle: this.selectedVehicleRealIndex,
        selectedMission: mission,
      })
    },
    missionBG(image) {
      return {
        backgroundImage: `url(./assets/images/${image})`
      }
    }
  }
}