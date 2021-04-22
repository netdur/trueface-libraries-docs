import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MdComponent } from './md/md.component';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'doc/overview'
  },
  {
    path: 'doc/:name',
    component: MdComponent
  },
  {
    path: 'doc/:folder/:name',
    component: MdComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
