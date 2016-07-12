<dns-edit-row>
  <td><input name="host" type="text" value={opts.body.host}/></td>
  <td><input name="ipaddress" type="text" value={opts.body.ipaddress}/></td>
  <td><a href="#dns" onClick={ saveHandler }>save</a></td>

  <script>
   var self = this;
   var host = this.opts.body.host;
   var ipaddress = this.opts.body.ipaddress;

   saveHandler(e) {
     new_host = self.host.value;
     new_ipaddress = self.ipaddress.value;
     if(host!=new_host){
       superagent.post(config.apibaseuri + '/dns/hosts/')
                 .set("Content-Type", "application/x-www-form-urlencoded")
                 .send({host: host, new_host: new_host})
                 .end();
     }
     if(ipaddress!=new_ipaddress){
       superagent.post(config.apibaseuri + '/dns/ipaddress/')
                 .set("Content-Type", "application/x-www-form-urlencoded")
                 .send(JSON.stringify({host: new_host, new_ipaddress: new_ipaddress}))
                 .end();
     }
     return true;
   }
  </script>
</dns-edit-row>
