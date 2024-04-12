import { Component, OnInit } from '@angular/core';
import IProduct from '../model/product';
import { ProductClientService } from '../product-client.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrl: './product-details.component.css'
})
export class ProductDetailsComponent implements OnInit {

  product: IProduct | undefined
  errorMessage: string = '';
  constructor(private clientService: ProductClientService,
    private route: ActivatedRoute, private router: Router) {
  }
  //in react we have used useEffect()--- eager calling
  //ngOnIt --lazy calling
  ngOnInit(): void {

    const param = this.route.snapshot.paramMap.get('id')
    if (param) {
      this.clientService.getProductById(+param).subscribe({
        next: product => this.product = product,
        error: err => this.errorMessage = err
      })
    }
  }
  onBack(): void {
    this.router.navigate(['/products'])
  }
}
