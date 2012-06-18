{
  cout << endl << "\033[1mYou've got Sam's .rootlogon.C\033[0m" << endl;
  cout << "ROOT version " << gROOT->GetVersion() << endl;
  
  char ss[512];
  sprintf(ss,"%s",gROOT->GetVersion()); 
  if(!strcmp(ss,"5.26/00") )
    // then we have the old ugly version of root
    {
      TStyle *samStyle= new TStyle("SAM","Plots that don't TSuck");
      
      // all fonts helvetica (not bold)
      int fontNum = 42; //65 is bold
      
      // turn off ugly borders
      samStyle->SetFrameBorderMode(0);
      samStyle->SetCanvasBorderMode(0);
      samStyle->SetPadBorderMode(0);
      
      // use plain black on white colors
      samStyle->SetPadColor(0);
      samStyle->SetCanvasColor(0);
      samStyle->SetStatColor(0);
      //samStyle->SetTitleColor(0);
      //samStyle->SetFillColor(0);  // this command screws up the colours in 2d plots.

      // set up colour palette for 2d temperature plots etc
      samStyle->SetPalette(51,0);  // 1==thermal; 51,0 ==deep blue sea
      //Int_t palette[5];
      //palette[0] = 15;
      //palette[1] = 20;
      //palette[2] = 23;
      //palette[3] = 30;
      //palette[4] = 32;
      //samStyle->SetPalette(5,palette);
      
      // stat box
      samStyle->SetStatFont(fontNum);
      samStyle->SetStatBorderSize(1);
      samStyle->SetTextFont(fontNum);
      samStyle->SetOptStat(1111111);
      
      // axis labels
      samStyle->SetLabelFont(fontNum,"xyz");
      samStyle->SetTitleFont(fontNum,"xyz");
      
      // put tick marks on top and RHS of plots
      samStyle->SetPadTickX(1);
      samStyle->SetPadTickY(1);
      
      // plot title
      samStyle->SetTitleBorderSize(0);
      samStyle->SetTitleFont(fontNum);
      
      // use bold lines and markers
      samStyle->SetMarkerStyle(20);
      samStyle->SetHistLineWidth(1.85);
      samStyle->SetHistLineColor(2);
      
      // get rid of X error bars and y error bar caps
      samStyle->SetErrorX(0.001);
      
      // do not display any of the standard histogram decorations
      //samStyle->SetOptTitle(0);
      //samStyle->SetOptStat(0);
      //samStyle->SetOptFit(0);
 
      gROOT->SetStyle("Plain");
      gROOT->SetStyle("SAM");
      cout<<"For pretty plots you are using: gROOT->SetStyle(\"SAM\");"<<endl;
    }
  else
    {
      cout<<"This version of ROOT does not look crap"<<endl; 
      cout<<"by default so nothing has been changed."<<endl;
    }

  cout<<endl;
  delete ss;

}


