pageextension 1000010 "TP Consumer Customer List Ext" extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message(GetOpenPageMessage());
    end;

    local procedure GetOpenPageMessage(): Text
    begin
#if MAIN_REPO_DRIFT
        exit(StrSubstNo('Consumer -> %1 / repo drift symbol', CorePublicApi.GetAdvancedGreeting()));
#elif PR_ONLY_SYMBOL
        exit(StrSubstNo('Consumer -> %1 / pr settings symbol', CorePublicApi.GetAdvancedGreeting()));
#else
        exit(StrSubstNo('Consumer -> %1', CorePublicApi.GetAdvancedGreeting()));
#endif
    end;

    var
        CorePublicApi: Codeunit "TP Core Public Api";
}

