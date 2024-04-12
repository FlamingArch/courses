import { configureStore } from "@reduxjs/toolkit";
import ProductsListReducer from "./productListSlice"

/**
 * The Redux store configuration.
 */
const store = configureStore({
    reducer: {
        products: ProductsListReducer  // This is where we map the products
    }
})

/**
 * The type of the dispatch function from the Redux store.
 */
export type AppDispatch = typeof store.dispatch // store.dispatch to dispatch the actions

/**
 * The default export of the Redux store.
 */
export default store // to connect components

/**
 * The type of the root state of the Redux store.
 */
export type RootState = ReturnType<typeof store.getState>
