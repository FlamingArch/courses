export type ProductData={ //instead of interface we use type keyword in modern typescript
    productName:string
    price:number
    starRating:number
    productId:number
    productCode:string
    productAvailable:string
    imageUrl: string
}

export type NewProductData={
    productName:string
    price:number
    starRating:number
    productId:number
    productCode:string
    productAvailable:string
    imageUrl: string
}

export type SavedProductsData={
    productId:number
}