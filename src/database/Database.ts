import { Client } from 'pg'

class Database {
    public client: Client

    constructor() {
        this.client = new Client({
            user: 'postgres',
            host: 'localhost',
            database: 'HorseAuction',
            password: '2020',
            port: 3000,
        })
        this.client.connect()
        this.test()
    }

    public async test() {
        const res = await this.client.query('SELECT $1::text as message', ['Hello world!'])
        console.log(res, '12')
        console.log(res.rows[0].message)
        await this.client.end()
    }
}

export { Database }