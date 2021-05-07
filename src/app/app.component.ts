import { Component } from '@angular/core';
import { MarkdownService } from 'ngx-markdown';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  constructor(private markdownService: MarkdownService) { }

  ngOnInit() {
    this.markdownService.renderer.link = (href: string, title: string, text: string) => {
      if (href.startsWith('http')) {
        return `<a href="${href}" target="_blank">${text}</a>`;
      }
      return `<a
                routerlink="${href}"
                ng-reflect-router-link="${href}"
                href="${href}">
                ${text}
              </a>`;
    };
  }

}
