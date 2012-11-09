{
  cout << endl << "\033[1mYou've got Sam's .rootlogon.C\033[0m" << endl;
  cout << "ROOT version " << gROOT->GetVersion() << endl;
  
  gROOT->ProcessLine(".x ~/.lhcbStyle.C");
}


