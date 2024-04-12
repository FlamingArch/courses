import IProduct from "../model/product";

class HttpClient {
  async get(url: string): Promise<IProduct[]> { //here <IProduct[]> is called generics, here promise returns of type IProduct[]
    const response = await fetch(url)
    const data = await response.json() //json will return a promise so we are using await again
    return <IProduct[]>data  //typecasting data     //fetch is a global function
  }
  async getById(url: string, id: number): Promise<IProduct> {
    const response = await fetch(`${url}/${id}`)
    const data = await response.json()
    return <IProduct>data
  }
  async put(url: string, data: any): Promise<IProduct[]> {
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

export default new HttpClient() //exporting object of type HttpClient
