import { Component } from '@angular/core';
import products from '../data/products'
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-products-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './products-list.component.html',
  styleUrl: './products-list.component.css'
})
export class ProductsListComponent {
  title: string = 'products-app';
  products = products;
  show = false;
  searchKey = ""

  showOrHide = () => {
    this.show = !this.show
  }
}
