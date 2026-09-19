import { PrismaDelegate } from '@persistence/repositories/PrismaDelegate';

export async function findUnique
    <TEntity, TWhereUnique>(
        delegate: PrismaDelegate<
            TEntity,
            TWhereUnique,
            any,
            any,
            any
        >,
        where: TWhereUnique,
    ): Promise<TEntity | null> {
    const row = delegate.findUnique({ where });
    if (row && (row as any).isDeleted) {
        return null;
    }
    return row;
}

export async function findUniqueMapped
    <TEntity, TWhereUnique, TDomain>(
        delegate: PrismaDelegate<
            TEntity,
            TWhereUnique,
            any,
            any,
            any
        >,
        where: TWhereUnique,
        mapper: (row: TEntity) => TDomain,
    ): Promise<TDomain | null> {
    const row = await delegate.findUnique({ where });
    if (!row) {
        return null;
    }
    return mapper(row);
}

export async function findMany
    <TEntity, TWhereInput>(
        delegate: PrismaDelegate<
            TEntity,
            any,
            TWhereInput,
            any,
            any
        >,
        args?: {
            where?: TWhereInput;
            page?: number;
            pageSize?: number
        },
    ): Promise<TEntity[]> {
    const {
        where,
        page = 1,
        pageSize = 10
    } = args ?? {};
    return delegate.findMany({
        where: {
            ...where,
            isDeleted: false
        } as TWhereInput,
        skip:
            pageSize === -1 ? undefined : (Math.max(1, page) - 1) * pageSize,
        take:
            pageSize === -1 ? undefined : Math.max(1, pageSize),
    });
}

export async function create
    <TEntity, TCreateInput>(
        delegate: PrismaDelegate<
            TEntity,
            any,
            any,
            TCreateInput,
            any
        >,
        data: TCreateInput,
    ): Promise<TEntity> {
    return delegate.create({ data });
}

export async function update
    <TEntity, TWhereUnique, TUpdateInput>(
        delegate: PrismaDelegate<
            TEntity,
            TWhereUnique,
            any,
            any,
            TUpdateInput
        >,
        where: TWhereUnique,
        data: TUpdateInput,
    ): Promise<TEntity> {
    return delegate.update({
        where,
        data
    });
}

export async function softDelete
    <TEntity, TWhereUnique, TUpdateInput>(
        delegate: PrismaDelegate<
            TEntity,
            TWhereUnique,
            any,
            any,
            TUpdateInput
        >,
        where: TWhereUnique,
    ): Promise<TEntity> {
    return delegate.update({
        where,
        data: { isDeleted: true } as TUpdateInput
    });
}
