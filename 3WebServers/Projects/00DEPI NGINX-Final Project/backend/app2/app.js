// 
// # app2 (3200)
// mkdir -p ~/app2 && cd ~/app2 && npm init -y && npm install express
// cat > app.js <<'EOF'
// const e=require('express');const a=e();const P=3200;
// a.get('/',(_,r)=>r.send('app2:3200')); a.get('/health',(_,r)=>r.send('ok'));
// a.listen(P,'127.0.0.1',()=>console.log('app2 on',P));
// EOF
// node app.js &


const e=require('express');const a=e();const P=3200;
a.get('/',(_,r)=>r.send('app2:3200')); a.get('/health',(_,r)=>r.send('ok'));
a.listen(P,'127.0.0.1',()=>console.log('app2 on',P));
