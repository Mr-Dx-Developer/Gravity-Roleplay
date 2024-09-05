import importTemplate from "../../utils/importTemplate.js";

export default {
  template: await importTemplate("./components/mainpage/index.html"),
  data : () =>  ({
 
  }),

  methods : {
    ...Vuex.mapMutations({
      setSelectedMission: "setSelectedMission",
      setSelectedVehicleIndex: "setSelectedVehicleIndex",
      setSelectedVehicleRealIndex: "setSelectedVehicleRealIndex",
      setSelectedMissionRealIndex: "setSelectedMissionRealIndex",
      createNotification : "createNotification",

    }),
    selectMission(payload, level){
      if(this.playerData.level >= level){
        this.setSelectedMission(payload)
      }else{
        postNUI('notify', this.locales.not_enough_level)

      }
    },
    start(){
      if(this.selectedVehicleRealIndex == 'false' || this.selectedMissionRealIndex == 'false'){
        return
      }
      postNUI('start', {
        selectedVehicle : this.selectedVehicleRealIndex,
        selectedMission : this.selectedMissionRealIndex,
      })
    },
    stop(){
      postNUI('stop')
    },
    setVehicleRealIndex(){
      if(this.playerData.level >= this.vehicles[this.selectedVehicleIndex].level){
        this.setSelectedVehicleRealIndex(this.selectedVehicleIndex)
      } else{
        postNUI('notify', this.locales.not_enough_level)
      }
    },
    setMissionRealIndex(){
      if(this.playerData.level >= this.missions[this.selectedMission].level){
          this.setSelectedMissionRealIndex(this.selectedMission)
      } else{
        postNUI('notify', this.locales.not_enough_level)
      }
    },
    selectNextVehicle() {
      this.setSelectedVehicleIndex(this.selectedVehicleIndex + 1)
      if (this.selectedVehicleIndex >= this.vehicles.length) {
        this.setSelectedVehicleIndex(0)
      }
    },
    selectPrevVehicle() {
      this.setSelectedVehicleIndex(this.selectedVehicleIndex - 1)
      if (this.selectedVehicleIndex < 0) {
        this.setSelectedVehicleIndex(this.vehicles.length - 1)
      }
    },
  },
  computed : {
    ...Vuex.mapState({
      vehicles: (state) => state.vehicles,
      missions: (state) => state.missions,
      playerData : (state) => state.playerData,
      selectedMission: (state) => state.selectedMission,
      selectedVehicleIndex: (state) => state.selectedVehicleIndex,
      selectedVehicleRealIndex: (state) => state.selectedVehicleRealIndex,
      selectedMissionRealIndex: (state) => state.selectedMissionRealIndex,
      missionActive: (state) => state.missionActive,
      vipMissionActive: (state) => state.vipMissionActive,
      locales: (state) => state.locales,
    }),
    getDailyMissionRemainHours() {
      const date2 = new Date(this.playerData?.dailymissions?.resetAt * 1000);
      const date1 = new Date();
      var diff = date2.valueOf() - date1.valueOf();
      var diffInHours = diff / 1000 / 60 / 60; // Convert milliseconds to hours
      return diffInHours?.toFixed(0);
    },
    getMissionBG(){
      return {
        backgroundImage : `url(./assets/images/${this.missions?.[this.selectedMission]?.bg})`
      }
    },

  }
}