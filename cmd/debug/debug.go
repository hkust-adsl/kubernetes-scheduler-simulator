package debug

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var options = Options{}

// DebugCmd is only for debug
var DebugCmd = &cobra.Command{
	Use:   "debug",
	Short: "debug alpha feature",
	Run: func(cmd *cobra.Command, args []string) {
		if err := run(&options); err != nil {
			fmt.Printf("debug error: %s", err.Error())
			os.Exit(1)
		}
	},
}

func init() {
	options.AddFlags(DebugCmd.Flags())
	if err := DebugCmd.MarkFlagRequired("filepath"); err != nil {
		fmt.Printf("debug init error: %s", err.Error())
		os.Exit(1)
	}
}

func run(opt *Options) error {
	return nil
}
