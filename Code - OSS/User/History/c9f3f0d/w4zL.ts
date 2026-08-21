import { Router } from 'express';
import { container } from 'tsyringe';
import { SmartRouter } from '@webapi/utils/smartRouter';
import {
    getUserOwnDataResponseDto,
    GetUserOwnData,
    GetUserOwnDataResponseDto
} from '@application/services/users/queries/GetUserOwnData';
import {
    createUserRequestDto,
    createUserResponseDto,
    CreateUser,
    CreateUserRequestDto,
    CreateUserResponseDto
} from '@application/services/users/commands/CreateUser';
import {
    getUserByIdRequestDto,
    getUserByIdResponseDto,
    GetUserById,
    GetUserByIdRequestDto,
    GetUserByIdResponseDto
}
    from '@application/services/users/queries/GetUserById';
import {
    updateUserByIdRequestDto,
    updateUserByIdResponseDto,
    UpdateUserById,
    UpdateUserByIdRequestDto,
    UpdateUserByIdResponseDto
} from '@application/services/users/commands/UpdateUserById'


export function UserRouter(): Router {


    const userRouter = new SmartRouter('/users');


    const getUserOwnData = container.resolve(GetUserOwnData);
    userRouter.defineRoute<unknown, unknown, GetUserOwnDataResponseDto>({
        method: 'get',
        path: '/me',
        requireAuth: true,
        tag: 'Users Management',
        summary: 'Get user Data',
        responseSchema: getUserOwnDataResponseDto,
        successStatus: 200,
        handler: () => {
            return getUserOwnData.execute()
        },
    });


    const createUser = container.resolve(CreateUser);
    userRouter.defineRoute<CreateUserRequestDto, unknown, CreateUserResponseDto>({
        method: 'post',
        path: '/',
        requireAuth: true,
        tag: 'Users Management',
        summary: 'Create user',
        bodySchema: createUserRequestDto,
        responseSchema: createUserResponseDto,
        successStatus: 201,
        handler: ({ body }) => {
            return createUser.execute(body)
        },
    });


    const getUserById = container.resolve(GetUserById);
    userRouter.defineRoute<unknown, GetUserByIdRequestDto, GetUserByIdResponseDto>({
        method: 'get',
        path: '/:id',
        requireAuth: true,
        tag: 'Users Management',
        summary: 'Get user By Id',
        paramsSchema: getUserByIdRequestDto,
        responseSchema: getUserByIdResponseDto,
        successStatus: 200,
        handler: ({ params }) => {
            return getUserById.execute(params)
        },
    });


    const updateUser = container.resolve(UpdateUserById);
    userRouter.defineRoute<UpdateUserByIdRequestDto, { id: string }, UpdateUserByIdResponseDto>({
        method: 'put',
        path: '/:id',
        requireAuth: true,
        tag: 'Users Management',
        summary: 'Update user data fields',
        paramsSchema: updateUserByIdRequestDto.pick({ id: true }),
        bodySchema: updateUserByIdRequestDto,
        responseSchema: updateUserByIdResponseDto,
        successStatus: 200,
        handler: ({ params, body }) => {
            body.id = params.id;
            return updateUser.execute(body)
        },
    });


    return userRouter.expressRouter;
}
