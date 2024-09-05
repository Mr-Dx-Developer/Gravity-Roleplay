import topheader from "./components/header/index.js";
import mainpage from "./components/mainpage/index.js";
import vip from "./components/vip/index.js";
import leaderboard from "./components/leaderboard/index.js";
import profile from "./components/profile/index.js";
import taximeter from "./components/taximeter/index.js";
import bill from "./components/bill/index.js";



const store = Vuex.createStore({
    state: {
        activePage: 'mainpage',
        playerData: {},
        notifications: [],
        missions: [],
        vehicles: [],
        xp: {},
        cabFee: 10,
        tax: 10,
        vipMissions:[],
        selectedMission : 0,
        selectedVehicleIndex : 0,
        selectedVehicleRealIndex : "false",
        selectedMissionRealIndex : "false",
        missionActive: false,
        vipMissionActive:false,
        locales : {},
    },
    mutations: {
        setLocales(state, payload){
            state.locales = payload
        },
        setMissionsActive(state, payload){
            state.missionActive = payload.missionActive
            state.vipMissionActive = payload.vipMissionActive
        },
        setSelectedMission(state, payload){
            state.selectedMission = payload
        },
        setSelectedVehicleIndex(state, payload){
            state.selectedVehicleIndex = payload
        },
        setSelectedVehicleRealIndex(state, payload){
            state.selectedVehicleRealIndex = payload
        },
        setSelectedMissionRealIndex(state, payload){
            state.selectedMissionRealIndex = payload
        },
        setCabFee(state, payload) {
            state.cabFee = payload
        },
        setTaxFee(state, payload) {
            state.tax = payload
        },
        setXP(state, payload) {
            state.xp = payload
        },
        setMissions(state, payload) {
            state.missions = payload
        },
        setVipMissions(state, payload) {
            state.vipMissions = payload
        },
        setVehicles(state, payload) {
            state.vehicles = payload
        },
        createNotification(state, payload) {
            state.notifications.push(payload);
            setTimeout(() => {
                state.notifications.splice(0, 1);
            }, 3000);
        },
        setPlayerData(state, payload) {
            state.playerData[payload.key] = payload.value
        },
        setActivePage(state, payload) {
            state.activePage = payload
        }
    },
})

const app = Vue.createApp({
    data: () => ({
        menuOpen: false,
        taxiMeterOpen: false,
    }),
    components: {
        topheader,
        mainpage,
        vip,
        leaderboard,
        profile,
        taximeter,
        bill
    },
    methods: {

        ...Vuex.mapMutations({
            setPlayerData: "setPlayerData",
            createNotification: "createNotification",
            setMissions: "setMissions",
            setVehicles: "setVehicles",
            setXP: "setXP",
            setCabFee: "setCabFee",
            setVipMissions: "setVipMissions",
            setTaxFee: "setTaxFee",
            setMissionsActive: "setMissionsActive",
            setLocales: "setLocales",
        }),
        eventHandler(event) {
            switch (event.data.action) {
                case "checknui":
                    postNUI('ready')
                    break
                case "setMissionsActive":
                    this.setMissionsActive(event.data.payload)
                    break   
                case "setTaxFee":
                    this.setTaxFee(event.data.payload)
                    break
                case "setLocales":
                    this.setLocales(event.data.payload)
                    break
                case "setCabFee":
                    this.setCabFee(event.data.payload)
                    break
                case "setXP":
                    this.setXP(event.data.payload)
                    break
                case "SyncPlayerDataByKey":
                    this.setPlayerData({
                        key: event.data.payload.key,
                        value: event.data.payload.value,
                    })
                    break
                case "openmenu":
                    this.menuOpen = true
                    break
                case "setMissions":
                    this.setMissions(event.data.payload)
                    break
                case "setVipMissions":
                    this.setVipMissions(event.data.payload)
                    break
                case "setVehicles":
                    this.setVehicles(event.data.payload)
                    break
                case "openTaxiMeter":
                    this.taxiMeterOpen = true
                    break
                case "closeTaxiMeter":
                    this.taxiMeterOpen = false
                    break
                case "close":
                    this.close()
                    break
                case "notify":
                    this.createNotification(event.data.payload)
                    break
                default:
                    break
            }
        },
        keyHandler(e) {
            if (e.which == 27) {
                this.close()
            }
        },
        close() {
            this.menuOpen = false
            postNUI("close");
        }
    },
    computed: {
        ...Vuex.mapState({
            activePage: (state) => state.activePage,
            notifications: (state) => state.notifications,

        }),
        notificationPosition() {
            if (this.menuOpen) {
                return {
                    left: '1rem',
                    bottom: '1rem',
                }
            } else {
                return {
                    top: '1rem',
                    left: '50%',
                    transform: 'translateX(-50%)'
                }
            }
        }
    },
    mounted() {
        window.addEventListener("keyup", this.keyHandler);
        window.addEventListener("message", this.eventHandler);

    },

})

app.use(store).mount("#app");
