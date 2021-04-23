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

  getSourceLink(): string {
    return `https://github.com/netdur/trueface-libraries-docs/tree/main/src${this.md.substring(1)}`;
  }

  getReportBugLink(): string {
    const title = encodeURIComponent(`'Trueface Libraries documentation' page issue`);
    const body = encodeURIComponent(`Page source: ${this.md}

Found a typo? You can fix it yourself by going to the page source and clicking the pencil icon. Or finish creating this issue.

Description of issue:`);
    return `https://github.com/netdur/trueface-libraries-docs/issues/new?title=${title}&body=${body}`;
  }
}
