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
