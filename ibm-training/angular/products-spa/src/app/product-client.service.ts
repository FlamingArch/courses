import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import IProduct from './model/product';
import { Observable, catchError, tap, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductClientService {

  constructor(private client: HttpClient) { }

  getProducts(): Observable<IProduct[]>{
    return this.client.get<IProduct[]>('http://localhost:5000/products')
    .pipe(tap(data => console.log(data)),
    catchError((err:HttpErrorResponse)=> throwError(()=>`An error occured`)))
  }
  getProductById(id : number): Observable<IProduct>{
    return this.client.get<IProduct>(`http://localhost:5000/products/${id}`)
    .pipe(tap(data => console.log(data)),
    catchError((err:HttpErrorResponse)=> throwError(()=>`An error occured`)))
  }
}