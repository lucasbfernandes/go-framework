package lock

import (
	primitiveapi "github.com/atomix/api/go/atomix/primitive"
	lock "github.com/atomix/api/go/atomix/primitive/lock"
	"github.com/atomix/go-framework/pkg/atomix/errors"
	"sync"
)

// NewLockProxyRegistry creates a new LockProxyRegistry
func NewLockProxyRegistry() *LockProxyRegistry {
	return &LockProxyRegistry{
		proxies: make(map[primitiveapi.PrimitiveId]lock.LockServiceServer),
	}
}

type LockProxyRegistry struct {
	proxies map[primitiveapi.PrimitiveId]lock.LockServiceServer
	mu      sync.RWMutex
}

func (r *LockProxyRegistry) AddProxy(id primitiveapi.PrimitiveId, server lock.LockServiceServer) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	if _, ok := r.proxies[id]; ok {
		return errors.NewAlreadyExists("proxy '%s' already exists", id)
	}
	r.proxies[id] = server
	return nil
}

func (r *LockProxyRegistry) RemoveProxy(id primitiveapi.PrimitiveId) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	if _, ok := r.proxies[id]; !ok {
		return errors.NewNotFound("proxy '%s' not found", id)
	}
	delete(r.proxies, id)
	return nil
}

func (r *LockProxyRegistry) GetProxy(id primitiveapi.PrimitiveId) (lock.LockServiceServer, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	proxy, ok := r.proxies[id]
	if !ok {
		return nil, errors.NewNotFound("proxy '%s' not found", id)
	}
	return proxy, nil
}
