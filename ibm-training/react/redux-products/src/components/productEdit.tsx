import { FC, useCallback, useEffect, useState } from "react";
import { FieldError, useForm } from 'react-hook-form'
import { NewProductData } from "./types";
import { ValidationError } from "./validationError"
import { useNavigate, useParams } from "react-router-dom";
import IProduct from "../model/product";
import httpClient from "../apiClient/httpClient";

type Props = {
    onSave: (newProduct: NewProductData) => void
}




//we are using react-hook-form because it eases our validations, validations are done asynchronously and it reacts to state changes


export const ProductEdit: FC<any> = ({ onSave }: Props) => {
    const getProductById = useCallback(async () => {
        const response = await httpClient.getById('http://localhost:3000/products', Number(id))
        setProduct(response)
    }, [])
    useEffect(() => { getProductById() }, [])
    const navigator = useNavigate()
    const { id } = useParams<string>()
    const [product, setProduct] = useState<IProduct>({} as IProduct)
    const { register, setValue, handleSubmit, formState: { errors, isSubmitting, isSubmitSuccessful } } = useForm<NewProductData>()

    setValue('productName', product.productName)
    setValue('price', product.price)
    setValue('starRating', product.starRating)
    setValue('productId', product.productId)
    setValue('imageUrl', product.imageUrl)
    setValue('productAvailable', product.productAvailable)
    setValue('productCode', product.productCode)
    const fieldStyle = 'flex flex-col mb-2'
    function getEditorStyle(fieldError: FieldError | undefined) {
        return fieldError ? 'border-red-500' : ''
    }

    return ( //noValidate will disable the default form validation
        <form noValidate className="border-b py-4" onSubmit={handleSubmit(onSave)}>

            <div className={fieldStyle}>
                <label htmlFor="ProductName">ProductName</label>
                <input id="ProductName" {...register('productName', {
                    required: 'You must enter a productName'
                })} className={getEditorStyle(errors.productName)} />
                <ValidationError fieldError={errors.productName} />
            </div>


            <div className={fieldStyle}>
                <label htmlFor="price">Price</label>
                <input id="price" {...register('price', {
                    required: 'You must enter a price'
                })} className={getEditorStyle(errors.price)} />
                <ValidationError fieldError={errors.price} />
            </div>

            <div className={fieldStyle}>
                <label htmlFor="starRating">Rating</label>
                <input id="starRating" {...register('starRating', {
                    required: 'You must enter a productName'
                })} className={getEditorStyle(errors.starRating)} />
                <ValidationError fieldError={errors.starRating} />
            </div>

            <div className={fieldStyle}>
                <button type="submit" disabled={isSubmitting} className="mt-2 h-10 px-6 font-semibold bg-black text-white">
                    Update
                </button>
            </div>

        </form>
    )
}
