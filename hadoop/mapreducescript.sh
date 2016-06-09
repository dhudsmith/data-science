#! /usr/bash
hadoop jar /usr/local/Cellar/hadoop/2.7.2/libexec/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar \
    -mapper mapper.py \
    -reducer reducer.py \
    -input nfldata/stadiums \
    -output nfldata/output2 \
    -file ~/Development/learn-data-science/hadoop/hadoop-framework-examples/streaming-python/simple/mapper.py \
    -file ~/Development/learn-data-science/hadoop/hadoop-framework-examples/streaming-python/simple/reducer.py
