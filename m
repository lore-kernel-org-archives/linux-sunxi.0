Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAFD10F7
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Oct 2022 09:26:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ECCC1042;
	Mon, 17 Oct 2022 02:26:44 -0700 (PDT)
Received: from [192.168.42.194] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64B453F792;
	Mon, 17 Oct 2022 02:26:37 -0700 (PDT)
Message-ID: <ba42f4fd-359a-d748-939b-9eef240fcbce@arm.com>
Date: Mon, 17 Oct 2022 10:26:12 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] sunxi: fix SUNIV build when enabling D-Cache
Content-Language: en-GB
To: Icenowy Zheng <uwu@icenowy.me>, Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20221013132645.2469041-1-uwu@icenowy.me>
 <20221013132645.2469041-2-uwu@icenowy.me>
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20221013132645.2469041-2-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2022 14:26, Icenowy Zheng wrote:
> The enable_caches function in architecture-specific board code is only
> necessary for V7A CPUs, code for both V8A and ARM926 have already
> declared this function.
> 
> Only provide our implementation of enable_caches() for V7A CPUs.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Merging into sunxi/master.

Cheers,
Andre

> ---
>   arch/arm/mach-sunxi/board.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> index 62bb40b8c8..60ccf909db 100644
> --- a/arch/arm/mach-sunxi/board.c
> +++ b/arch/arm/mach-sunxi/board.c
> @@ -488,7 +488,7 @@ void reset_cpu(void)
>   }
>   #endif
>   
> -#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF) && !defined(CONFIG_ARM64)
> +#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF) && defined(CONFIG_CPU_V7A)
>   void enable_caches(void)
>   {
>   	/* Enable D-cache. I-cache is already enabled in start.S */

