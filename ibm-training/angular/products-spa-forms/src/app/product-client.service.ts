import {
  HttpClient,
  HttpErrorResponse,
  HttpHeaders,
} from '@angular/common/http';
import { Injectable } from '@angular/core';
import IProduct from './model/product';
import { Observable, catchError, tap, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ProductClientService {
  constructor(private client: HttpClient) {}

  getProducts(): Observable<IProduct[]> {
    return this.client.get<IProduct[]>('http://localhost:3000/products').pipe(
      tap((data) => console.log(data)),
      catchError((err: HttpErrorResponse) =>
        throwError(() => `An error occured`)
      )
    );
  }
  getProductById(id: number): Observable<IProduct> {
    return this.client
      .get<IProduct>(`http://localhost:3000/products/${id}`)
      .pipe(
        tap((data) => console.log(data)),
        catchError((err: HttpErrorResponse) =>
          throwError(() => `An error occured`)
        )
      );
  }
  updateExistingProduct(product: IProduct): Observable<IProduct> {
    const headers = new HttpHeaders({ 'Content-Type': 'application/json' });
    return this.client
      .put<IProduct>(
        `http://localhost:3000/products/${product.productId}`,
        product,
        { headers }
      )
      .pipe(
        tap((data) => console.log(data)),
        catchError((err: HttpErrorResponse) =>
          throwError(() => `An error occured`)
        )
      );
  }
}
