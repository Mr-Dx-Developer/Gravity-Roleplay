export const fetchData = async (url) => {
    const request = await fetch(url);
    if (!request.ok) throw new Error(`um-loginv3 | not found api status: ${request.status}`);

    const data = await request.json();

    if (data.code == 10013) throw new Error(`um-loginv3 | Discord ID not found!`);
    return data;
};
