import { Component, OnInit } from '@angular/core';

import IProduct from '../model/product';
import { ProductClientService } from '../product-client.service';

@Component({
  selector: 'app-products-list',
  templateUrl: './products-list.component.html',
  styleUrl: './products-list.component.css'
})
export class ProductsListComponent implements OnInit{

    products:IProduct[] = []
    filteredproducts:IProduct[] = []
    title: string = 'Products App'
    _searchKey: string=''   //indicatinf it is a private member
    showImage: boolean = false
    errorMessage : string =''

//dependency Injection 
//subscribe only then the products will be called or else it wont be called
    constructor(private clientService : ProductClientService) {

    }
    //similar to react we have used useEffect()
  ngOnInit(): void {
    this.clientService.getProducts().subscribe ({
      next : products => {this.products = products
      this.filteredproducts = products
      },
      error : err => this.errorMessage = err


    })
  }


    get searchKey(): string{
      return this._searchKey
    }
    set searchKey(value:string){
      this._searchKey =value
      this.filteredproducts = this.products.filter((product:IProduct)=>
      product.productName.toLocaleLowerCase().includes(value.toLocaleLowerCase()))
    }

    showOrHide =() => {
      this.showImage =!this.showImage
    }
    onRatingClicked(message:string):void{
      this.title=`Product List ${message}`
    }
}