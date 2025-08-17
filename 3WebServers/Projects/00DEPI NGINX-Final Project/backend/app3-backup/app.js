// 
// # backup app3 (3500)
// mkdir -p ~/app3 && cd ~/app3 && npm init -y && npm install express
// cat > app.js <<'EOF'
// const e=require('express');const a=e();const P=3500;
// a.get('/',(_,r)=>r.send('app3-backup:3500')); a.get('/health',(_,r)=>r.send('ok'));
// a.listen(P,'127.0.0.1',()=>console.log('app3 on',P));
// EOF
// node app.js &


const e=require('express');const a=e();const P=3500;
a.get('/',(_,r)=>r.send('app3-backup:3500')); a.get('/health',(_,r)=>r.send('ok'));
a.listen(P,'127.0.0.1',()=>console.log('app3-backup on',P));
