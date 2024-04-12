import IProduct from "../models/product";

class HttpClient {
    async get(url: string): Promise<IProduct[]> {
        const response = await fetch(url)
        const data = await response.json();
        return <IProduct[]>data;
    }
    async getById(url: string, id: string): Promise<IProduct> {
        const intID = parseInt(id);
        const response = await fetch(`${url}/${intID}`)
        const data = await response.json();
        return <IProduct>data;
    }
    async put(url: string, data: any): Promise<IProduct> {
        const response = await fetch(`${url}/${data.productid}`, {
            method: 'PUT',
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(data)
        })
        return await response.json();
    }
}
export default new HttpClient();
