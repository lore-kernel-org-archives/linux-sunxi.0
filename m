Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BC410F7
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Oct 2022 09:28:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 555341042;
	Mon, 17 Oct 2022 02:28:25 -0700 (PDT)
Received: from [192.168.42.194] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D59693F792;
	Mon, 17 Oct 2022 02:28:17 -0700 (PDT)
Message-ID: <97797679-987c-b5b9-8444-c16f0bbb5159@arm.com>
Date: Mon, 17 Oct 2022 10:27:56 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] configs: sunxi: licheepi_nano: enable D-Cache
Content-Language: en-GB
To: Icenowy Zheng <uwu@icenowy.me>, Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20221013132645.2469041-1-uwu@icenowy.me>
 <20221013132645.2469041-3-uwu@icenowy.me>
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20221013132645.2469041-3-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2022 14:26, Icenowy Zheng wrote:
> As the compile error when D-Cache is enabled is gone, we can have
> D-Cache enabled now.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>   configs/licheepi_nano_defconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_defconfig
> index a9776bbcac..b80d32c502 100644
> --- a/configs/licheepi_nano_defconfig
> +++ b/configs/licheepi_nano_defconfig
> @@ -1,7 +1,6 @@
>   CONFIG_ARM=y
>   CONFIG_SKIP_LOWLEVEL_INIT_ONLY=y
>   CONFIG_SPL_SKIP_LOWLEVEL_INIT_ONLY=y
> -CONFIG_SYS_DCACHE_OFF=y
>   CONFIG_ARCH_SUNXI=y
>   CONFIG_DEFAULT_DEVICE_TREE="suniv-f1c100s-licheepi-nano"
>   CONFIG_SPL=y

