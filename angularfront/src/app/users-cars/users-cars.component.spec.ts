import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UsersCarsComponent } from './users-cars.component';

describe('UsersCarsComponent', () => {
  let component: UsersCarsComponent;
  let fixture: ComponentFixture<UsersCarsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UsersCarsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UsersCarsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
