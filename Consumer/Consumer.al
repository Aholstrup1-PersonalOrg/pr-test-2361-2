pageextension 100010 "TP Consumer Customer List Ext" extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message(GetOpenPageMessage());
    end;

    local procedure GetOpenPageMessage(): Text
    begin
#if MAIN_REPO_DRIFT
        exit(StrSubstNo('Consumer -> %1 / repo drift symbol', CorePublicApi.GetGreeting()));
#elif PR_ONLY_SYMBOL
        exit(StrSubstNo('Consumer -> %1 / pr settings symbol', CorePublicApi.GetGreeting()));
#else
        exit(StrSubstNo('Consumer -> %1', CorePublicApi.GetGreeting()));
#endif
    end;

    var
        CorePublicApi: Codeunit "TP Core Public Api";
}
