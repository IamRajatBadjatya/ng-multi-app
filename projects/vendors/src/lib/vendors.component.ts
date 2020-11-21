import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'lib-vendors',
  template: `
  <div>
  <button mat-raised-button color="primary">{{buttonName}}</button>
  </div>
  `,
  styleUrls: ['./vendors.component.scss']
})
export class VendorsComponent implements OnInit {
  @Input() buttonName: string;
  constructor() { }

  ngOnInit() {
  }

}
