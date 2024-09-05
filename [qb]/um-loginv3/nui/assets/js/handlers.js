let count = 0;
let thisCount = 0;

const handlers = {
    startInitFunctionOrder(data) {
        count = data.count;
    },

    initFunctionInvoking(data) {
        document.querySelector(".loadingbar").style.left = "0%";
        document.querySelector(".loadingbar").style.width = (data.idx / count) * 100 + "%";
    },

    startDataFileEntries(data) {
        count = data.count;
    },

    performMapLoadFunction(data) {
        ++thisCount;

        document.querySelector(".loadingbar").style.left = "0%";
        document.querySelector(".loadingbar").style.width = (thisCount / count) * 100 + "%";
    },
};

export default handlers;