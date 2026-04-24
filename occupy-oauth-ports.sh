#!/bin/bash
bun -e 'for(const p of [14589,14590,14591])Bun.serve({port:p,fetch:()=>new Response("busy")});console.log("Ports occupied: 14589, 14590, 14591");setInterval(()=>{},1000)'
