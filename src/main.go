package main

import (
	"net/http"
	_ "net/http/pprof"
	"time"
)

func init() {
	go proListener()
}

func proListener() {
	http.ListenAndServe(":2112", nil)
}

func main() {
	sr := make(chan naught)
	go msgSend(sr)
	go msgReceive(sr)
	select {}
}

func msgSend(
	msg chan<- naught,
) {
	for {
		msg <- naught{}
	}
}

func msgReceive(
	msg <-chan naught,
) {
	tkr := time.NewTicker(1 * time.Millisecond)
	for {
		<-msg
		<-tkr.C
	}
}

type naught struct{}
