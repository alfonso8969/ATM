package com.atm.util;

import java.util.logging.Logger;

public class Constants {

    private Constants() {
    }

    // Client
    public static final String ID_CLIENT = "dni";
    public static final String CLIENT_NAME = "name";
    public static final String CLIENT_ADDRESS = "address";
    public static final String CLIENT_PHONE = "phone";

    // Account
    public static final String ID_ACCOUNT = "idAccount";
    public static final String ACCOUNT_BALANCE = "balance";
    public static final String ACCOUNT_TYPE = "accountType";

    // Movement
    public static final String ID_MOVEMENT = "idMovement";
    public static final String MOVEMENT_ID_ACCOUNT = "idAccount";
    public static final String MOVEMENT_TRANSACTION_DATE = "transactionDate";
    public static final String MOVEMENT_AMOUNT = "amount";
    public static final String MOVEMENT_TRANSACTION_TYPE = "transactionType";

    // Client / Account
    public static final String ID_ACCOUNT_HOLDER = "idAccount";
    public static final String ID_CLIENT_HOLDER = "idClient";

    // Date Range
    public static final String ID_ACCOUNT_FROM = "idAccountFrom";
    public static final String ID_ACCOUNT_TO = "idAccountTo";
    public static final String DATE_FROM = "dateFrom";
    public static final String DATE_TO = "dateTo";

    // TYPE TRANSACTION
    public static final String TRANSACTION_RECEIVED = "transferencia recibida";
    public static final String TRANSACTION_SENDED = "transferencia enviada";
    public static final String WITHDRAWAL = "extracción";
    public static final String DEPOSIT = "ingreso";

    // LOGS
    public static final Logger LOGGER = Logger.getLogger("util.constants");

    // GLOBAL
    public static final String ERROR = "error";
    public static final String SUCCESS = "success";
    public static final String CLIENT = "Client";
    public static final String ADMIN = "Admin";
    public static final Object ERROR_OP = "Hubo algún problema al intentar realizar la operación";
}
