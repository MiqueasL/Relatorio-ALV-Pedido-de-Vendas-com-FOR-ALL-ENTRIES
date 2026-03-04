REPORT ZRELATORIO.

DATA: gv_vbeln TYPE vbak-vbeln,
      gv_erdat TYPE vbak-erdat.

SELECT-OPTIONS: s_vbeln FOR gv_vbeln,
                s_erdat FOR gv_erdat.

SELECT
  vbeln,
  erdat,
  kunnr
  FROM vbak
  INTO TABLE @DATA(t_vbak)
  WHERE vbeln IN @s_vbeln
  AND erdat IN @s_erdat.

IF t_vbak IS NOT INITIAL.

  SELECT
    vbeln,
    posnr,
    matnr,
    kwmeng,
    netwr
    FROM vbap
    INTO TABLE @DATA(t_vbap)
    FOR ALL ENTRIES IN @t_vbak
    WHERE vbeln = @t_vbak-vbeln.


ENDIF.

DATA: gv_pedido TYPE i,
      gv_valor  TYPE p DECIMALS 2 VALUE 0,
      gv_index  TYPE sy-tabix.

SORT t_vbap BY vbeln.

LOOP AT t_vbak INTO DATA(ls_vbak).

  CLEAR: gv_pedido, gv_valor.

  READ TABLE t_vbap INTO DATA(ls_vbap)
  WITH KEY vbeln = ls_vbak-vbeln
  BINARY SEARCH.

  IF sy-subrc = 0.

    gv_index = sy-tabix.

    LOOP AT t_vbap INTO ls_vbap FROM gv_index.

      IF ls_vbap-vbeln <> ls_vbak-vbeln.
        EXIT.
      ENDIF.

      gv_pedido = gv_pedido + 1.
      gv_valor = gv_valor + ls_vbap-netwr.

    ENDLOOP.

  ENDIF.


  WRITE: /'Pedido',ls_vbak-vbeln,
         /'Cliente', ls_vbak-kunnr,
         /'Total', gv_pedido,
         /'Total Valor' CURRENCY 'BRL', gv_valor.

  SKIP.

ENDLOOP.
