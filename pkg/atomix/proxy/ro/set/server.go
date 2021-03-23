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

package set

import (
	"context"
	setapi "github.com/atomix/api/go/atomix/primitive/set"
	"github.com/atomix/go-framework/pkg/atomix/errors"
	"github.com/atomix/go-framework/pkg/atomix/logging"
)

var log = logging.GetLogger("atomix", "set")

// NewReadOnlySetServer creates a new read-only set server
func NewReadOnlySetServer(s setapi.SetServiceServer) setapi.SetServiceServer {
	return &ReadOnlySetServer{
		server: s,
	}
}

type ReadOnlySetServer struct {
	server setapi.SetServiceServer
}

func (s *ReadOnlySetServer) Size(ctx context.Context, request *setapi.SizeRequest) (*setapi.SizeResponse, error) {
	return s.server.Size(ctx, request)
}

func (s *ReadOnlySetServer) Contains(ctx context.Context, request *setapi.ContainsRequest) (*setapi.ContainsResponse, error) {
	return s.server.Contains(ctx, request)
}

func (s *ReadOnlySetServer) Add(ctx context.Context, request *setapi.AddRequest) (*setapi.AddResponse, error) {
	return nil, errors.NewUnauthorized("Add operation is not permitted")
}

func (s *ReadOnlySetServer) Remove(ctx context.Context, request *setapi.RemoveRequest) (*setapi.RemoveResponse, error) {
	return nil, errors.NewUnauthorized("Remove operation is not permitted")
}

func (s *ReadOnlySetServer) Clear(ctx context.Context, request *setapi.ClearRequest) (*setapi.ClearResponse, error) {
	return nil, errors.NewUnauthorized("Clear operation is not permitted")
}

func (s *ReadOnlySetServer) Events(request *setapi.EventsRequest, server setapi.SetService_EventsServer) error {
	return s.server.Events(request, server)
}

func (s *ReadOnlySetServer) Elements(request *setapi.ElementsRequest, server setapi.SetService_ElementsServer) error {
	return s.server.Elements(request, server)
}

var _ setapi.SetServiceServer = &ReadOnlySetServer{}
