Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B6BECF
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 12:53:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B303D165C;
	Tue, 21 Jun 2022 05:53:43 -0700 (PDT)
Received: from [10.57.85.30] (unknown [10.57.85.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 508173F534;
	Tue, 21 Jun 2022 05:53:42 -0700 (PDT)
Message-ID: <d732b5d7-1945-f9c5-98a9-4dc891acd744@arm.com>
Date: Tue, 21 Jun 2022 13:53:41 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dmaengine: sun6i: Set the maximum segment size
Content-Language: en-GB
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220617034209.57337-1-samuel@sholland.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220617034209.57337-1-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-06-17 04:42, Samuel Holland wrote:
> The sun6i DMA engine supports segment sizes up to 2^25-1 bytes. This is
> explicitly stated in newer SoC documentation (H6, D1), and it is implied
> in older documentation by the 25-bit width of the "bytes left in the
> current segment" register field.
> 
> Exposing the real segment size limit (instead of the 64k default)
> reduces the number of SG list segments needed for a transaction.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Tested on A64, verified that the maximum ALSA PCM period increased, and
> that audio playback still worked.
> 
>   drivers/dma/sun6i-dma.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index b7557f437936..1425f87d97b7 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -9,6 +9,7 @@
>   
>   #include <linux/clk.h>
>   #include <linux/delay.h>
> +#include <linux/dma-mapping.h>
>   #include <linux/dmaengine.h>
>   #include <linux/dmapool.h>
>   #include <linux/interrupt.h>
> @@ -1334,6 +1335,8 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>   	INIT_LIST_HEAD(&sdc->pending);
>   	spin_lock_init(&sdc->lock);
>   
> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(25));

Similarly to my comment on the DRM patch, "SZ_32M - 1" might be clearer 
here.

Thanks,
Robin.

> +
>   	dma_cap_set(DMA_PRIVATE, sdc->slave.cap_mask);
>   	dma_cap_set(DMA_MEMCPY, sdc->slave.cap_mask);
>   	dma_cap_set(DMA_SLAVE, sdc->slave.cap_mask);
