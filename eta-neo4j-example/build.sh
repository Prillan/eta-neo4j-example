#!/bin/bash

epm clean && epm configure --disable-executable-dynamic && epm build
