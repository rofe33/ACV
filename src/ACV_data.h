#pragma once

typedef struct {
    int number;
    char *name;
    char *abbr;
} ACV_book;

typedef struct {
    int book;
    int chapter;
    int verse;
    char *text;
} ACV_verse;

extern ACV_verse ACV_verses[];

extern int ACV_verses_length;

extern ACV_book ACV_books[];

extern int ACV_books_length;
