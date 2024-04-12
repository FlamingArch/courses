export type NewProductData = {
  productName: string
  price: number
  starRating: number
  productId: number
}

export type ProductData = {
  productName: string,
  price: number,
  starRating: number,
  productId: number
  productCode: string
  productAvailable: string
  imageUrl: string
}

export type ExportProductData = {
  productId: number
}

export interface IProduct {
  productName: string,
  price: number,
  starRating: number,
  productId: number
  productCode: string
  productAvailable: string
  imageUrl: string
}
