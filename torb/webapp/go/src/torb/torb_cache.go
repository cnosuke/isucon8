package main;

type TorbCache struct {
	Data map[int64]interface{}
}

func (t *TorbCache) SetData(uid int64, d interface{}) {
	t.Data[uid] = d
}

func (t *TorbCache) GetData(uid int64) interface{} {
	return t.Data[uid]
}

func (t *TorbCache) ResetData(uid int64) {
	t.Data[uid] = nil
	GlobalTorbIndexCache.ResetData()
}

func (t *TorbCache) HasCache(uid int64) bool {
	return t.Data[uid] != nil
}

func NewGlobalTorbCache() TorbCache {
	t := TorbCache{}
	t.Data = make(map[int64]interface{})

	return t
}

var GlobalTorbCache = NewGlobalTorbCache()

type TorbIndexCache struct {
	Data []*Event
}

func (t *TorbIndexCache) SetData(d []*Event) {
	t.Data = d
}

func (t *TorbIndexCache) GetData() []*Event {
	return t.Data
}

func (t *TorbIndexCache) ResetData() {
	t.Data = nil
}

func (t *TorbIndexCache) HasCache() bool {
	return t.Data != nil
}

func NewGlobalTorbIndexCache() TorbIndexCache {
	t := TorbIndexCache{}
	t.Data = nil
	return t
}

var GlobalTorbIndexCache = NewGlobalTorbIndexCache()
