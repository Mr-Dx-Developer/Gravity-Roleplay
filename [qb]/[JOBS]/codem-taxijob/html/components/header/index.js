import importTemplate from "../../utils/importTemplate.js";

export default {
  template: await importTemplate("./components/header/index.html"),
  methods: {
    ...Vuex.mapMutations({
      setActivePage: "setActivePage",
    }),
  },
  computed: {
    ...Vuex.mapState({
      activePage: (state) => state.activePage,
      playerData: (state) => state.playerData,
      locales: (state) => state.locales,

    }),
  }
}