package simon

import (
	goflag "flag"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	cliflag "k8s.io/component-base/cli/flag"
	"os"

	"github.com/hkust-adsl/kubernetes-scheduler-simulator/cmd/apply"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/cmd/doc"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/cmd/version"
)

const (
	EnvLogLevel = "LOGLEVEL"
	LogPanic    = "PANIC"
	LogFatal    = "FATAL"
	LogError    = "ERROR"
	LogWarn     = "WARN"
	LogInfo     = "INFO"
	LogDebug    = "DEBUG"
	LogTrace    = "TRACE"
)

func NewSimonCommand() *cobra.Command {
	simonCmd := &cobra.Command{
		Use:   "simon",
		Short: "Simon is a simulator, which will simulate a cluster and simulate workload scheduling.",
	}

	simonCmd.AddCommand(
		version.VersionCmd,
		apply.ApplyCmd,
		doc.GenDoc.DocCmd,
	)
	simonCmd.SetGlobalNormalizationFunc(cliflag.WordSepNormalizeFunc)
	simonCmd.Flags().AddGoFlagSet(goflag.CommandLine)
	simonCmd.DisableAutoGenTag = true

	return simonCmd
}

func init() {
	logLevel := os.Getenv(EnvLogLevel)
	switch logLevel {
	case LogPanic:
		log.SetLevel(log.PanicLevel)
	case LogFatal:
		log.SetLevel(log.FatalLevel)
	case LogError:
		log.SetLevel(log.ErrorLevel)
	case LogWarn:
		log.SetLevel(log.WarnLevel)
	case LogInfo:
		log.SetLevel(log.InfoLevel)
	case LogDebug:
		log.SetLevel(log.DebugLevel)
	case LogTrace:
		log.SetLevel(log.TraceLevel)
	default:
		log.SetLevel(log.InfoLevel)
	}
}
