import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import IProduct from "../model/product";
import httpClient from "../apiClient/httpClient";


export const fetchProducts = //fetching the data from client here
    createAsyncThunk<IProduct[], string>("products/list", async (searchKey: string) => await httpClient.get(`http://localhost:3000/products?productName=`)
    )

type AppStateType = {
    products: IProduct[]
    searchKey: string
    error: boolean
}

const initialState: AppStateType = { //if anything goes wrong the error will be used
    products: [],
    searchKey: "",
    error: false
}

export const productsListSlice = createSlice({ //this slice is for productpsList
    name: 'products',
    initialState: initialState,
    reducers: {

    },
    extraReducers: (builder) => { //when we are performing async operations and we wanna know the promise states we use extraReducers
        // setSearchKey: (state, action) => {
        //     state.searchKey = action.payload
        // }
        builder.addCase(fetchProducts.fulfilled, (state, action) => {//in the current the products will be empty array
            state.products = action.payload
        })
        builder.addCase(fetchProducts.rejected, (state) => { //in the current the products will be empty array
            state.error = true
        })// we use extraReducers to resolve a promise
    },
})

export default productsListSlice.reducer
