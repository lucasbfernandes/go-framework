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

package client

import (
	"context"
	primitiveapi "github.com/atomix/api/go/atomix/primitive"
	"github.com/atomix/go-framework/pkg/atomix/errors"
	"google.golang.org/grpc"
)

type ID string

type PrimitiveType string

// NewPrimitiveClient creates a new primitive client
func NewPrimitiveClient(clientID ID, primitiveType PrimitiveType, name string, conn *grpc.ClientConn) PrimitiveClient {
	return &primitiveClient{
		clientID:      clientID,
		primitiveType: primitiveType,
		name:          name,
		client:        primitiveapi.NewPrimitiveServiceClient(conn),
	}
}

// PrimitiveClient is the client interface for a primitive
type PrimitiveClient interface {
	// ID returns the client identifier
	ID() ID

	// Name returns the primitive name
	Name() string

	// Type returns the primitive type
	Type() PrimitiveType

	// Create creates the primitive
	Create(ctx context.Context) error

	// Close closes the primitive
	Close(ctx context.Context) error

	// Delete deletes the primitive state from the cluster
	Delete(ctx context.Context) error
}

// primitiveClient is an implementation of the PrimitiveClient interface
type primitiveClient struct {
	clientID      ID
	primitiveType PrimitiveType
	name          string
	client        primitiveapi.PrimitiveServiceClient
}

func (p *primitiveClient) ID() ID {
	return p.clientID
}

func (p *primitiveClient) Name() string {
	return p.name
}

func (p *primitiveClient) Type() PrimitiveType {
	return p.primitiveType
}

func (p *primitiveClient) Create(ctx context.Context) error {
	request := &primitiveapi.CreateRequest{
		Header: primitiveapi.RequestHeader{
			PrimitiveID: primitiveapi.PrimitiveId{
				Type: string(p.primitiveType),
				Name: p.name,
			},
		},
	}
	_, err := p.client.Create(ctx, request)
	if err != nil {
		return errors.From(err)
	}
	return nil
}

func (p *primitiveClient) Close(ctx context.Context) error {
	request := &primitiveapi.CloseRequest{
		Header: primitiveapi.RequestHeader{
			PrimitiveID: primitiveapi.PrimitiveId{
				Type: string(p.primitiveType),
				Name: p.name,
			},
		},
	}
	_, err := p.client.Close(ctx, request)
	if err != nil {
		return errors.From(err)
	}
	return nil
}

func (p *primitiveClient) Delete(ctx context.Context) error {
	request := &primitiveapi.DeleteRequest{
		Header: primitiveapi.RequestHeader{
			PrimitiveID: primitiveapi.PrimitiveId{
				Type: string(p.primitiveType),
				Name: p.name,
			},
		},
	}
	_, err := p.client.Delete(ctx, request)
	if err != nil {
		return errors.From(err)
	}
	return nil
}