// # app1 (3100)
// mkdir -p ~/app1 && cd ~/app1 && npm init -y && npm install express
// cat > app.js <<'EOF'
// const e=require('express');const a=e();const P=3100;
// a.get('/',(_,r)=>r.send('app1:3100')); a.get('/health',(_,r)=>r.send('ok'));
// a.listen(P,'127.0.0.1',()=>console.log('app1 on',P));
// EOF
// node app.js &


const e=require('express');const a=e();const P=3100;
a.get('/',(_,r)=>r.send('app1:3100')); a.get('/health',(_,r)=>r.send('ok'));
a.listen(P,'127.0.0.1',()=>console.log('app1 on',P));
