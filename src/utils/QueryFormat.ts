class QueryFormat {

    private static extractObject(object: object) {
        const result: string[][] = [];

        Object.entries(object).forEach(([key, value]) => {
            result.push([key, value]);
        });

        return result;
    }

    private static findQuery(object: object) {

    }
}