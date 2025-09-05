$WorkspaceName = Read-Host 'Name of workspace'

npm i -g @nrwl/cli
npm i -g @nrwl/angular

npx create-nx-workspace --preset=angular --name=$WorkspaceName --appName=myapp --style=less --nx-cloud=No

cd $WorkspaceName

npm i @angular-architects/ddd

npx ng generate @nrwl/workspace:remove --projectName=myapp-e2e --no-interactive
npx ng generate @nrwl/workspace:remove --projectName=myapp --no-interactive

npx ng generate @nrwl/angular:application --name=app --port=3000 --e2eTestRunner=none --no-interactive

Set-Content -Path .\apps\app\src\app\app.component.html -Value '<router-outlet></router-outlet>'
Set-Content -Path .\apps\app\src\app\app.component.less -Value ''
Set-Content -Path .\apps\app\src\app\app.module.ts -Value "
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';

@NgModule({
  declarations: [AppComponent],
  imports: [BrowserModule, RouterModule.forRoot([])],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
"
pause

