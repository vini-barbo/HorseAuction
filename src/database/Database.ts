import {Client} from 'pg'

class Database {
    public client = new Client

    public async connect() {
        console.log('teste')
        const res = await this.client.query('SELECT $1::text as message', ['Hello world!'])
        console.log(res,'12')
        console.log(res.rows[0].message)
        await this.client.end()
    }
}

export  { Database }