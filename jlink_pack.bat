IF exist out\artifacts\alglib_ex_jar\jre (rmdir /s /q out\artifacts\alglib_ex_jar\jre)

jlink --no-header-files --no-man-pages --compress=2 --strip-debug --module-path %PATH_TO_FX_MODS%;ext_libs\jars;ext_libs\alglib\jmod --add-modules javafx.base,javafx.controls,javafx.fxml,alglib404free --output out\artifacts\alglib_ex_jar\jre

pause