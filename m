Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A152F3A
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Oct 2022 12:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473D1C433C1;
	Sun,  2 Oct 2022 12:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664713524;
	bh=64h18y9fPdujBM0cHUc9smnYVb6OLKSHJiNc+3sLYmM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OKPRGH9a5AYUZkI4knlqEx8Q+UZ9vgzEKuhmB4JieXaMFPPRAr/2xL90lawciPTC/
	 EtUP+87rreCLthq16auvgwWSQy5g2iN27aQH5Nn7a2kdskuyCSI5Waw/bDdsygqDBY
	 olBjWqx2+UzwM1vlYo0FgHw0EJN2hx+jwtsYWDNfGkmuoe6yK2vfjs4gJA7LWM1OFF
	 pRTGXEXLPmU7IvGXHlhogpVjxE7vSp63SY1r9C20di8x/hlajvlgllxbnWqxNkUGFb
	 809wHJkFbkYZFTaZltxndMzERE9aW41MW7B/MMjI+a8i+cGKK8LpAR/m5zxb1kwnj5
	 nJnzrfl2mHddA==
Date: Sun, 2 Oct 2022 13:25:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: <lars@metafoo.de>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <linux-iio@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH -next] iio: adc: sun4i-gpadc-iio: fix PM disable depth
 imbalance in sun4i_gpadc_probe
Message-ID: <20221002132539.01aeaf0b@jic23-huawei>
In-Reply-To: <20220926150206.133549-1-zhangqilong3@huawei.com>
References: <20220926150206.133549-1-zhangqilong3@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Sep 2022 23:02:06 +0800
Zhang Qilong <zhangqilong3@huawei.com> wrote:

> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context.
> 
> Fixes:b0a242894f11d ("iio: adc: sun4i-gpadc-iio: register in the thermal after registering in pm")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Hi

There seems to be more wrong in the error handling in this function than your patch is fixing.

If you hit this error path, then the iio_map_array path has potentially been called, so
this should be a goto err_map I think.  Also, if this succeeds, but the
devm_iio_device_register() does not we don't unwind the thermal_zone registration.

Jonathan

> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
> index a6ade70dedf8..ec0b09878d54 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -648,7 +648,8 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev,
>  				"could not register thermal sensor: %ld\n",
>  				PTR_ERR(info->tzd));
> -			return PTR_ERR(info->tzd);
> +			ret = PTR_ERR(info->tzd);
> +			goto err_pm;
>  		}
>  	}
>  
> @@ -663,7 +664,7 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
>  err_map:
>  	if (!info->no_irq && IS_ENABLED(CONFIG_THERMAL_OF))
>  		iio_map_array_unregister(indio_dev);
> -
> +err_pm:
>  	pm_runtime_put(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  

