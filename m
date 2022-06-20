Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7603205
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 18:28:49 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id m1so8039474wrb.2
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 11:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EbH61xgbcQFZqiKdtF3EiTrlMIA03mVcXgcJh8nFhYw=;
        b=mSQEmLJ0Fn5QVozsHIogGY5NXi+9CJYGRIz8gpuc1yRs1WXusV7NLcUOAPe/oDHd+p
         CGfunJlCmJ3FttTozAiBihvuQo80brGH5cxd7esS/dJ8+prrLrD9NYWnUklcB1Wn/L9D
         4xSjQZ8Ht1+2KVRUzP+G9tpz8dK5qZdWFtEcKKIo3UWWd5lQCv7rPsKZhCW5toVy38+V
         HzYrtpJ5nPWn9oymuE5UJnlGqTc5qT4epprO+dTLcXI+5zwNJsTsQNUu7WMD9R9VluLf
         yzP0plxjqlwIb92S1XFNdmlBBMjgngHOZahcjJtaSnvziwMaVFoUKTmPGRSoHc1Y+Zlh
         1dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EbH61xgbcQFZqiKdtF3EiTrlMIA03mVcXgcJh8nFhYw=;
        b=h952O/0RbJWT7jnt05U4UWXxmhipFkGQEApV5MQAJIO+YgZFzeWyID1Vm5fhE3fcHr
         89qODVpXd4+uqTdvchH2YcEoaLCHhxUau7SPKyYgphftpMtHY6UwTNziwM5CBjMSTIcp
         UQRC8JNZ4Qf+KVofMzT0YYA0X4M7AXb36uBOY1FiRFiyc25Ka3cPWnIiIGXCBzGVe3c7
         bMdLwTALZf5A9GPWHgYgPDnk8NyY4tWh8vamO/IxehiCMFkFcQXAr+BXY/WZkxOzPCaq
         +/k2jXcEz8CiFa6ZlphgFUjPWfjrPU/B3WsKmGMoSNkgdtGWSIgaD/jxoyac2EcmoIzp
         9fKQ==
X-Gm-Message-State: AJIora/qiHWe7BLQDjGV5IKU8m6vcYiDpPpTn5QICCVmKbnC4J1Uf+go
	RuAileBCOGT7CqIBvtBvGMI=
X-Google-Smtp-Source: AGRyM1t14bVeWv+aaSXZzdp98dSIn+wgQmnAILYuJY07t+yPD4z3EwzouaR/YGr9cTVVtwEooMSWGA==
X-Received: by 2002:a5d:584c:0:b0:218:4ee2:38fd with SMTP id i12-20020a5d584c000000b002184ee238fdmr24050138wrf.584.1655749727868;
        Mon, 20 Jun 2022 11:28:47 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id l8-20020a1ced08000000b0039744bd664esm19254682wmh.13.2022.06.20.11.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 11:28:47 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Vinod Koul <vkoul@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dmaengine: sun6i: Set the maximum segment size
Date: Mon, 20 Jun 2022 20:28:46 +0200
Message-ID: <3494277.R56niFO833@kista>
In-Reply-To: <20220617034209.57337-1-samuel@sholland.org>
References: <20220617034209.57337-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 17. junij 2022 ob 05:42:09 CEST je Samuel Holland napisal(a):
> The sun6i DMA engine supports segment sizes up to 2^25-1 bytes. This is
> explicitly stated in newer SoC documentation (H6, D1), and it is implied
> in older documentation by the 25-bit width of the "bytes left in the
> current segment" register field.

At least A10 user manual says 128k max in description for Byte Counter 
register (0x100+N*0x20+0xC), although field size is defined as 23:0, but that's 
still less than 2^25-1. A20 supports only 128k too according to manual. New 
quirk should be introduced for this.

Best regards,
Jernej

> 
> Exposing the real segment size limit (instead of the 64k default)
> reduces the number of SG list segments needed for a transaction.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Tested on A64, verified that the maximum ALSA PCM period increased, and
> that audio playback still worked.
> 
>  drivers/dma/sun6i-dma.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index b7557f437936..1425f87d97b7 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dmapool.h>
>  #include <linux/interrupt.h>
> @@ -1334,6 +1335,8 @@ static int sun6i_dma_probe(struct platform_device 
*pdev)
>  	INIT_LIST_HEAD(&sdc->pending);
>  	spin_lock_init(&sdc->lock);
>  
> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(25));
> +
>  	dma_cap_set(DMA_PRIVATE, sdc->slave.cap_mask);
>  	dma_cap_set(DMA_MEMCPY, sdc->slave.cap_mask);
>  	dma_cap_set(DMA_SLAVE, sdc->slave.cap_mask);
> -- 
> 2.35.1
> 
> 


