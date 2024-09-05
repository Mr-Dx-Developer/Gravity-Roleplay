import importTemplate from "../../utils/importTemplate.js";

export default {
  template: await importTemplate("./components/leaderboard/index.html"),
  data : () =>  ({
    leaderboard : {
      data : {}
    },
  }),
  methods : {
    
  },
  async mounted(){
    this.leaderboard = await postNUI('getLeaderboard')
  },
  computed : {
    
  }
}