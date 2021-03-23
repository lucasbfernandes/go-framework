{{- $service := printf "%s.%sServer" .Primitive.Type.Package.Alias .Primitive.Type.Name }}
{{- $registry := printf "%sProxyRegistry" .Primitive.Name }}
package {{ .Package.Name }}

import (
	primitiveapi "github.com/atomix/api/go/atomix/primitive"
	"github.com/atomix/go-framework/pkg/atomix/errors"
	"sync"
	{{- $package := .Package }}
	{{- range .Imports }}
	{{ .Alias }} {{ .Path | quote }}
	{{- end }}
)

// New{{ $registry }} creates a new {{ $registry }}
func New{{ $registry }}() *{{ $registry }} {
	return &{{ $registry }}{
		proxies: make(map[primitiveapi.PrimitiveId]{{ $service }}),
	}
}

type {{ $registry }} struct {
	proxies map[primitiveapi.PrimitiveId]{{ $service }}
	mu      sync.RWMutex
}

func (r *{{ $registry }}) AddProxy(id primitiveapi.PrimitiveId, server {{ $service }}) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	if _, ok := r.proxies[id]; ok {
		return errors.NewAlreadyExists("proxy '%s' already exists", id)
	}
	r.proxies[id] = server
	return nil
}

func (r *{{ $registry }}) RemoveProxy(id primitiveapi.PrimitiveId) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	if _, ok := r.proxies[id]; !ok {
		return errors.NewNotFound("proxy '%s' not found", id)
	}
	delete(r.proxies, id)
	return nil
}

func (r *{{ $registry }}) GetProxy(id primitiveapi.PrimitiveId) ({{ $service }}, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	proxy, ok := r.proxies[id]
	if !ok {
		return nil, errors.NewNotFound("proxy '%s' not found", id)
	}
	return proxy, nil
}
