// Copyright 2019-present Open Networking Foundation.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package leader

import (
	api "github.com/atomix/api/proto/atomix/leader"
	primitiveapi "github.com/atomix/api/proto/atomix/primitive"
	"github.com/lucasbfernandes/go-framework/pkg/atomix"
	"github.com/lucasbfernandes/go-framework/pkg/atomix/primitive"
	"google.golang.org/grpc"
)

// Type is the leader latch primitive type
const Type = primitiveapi.PrimitiveType_LEADER_LATCH

// RegisterPrimitive registers the primitive on the given node
func RegisterPrimitive(node *atomix.Node) {
	node.RegisterPrimitive(Type, &Primitive{})
}

// Primitive is the counter primitive
type Primitive struct{}

// RegisterServer registers the leader latch server with the protocol
func (p *Primitive) RegisterServer(server *grpc.Server, protocol primitive.Protocol) {
	api.RegisterLeaderLatchServiceServer(server, &Server{
		Server: &primitive.Server{
			Type:     primitive.ServiceType_LEADER_LATCH,
			Protocol: protocol,
		},
	})
}

// NewService creates a new leader latch service
func (p *Primitive) NewService(scheduler primitive.Scheduler, context primitive.ServiceContext) primitive.Service {
	service := &Service{
		Service:      primitive.NewService(scheduler, context),
		participants: make([]*LatchParticipant, 0),
	}
	service.init()
	return service
}

var _ primitive.Primitive = &Primitive{}
