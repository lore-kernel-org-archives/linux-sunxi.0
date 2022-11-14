Received: from out199-16.us.a.mail.aliyun.com (out199-16.us.a.mail.aliyun.com [47.90.199.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92A61879
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 06:50:12 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R281e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0VUiKOlR_1668407663;
Received: from 30.97.48.62(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VUiKOlR_1668407663)
          by smtp.aliyun-inc.com;
          Mon, 14 Nov 2022 14:34:25 +0800
Message-ID: <5699ed28-bdad-f9ab-44b6-e957c00745f9@linux.alibaba.com>
Date: Mon, 14 Nov 2022 14:34:27 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 14/18] mfd: sprd-sc27xx-spi: Replace irqchip mask_invert
 with unmask_base
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, lee@kernel.org
Cc: mani@kernel.org, cristian.ciocaltea@gmail.com, wens@csie.org,
 tharvey@gateworks.com, cw00.choi@samsung.com,
 krzysztof.kozlowski@linaro.org, brgl@bgdev.pl, mazziesaccount@gmail.com,
 orsonzhai@gmail.com, zhang.lyra@gmail.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-15-aidanmacdonald.0x0@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20221112151835.39059-15-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2022 11:18 PM, Aidan MacDonald wrote:
> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   drivers/mfd/sprd-sc27xx-spi.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
> index d05a47c5187f..a4a9b81a952b 100644
> --- a/drivers/mfd/sprd-sc27xx-spi.c
> +++ b/drivers/mfd/sprd-sc27xx-spi.c
> @@ -181,11 +181,10 @@ static int sprd_pmic_probe(struct spi_device *spi)
>   	ddata->irq_chip.name = dev_name(&spi->dev);
>   	ddata->irq_chip.status_base =
>   		pdata->irq_base + SPRD_PMIC_INT_MASK_STATUS;
> -	ddata->irq_chip.mask_base = pdata->irq_base + SPRD_PMIC_INT_EN;
> +	ddata->irq_chip.unmask_base = pdata->irq_base + SPRD_PMIC_INT_EN;
>   	ddata->irq_chip.ack_base = 0;
>   	ddata->irq_chip.num_regs = 1;
>   	ddata->irq_chip.num_irqs = pdata->num_irqs;
> -	ddata->irq_chip.mask_invert = true;
>   
>   	ddata->irqs = devm_kcalloc(&spi->dev,
>   				   pdata->num_irqs, sizeof(struct regmap_irq),
