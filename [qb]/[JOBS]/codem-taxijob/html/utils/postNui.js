let resourceName = "codem-minerjob";
if (window.GetParentResourceName) {
  resourceName = window.GetParentResourceName();
}

window.postNUI = async (name, data) => {
  try {
    const response = await fetch(`https://${resourceName}/${name}`, {
      method: "POST",
      mode: "cors",
      cache: "no-cache",
      credentials: "same-origin",
      headers: {
        "Content-Type": "application/json",
      },
      redirect: "follow",
      referrerPolicy: "no-referrer",
      body: JSON.stringify(data),
    });
    return !response.ok ? null : response.json();
  } catch (error) {
    // console.log(error)
  }
};
