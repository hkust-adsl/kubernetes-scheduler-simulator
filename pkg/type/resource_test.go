package simontype

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestNodeResource_Flatten(t *testing.T) {
	tnr := NodeResource{"Hello", 1000, 96000, []int64{200, 600, 350, 0}, 4, "1080", map[string]int{}}
	assert.Equal(t, NodeResourceFlat{1000, "600,350,200,0,0,0,0,0,", "1080", "bellman"}, tnr.Flatten("bellman"))

	tnr = NodeResource{"Hello", 300, 96000, []int64{0, 0, 0, 0}, 1, "", map[string]int{}}
	assert.Equal(t, NodeResourceFlat{300, "0,0,0,0,0,0,0,0,", "", "bellman"}, tnr.Flatten("bellman"))

	tnr = NodeResource{"Hello", 65535, 96000, []int64{1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000}, 9, "", map[string]int{}} // invalid input
	assert.Equal(t, NodeResourceFlat{65535, "9000,8000,7000,6000,5000,4000,3000,2000,", "", "bellman"}, tnr.Flatten("bellman"))
}

func TestNodeResource_Add(t *testing.T) {
	tnr := NodeResource{"Hello", 1000, 96000, []int64{200, 0, 0, 500}, 4, "1080", map[string]int{}}
	tpr := PodResource{100, 1000, 2, "1080"}
	idl := []int{1, 2}
	out, _ := tnr.Add(tpr, idl)
	//fmt.Printf("out: %s\n", out.Repr())
	assert.Equal(t, NodeResource{"Hello", 1100, 96000, []int64{200, 1000, 1000, 500}, 4, "1080", map[string]int{}}, out)
}

func TestNodeResource_Sub(t *testing.T) {
	tnr := NodeResource{"Hello", 1000, 96000, []int64{200, 1000, 1000, 500}, 4, "1080", map[string]int{}}
	tpr := PodResource{100, 1000, 2, "1080"}
	out, _ := tnr.Sub(tpr)
	//fmt.Printf("out: %s\n", out.Repr())
	assert.Equal(t, NodeResource{"Hello", 900, 96000, []int64{200, 0, 0, 500}, 4, "1080", map[string]int{}}, out)
}

func TestNodeResource_Copy(t *testing.T) {
	tnr := NodeResource{"Hello", 1000, 96000, []int64{200, 600, 350, 0}, 4, "1080", map[string]int{}}
	nnr := tnr.Copy()
	assert.Equal(t, tnr, nnr)
}
