import { FieldError, useForm } from "react-hook-form"
import { IProduct, NewProductData } from "../types"
import { ValidationError } from "../components/validationError"
import HttpClient from "../handler"

import { useCallback, useEffect, useState } from "react"
import { useParams } from "react-router-dom"
import Rating from "../components/rating"

type Props = {
  onSave: (newProduct: NewProductData) => void
}

export default function PageEdit({ onSave }: Props) {
  const { register, getValues, setValue, handleSubmit, formState: { errors, isSubmitting, isSubmitSuccessful } } = useForm<NewProductData>()
  const [product, setProduct] = useState<IProduct>({} as IProduct) //{} initializing with an empty oject

  const { id } = useParams<string>()// react hook that will help us to read path parameter... it will give the id

  const getProductById = useCallback(async (id: string, completion: (response: IProduct) => void) => {
    const url = `http://localhost:3000/products`
    const response = await HttpClient.getById(url, id) //converting id to number
    completion(response as IProduct)
  }, [])

  useEffect(() => {
    id
      ? getProductById(id, setProduct)
      : console.log("Invalid ID")
  }, [])


  useEffect(() => {
    if (product) {
      setValue("productName", product.productName)
      setValue("price", product.price)
      setValue("starRating", product.starRating)
    } else {
      console.log("No Product Found")
    }
  }, [product])

  const fieldStyle = `flex flex-col mb-2`

  function getEditorStyle(fieldError: FieldError | undefined): string {
    return fieldError ? 'border-red-500' : ''
  }

  return (
    <form noValidate className="border-b p-4" onSubmit={handleSubmit(onSave)}>
      <div className={fieldStyle}>
        <div className="mb-3">
          <label htmlFor="basic-url" className="form-label">Name</label>
          <div className="input-group mb-3">
            <input
              type="text"
              aria-label="Amount (to the nearest dollar)"
              id="productName"
              // value={name}
              className={`${getEditorStyle(errors.productName)} form-control`}
              {...register('productName', { required: "You must register a Product Name" })}
            />
          </div>
        </div>
        <ValidationError fieldError={errors.starRating} />
      </div>


      <div className={fieldStyle}>
        <div className="mb-3">
          <label htmlFor="basic-url" className="form-label">Price</label>
          <div className="input-group mb-3">
            <span className="input-group-text">₹</span>
            <input
              type="text"
              aria-label="Amount (to the nearest dollar)"
              id="price"
              // value={price}
              className={`${getEditorStyle(errors.price)} form-control`}
              {...register('price', { required: "You must register a Product price" })}
            />
            <span className="input-group-text">INR</span>
          </div>
        </div>
        <ValidationError fieldError={errors.price} />
      </div>

      <div className={fieldStyle}>
        <div className="mb-3">
          <label htmlFor="basic-url" className="form-label">Star Rating</label>
          <div className="input-group mb-3">
            <input
              type="text"
              aria-label="Amount (to the nearest dollar)"
              id="starRating"
              // value={starRating}
              className={`${getEditorStyle(errors.starRating)} form-control`}
              {...register('starRating', { required: "You must register a Product Name" })}
            />
            <span className="input-group-text"><Rating rating={getValues("starRating")} /></span>
          </div>
        </div>
        <ValidationError fieldError={errors.starRating} />
      </div>

      <input type="submit" className="btn btn-primary" />
    </form >
  )
}
