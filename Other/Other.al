pageextension 100020 "TP Other Vendor List Ext" extends "Vendor List"
{
    trigger OnOpenPage();
    begin
        Message(GetOpenPageMessage());
    end;

    local procedure GetOpenPageMessage(): Text
    begin
#if MAIN_REPO_DRIFT
        exit('Other ready (repo drift enabled)');
#elif PR_ONLY_SYMBOL
        exit('Other ready (pr settings enabled)');
#else
        exit('Other ready');
#endif
    end;
}
