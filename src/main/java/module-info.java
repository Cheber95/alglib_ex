module com.example.alglib_ex {
    requires javafx.controls;
    requires javafx.fxml;
    requires alglib404free;

    opens com.example.alglib_ex to javafx.fxml;
    exports com.example.alglib_ex;
}