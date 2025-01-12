package main

import (
	"net"
	"fmt"
	"os"
)

func handleConn(conn *net.UDPConn) {
  fmt.Println("handleConn")

  i := 0
  for {
    i++
    buf := make([]byte, 1024)
    rlen, _, err := conn.ReadFromUDP(buf)
    if err != nil {
      fmt.Println(err)
    }
    fmt.Println(string(buf[0:rlen]))
    fmt.Println(i)
    //go handlePacket(buf, rlen)
  }

	// conn.Close()

}

func main() {
	fmt.Println("starting")

	addr, _ := net.ResolveUDPAddr("udp", ":9999")
	conn, err := net.ListenUDP("udp", addr)
	if err != nil {
		panic(err)
	}
	defer conn.Close()


	fmt.Printf("udpServer is a %T\n", addr)
	handleConn(conn)

	os.Exit(0)
}