﻿// Copyright © 2023-present https://github.com/dymproject/purest-admin作者以及贡献者

using Microsoft.Extensions.DependencyInjection;

namespace PurestAdmin.Core.Cache;
public static class PurestCacheExtensions
{
    public static IServiceCollection AddPurestCache(this IServiceCollection services)
    {
        services.AddSingleton<IPurestCache, PurestMemoryCache>();
        return services;
    }
}
