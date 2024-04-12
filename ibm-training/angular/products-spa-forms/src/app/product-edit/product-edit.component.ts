import { Component } from '@angular/core';
import IProduct from '../model/product';
import { ProductClientService } from '../product-client.service';
import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup } from '@angular/forms';
import { FormlyFieldConfig } from '@ngx-formly/core';

@Component({
  selector: 'app-product-edit',
  templateUrl: './product-edit.component.html',
  styleUrl: './product-edit.component.css',
})
export class ProductEditComponent {
  product: IProduct = {} as IProduct;
  errorMessage: string = '';
  constructor(
    private clientService: ProductClientService,
    private route: ActivatedRoute,
    private router: Router
  ) {}
  //in react we have used useEffect()--- eager calling
  //ngOnIt --lazy calling
  ngOnInit(): void {
    const param = this.route.snapshot.paramMap.get('id');
    if (param) {
      this.clientService.getProductById(+param).subscribe({
        next: (product) => (this.product = product),
        error: (err) => (this.errorMessage = err),
      });
    }
  }
  onBack(): void {
    this.router.navigate(['/products']);
  }

  form = new FormGroup({});
  fields: FormlyFieldConfig[] = [
    {
      key: 'productId',
    },
    {
      key: 'productName',
      type: 'input',
      props: {
        required: true,
        label: 'Product Name',
      },
    },
    {
      key: 'price',
      type: 'input',
      props: {
        required: true,
        label: 'Price',
      },
    },
    {
      key: 'productAvailable',
      type: 'input',
      props: {
        required: true,
        label: 'Product Available',
      },
    },
    {
      key: 'productCode',
      type: 'input',
      props: {
        required: true,
        label: 'Product Code',
      },
    },
    {
      key: 'starRating',
      type: 'input',
      props: {
        required: true,
        label: 'Product Rating',
      },
    },
  ];

  submit() {
    if (this.form.valid) {
      if (this.form.dirty) {
        this.clientService.updateExistingProduct(this.product).subscribe({
          next: () => {
            this.form.reset();
            this.router.navigate(['/products']);
          },
          error: (err) => (this.errorMessage = err),
        });
      }
    }
  }
}
