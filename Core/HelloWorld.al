pageextension 1000000 "TP Core Customer List Ext" extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message(CorePublicApi.GetGreeting());
    end;

    var
        CorePublicApi: Codeunit "TP Core Public Api";
}

codeunit 1000001 "TP Core Public Api"
{
    procedure GetGreeting(): Text
    begin
        exit(GetBaseGreeting() + GetConditionalSuffix());
    end;

    procedure GetAdvancedGreeting(): Text
    begin
        exit(GetGreeting() + ' / advanced');
    end;

    local procedure GetBaseGreeting(): Text
    begin
        exit('Core ready');
    end;

    local procedure GetConditionalSuffix(): Text
    begin
#if MAIN_REPO_DRIFT
        exit(' (repo drift enabled)');
#elif PR_ONLY_SYMBOL
        exit(' (pr settings enabled)');
#else
        exit('');
#endif
    end;
}

