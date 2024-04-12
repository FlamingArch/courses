import IProduct from "../model/product";

class HTTPClient {
  async get(url: URL): Promise<IProduct[]> {
    try {
      const response = await fetch(url)
      try {
        const data: IProduct[] = await response.json()
        return data
      } catch {
        throw new Error("Error decoding data.")
      }
    } catch {
      throw new Error("Error fetching Data, is json-server running?")
    }
  }

  async getById(url: string, id: number): Promise<IProduct> {
    const response = await fetch(`${url}/${id}`)
    const data = await response.json()
    return <IProduct>data
  }

  async put(url: string, data: any): Promise<IProduct> {
    const response = await fetch(`${url}/${data.productId}`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
    })
    return await response.json()
  }
}
export default new HTTPClient()
