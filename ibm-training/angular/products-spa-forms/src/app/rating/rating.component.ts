import { Component, EventEmitter, Input, OnChanges, Output, SimpleChanges } from '@angular/core';
@Component({
  selector: 'app-rating',
  templateUrl: './rating.component.html',
  styleUrl: './rating.component.css'
})
export class RatingComponent implements OnChanges{
  @Input("rating")
  rating : number = 0
  
  @Output()

  ratingClicked : EventEmitter<string>= new EventEmitter<string>()


  cropWidth : number = 75

  ngOnChanges(changes: SimpleChanges): void {
    this.cropWidth = this.rating*75/5
  }
  onClick(): void{
    this.ratingClicked.emit(`rating clicked ${this.rating} was clicked`)
  }

}