import { NgModule } from '@angular/core';

import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';

import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatListModule } from '@angular/material/list';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatTabsModule } from '@angular/material/tabs';

import { MatSortModule } from '@angular/material/sort';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatDialogModule } from '@angular/material/dialog';

import { MatMenuModule } from '@angular/material/menu';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatSelectModule } from '@angular/material/select';
import { MatAutocompleteModule } from '@angular/material/autocomplete';


@NgModule({

  imports: [MatButtonModule, MatCheckboxModule, MatCardModule, MatDividerModule, MatIconModule,
    MatSidenavModule, MatToolbarModule, MatListModule, MatTooltipModule, MatTabsModule,
    MatTableModule, MatFormFieldModule, MatInputModule, MatDialogModule, MatPaginatorModule,
    MatMenuModule, MatSlideToggleModule, MatSelectModule, MatSortModule, MatAutocompleteModule],
  exports: [MatButtonModule, MatCheckboxModule, MatCardModule, MatDividerModule, MatIconModule,
    MatSidenavModule, MatToolbarModule, MatListModule, MatTooltipModule, MatTabsModule,
    MatTableModule, MatFormFieldModule, MatInputModule, MatDialogModule, MatPaginatorModule,
    MatMenuModule, MatSlideToggleModule, MatSelectModule, MatSortModule, MatAutocompleteModule]
})
export class Material2Module { }
