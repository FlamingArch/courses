import React from 'react'
import { useParams } from "react-router-dom";
import IProduct from "../model/product";
import { useCallback } from "react";
import HttpClient from "../apiClient/httpClient";

export const ProductDetails: React.FC<any> = (): React.ReactElement => {
  const { id } = useParams<string>()
  const [products, setProducts] = React.useState<IProduct>({} as IProduct);

  const getProductById = useCallback(async () => {
    let response = await HttpClient.getById("https://localhost:3000", String(id))
    setProducts(response)
  }, [])

  React.useEffect(() => { getProductById() }, [])

  return <></>
}
