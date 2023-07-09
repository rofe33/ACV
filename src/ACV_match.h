#pragma once

#include "ACV_config.h"
#include "ACV_ref.h"

typedef struct {
    int start;
    int end;
} ACV_range;

typedef struct {
    int current;
    int next_match;
    ACV_range matches[2];
} ACV_next_data;

int
ACV_next_verse(const ACV_ref *ref, const ACV_config *config, ACV_next_data *next);
