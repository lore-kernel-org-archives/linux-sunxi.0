Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0C710EA
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Oct 2022 06:47:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E61821042;
	Sun, 16 Oct 2022 23:47:40 -0700 (PDT)
Received: from [192.168.42.194] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1FBB3F792;
	Sun, 16 Oct 2022 23:47:33 -0700 (PDT)
Message-ID: <6d310c9a-fe29-49a7-3905-74a3b521d168@arm.com>
Date: Mon, 17 Oct 2022 07:47:11 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] sunxi: fix SUNIV D$ support
Content-Language: en-GB
To: Icenowy Zheng <uwu@icenowy.me>, Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20221013132645.2469041-1-uwu@icenowy.me>
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20221013132645.2469041-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2022 14:26, Icenowy Zheng wrote:

Hi Icenowy,

> Currently D$ support of SUNIV is broken because of duplicated definition
> of the D$ enabling function.
> 
> Mask the one in mach-sunxi to fix the build error when D$ is enabled,
> and enable the D$ on Lichee Pi Nano.

Ah, very nice. I was always wondering why we would need to disable the 
data cache, but it wasn't high enough on my list to investigate.

So indeed that both builds and works nicely: md5sum-ing 48MB goes from 
21 seconds down to 3 seconds now!

Will merge it as part of the first pull request.

Many thanks!
Andre


> 
> Icenowy Zheng (2):
>    sunxi: fix SUNIV build when enabling D-Cache
>    configs: sunxi: licheepi_nano: enable D-Cache
> 
>   arch/arm/mach-sunxi/board.c     | 2 +-
>   configs/licheepi_nano_defconfig | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 

