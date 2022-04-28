Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C667B
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Apr 2022 11:12:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EB2B1474;
	Thu, 28 Apr 2022 04:12:49 -0700 (PDT)
Received: from [10.57.80.98] (unknown [10.57.80.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DF4F3F774;
	Thu, 28 Apr 2022 04:12:45 -0700 (PDT)
Message-ID: <7b09e989-0aa1-a557-485e-572f69caf881@arm.com>
Date: Thu, 28 Apr 2022 12:12:39 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 5/5] iommu/sun50i: Ensure the IOMMU can be used for DMA
Content-Language: en-GB
To: Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20220428010401.11323-1-samuel@sholland.org>
 <20220428010401.11323-6-samuel@sholland.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220428010401.11323-6-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-04-28 02:04, Samuel Holland wrote:
> So far, the driver has relied on arch/arm64/Kconfig to select IOMMU_DMA.
> Unsurprisingly, this does not work on RISC-V, so the driver must select
> IOMMU_DMA itself.

No, IOMMU_DMA should only be selected by the architecture code that's 
also responsible for calling iommu_setup_dma_ops(). Without that, this 
select will do nothing other than add some unused code to the kernel image.

I appreciate that the current state of the x86 IOMMU drivers being 
tightly-coupled to the x86 arch code might be confusing (which reminds 
me I'd totally forgotten about [1]). I'm about to start reworking the 
whole area anyway, but for now please just follow the existing intent.

Thanks,
Robin.

[1] 
https://lore.kernel.org/linux-iommu/9ba6f2e8568a3ff6a94fade66668d99705433c44.1631536879.git.robin.murphy@arm.com/

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>   drivers/iommu/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index c79a0df090c0..70a0bfa6d907 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -223,6 +223,7 @@ config SUN50I_IOMMU
>   	depends on ARCH_SUNXI || COMPILE_TEST
>   	select ARM_DMA_USE_IOMMU
>   	select IOMMU_API
> +	select IOMMU_DMA
>   	help
>   	  Support for the IOMMU introduced in the Allwinner H6 SoCs.
>   
