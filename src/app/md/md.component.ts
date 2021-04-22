import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';

@Component({
  templateUrl: './md.component.html',
  styleUrls: ['./md.component.css']
})
export class MdComponent implements OnInit, OnDestroy {

  private sub!: Subscription;

  md!: string;

  constructor(private route: ActivatedRoute) { }

  ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
      let path = (!params['folder']) ? params['name'] : `${params['folder']}/${params['name']}`;
      this.md = `./assets/docs/${path}.md`;
    });
  }

  ngOnDestroy() {
    if (this.sub) {
      this.sub.unsubscribe();
    }
  }

}
