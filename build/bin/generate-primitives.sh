#!/bin/sh

proto_path="./pkg:/go/src/github.com/atomix/api/proto:${GOPATH}/src/github.com/gogo/protobuf:${GOPATH}/src/github.com/gogo/protobuf/protobuf:${GOPATH}/src"

go_import_paths="Mgoogle/protobuf/any.proto=github.com/gogo/protobuf/types"
go_import_paths="${go_import_paths},Mgoogle/protobuf/timestamp.proto=github.com/gogo/protobuf/types"
go_import_paths="${go_import_paths},Mgoogle/protobuf/duration.proto=github.com/gogo/protobuf/types"
go_import_paths="${go_import_paths},Mgoogle/protobuf/descriptor.proto=github.com/golang/protobuf/protoc-gen-go/descriptor"
go_import_paths="${go_import_paths},Matomix/protocol/protocol.proto=github.com/atomix/api/go/atomix/protocol"
go_import_paths="${go_import_paths},Matomix/primitive/primitive.proto=github.com/atomix/api/go/atomix/primitive"
go_import_paths="${go_import_paths},Matomix/primitive/timestamp/timestamp.proto=github.com/atomix/api/go/atomix/primitive/timestamp"

go_import_paths="${go_import_paths},Matomix/primitive/counter/counter.proto=github.com/atomix/api/go/atomix/primitive/counter"
go_import_paths="${go_import_paths},Matomix/primitive/election/election.proto=github.com/atomix/api/go/atomix/primitive/election"
go_import_paths="${go_import_paths},Matomix/primitive/indexedmap/indexedmap.proto=github.com/atomix/api/go/atomix/primitive/indexedmap"
go_import_paths="${go_import_paths},Matomix/primitive/leader/latch.proto=github.com/atomix/api/go/atomix/primitive/leader"
go_import_paths="${go_import_paths},Matomix/primitive/list/list.proto=github.com/atomix/api/go/atomix/primitive/list"
go_import_paths="${go_import_paths},Matomix/primitive/lock/lock.proto=github.com/atomix/api/go/atomix/primitive/lock"
go_import_paths="${go_import_paths},Matomix/primitive/log/log.proto=github.com/atomix/api/go/atomix/primitive/log"
go_import_paths="${go_import_paths},Matomix/primitive/map/map.proto=github.com/atomix/api/go/atomix/primitive/map"
go_import_paths="${go_import_paths},Matomix/primitive/set/set.proto=github.com/atomix/api/go/atomix/primitive/set"
go_import_paths="${go_import_paths},Matomix/primitive/value/value.proto=github.com/atomix/api/go/atomix/primitive/value"

protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/driver/primitive/counter,plugin=driver,protocol=primitive,output_path=atomix/driver/primitive/counter:pkg       atomix/primitive/counter/counter.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/driver/primitive/election,plugin=driver,protocol=primitive,output_path=atomix/driver/primitive/election:pkg     atomix/primitive/election/election.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/driver/primitive/indexedmap,plugin=driver,protocol=primitive,output_path=atomix/driver/primitive/indexedmap:pkg atomix/primitive/indexedmap/indexedmap.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/driver/primitive/leader,plugin=driver,protocol=primitive,output_path=atomix/driver/primitive/leader:pkg         atomix/primitive/leader/latch.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/driver/primitive/list,plugin=driver,protocol=primitive,output_path=atomix/driver/primitive/list:pkg             atomix/primitive/list/list.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/driver/primitive/lock,plugin=driver,protocol=primitive,output_path=atomix/driver/primitive/lock:pkg             atomix/primitive/lock/lock.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/driver/primitive/log,plugin=driver,protocol=primitive,output_path=atomix/driver/primitive/log:pkg               atomix/primitive/log/log.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/driver/primitive/map,plugin=driver,protocol=primitive,output_path=atomix/driver/primitive/map:pkg               atomix/primitive/map/map.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/driver/primitive/set,plugin=driver,protocol=primitive,output_path=atomix/driver/primitive/set:pkg               atomix/primitive/set/set.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/driver/primitive/value,plugin=driver,protocol=primitive,output_path=atomix/driver/primitive/value:pkg           atomix/primitive/value/value.proto

protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/rsm/counter,plugin=proxy,protocol=rsm,output_path=atomix/proxy/rsm/counter:pkg       atomix/primitive/counter/counter.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/rsm/election,plugin=proxy,protocol=rsm,output_path=atomix/proxy/rsm/election:pkg     atomix/primitive/election/election.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/rsm/indexedmap,plugin=proxy,protocol=rsm,output_path=atomix/proxy/rsm/indexedmap:pkg atomix/primitive/indexedmap/indexedmap.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/rsm/leader,plugin=proxy,protocol=rsm,output_path=atomix/proxy/rsm/leader:pkg         atomix/primitive/leader/latch.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/rsm/list,plugin=proxy,protocol=rsm,output_path=atomix/proxy/rsm/list:pkg             atomix/primitive/list/list.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/rsm/lock,plugin=proxy,protocol=rsm,output_path=atomix/proxy/rsm/lock:pkg             atomix/primitive/lock/lock.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/rsm/log,plugin=proxy,protocol=rsm,output_path=atomix/proxy/rsm/log:pkg               atomix/primitive/log/log.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/rsm/map,plugin=proxy,protocol=rsm,output_path=atomix/proxy/rsm/map:pkg               atomix/primitive/map/map.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/rsm/set,plugin=proxy,protocol=rsm,output_path=atomix/proxy/rsm/set:pkg               atomix/primitive/set/set.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/rsm/value,plugin=proxy,protocol=rsm,output_path=atomix/proxy/rsm/value:pkg           atomix/primitive/value/value.proto

protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/rsm/counter,plugin=protocol,protocol=rsm,output_path=atomix/protocol/rsm/counter:pkg       atomix/primitive/counter/counter.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/rsm/election,plugin=protocol,protocol=rsm,output_path=atomix/protocol/rsm/election:pkg     atomix/primitive/election/election.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/rsm/indexedmap,plugin=protocol,protocol=rsm,output_path=atomix/protocol/rsm/indexedmap:pkg atomix/primitive/indexedmap/indexedmap.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/rsm/leader,plugin=protocol,protocol=rsm,output_path=atomix/protocol/rsm/leader:pkg         atomix/primitive/leader/latch.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/rsm/list,plugin=protocol,protocol=rsm,output_path=atomix/protocol/rsm/list:pkg             atomix/primitive/list/list.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/rsm/lock,plugin=protocol,protocol=rsm,output_path=atomix/protocol/rsm/lock:pkg             atomix/primitive/lock/lock.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/rsm/log,plugin=protocol,protocol=rsm,output_path=atomix/protocol/rsm/log:pkg               atomix/primitive/log/log.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/rsm/map,plugin=protocol,protocol=rsm,output_path=atomix/protocol/rsm/map:pkg               atomix/primitive/map/map.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/rsm/set,plugin=protocol,protocol=rsm,output_path=atomix/protocol/rsm/set:pkg               atomix/primitive/set/set.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/rsm/value,plugin=protocol,protocol=rsm,output_path=atomix/protocol/rsm/value:pkg           atomix/primitive/value/value.proto

go_import_paths="${go_import_paths},Matomix/protocol/gossip/state.proto=github.com/atomix/go-framework/pkg/atomix/protocol/gossip"

protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/gossip/counter,plugin=proxy,protocol=gossip,output_path=atomix/proxy/gossip/counter:pkg atomix/primitive/counter/counter.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/gossip/map,plugin=proxy,protocol=gossip,output_path=atomix/proxy/gossip/map:pkg         atomix/primitive/map/map.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/gossip/set,plugin=proxy,protocol=gossip,output_path=atomix/proxy/gossip/set:pkg         atomix/primitive/set/set.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/proxy/gossip/value,plugin=proxy,protocol=gossip,output_path=atomix/proxy/gossip/value:pkg     atomix/primitive/value/value.proto

go_import_paths="${go_import_paths},Matomix/protocol/gossip/counter/state.proto=github.com/atomix/go-framework/pkg/atomix/protocol/gossip/counter"
go_import_paths="${go_import_paths},Matomix/protocol/gossip/map/state.proto=github.com/atomix/go-framework/pkg/atomix/protocol/gossip/map"
go_import_paths="${go_import_paths},Matomix/protocol/gossip/set/state.proto=github.com/atomix/go-framework/pkg/atomix/protocol/gossip/set"
go_import_paths="${go_import_paths},Matomix/protocol/gossip/value/state.proto=github.com/atomix/go-framework/pkg/atomix/protocol/gossip/value"

protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/gossip/counter,plugin=protocol,protocol=gossip,state=discrete,entry=.atomix.protocol.gossip.counter.CounterState,output_path=atomix/protocol/gossip/counter:pkg atomix/primitive/counter/counter.proto atomix/protocol/gossip/counter/state.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/gossip/map,plugin=protocol,protocol=gossip,state=continuous,entry=.atomix.protocol.gossip.map.MapEntry,output_path=atomix/protocol/gossip/map:pkg               atomix/primitive/map/map.proto         atomix/protocol/gossip/map/state.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/gossip/set,plugin=protocol,protocol=gossip,state=continuous,entry=.atomix.protocol.gossip.set.SetElement,output_path=atomix/protocol/gossip/set:pkg             atomix/primitive/set/set.proto         atomix/protocol/gossip/set/state.proto
protoc -I=$proto_path --atomix_out=$go_import_paths,import_path=github.com/atomix/go-framework/pkg/atomix/protocol/gossip/value,plugin=protocol,protocol=gossip,state=discrete,entry=.atomix.protocol.gossip.value.ValueState,output_path=atomix/protocol/gossip/value:pkg         atomix/primitive/value/value.proto     atomix/protocol/gossip/value/state.proto
