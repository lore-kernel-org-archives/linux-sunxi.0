Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465BF7B
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Oct 2022 12:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C9BC433C1;
	Sun, 23 Oct 2022 12:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666528258;
	bh=txv/VZ48QlWYPj1rI5kTtpkFJ8N9XQyDv6UNywfYTkA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NprI60awG2EyXK9yiOlKxlIocNuiy1sN0IMh2pIh4awEKdmo38tkVY5v1AEIspB4U
	 CvzUsiseIGOqiGG+G1H5RNTySX9J2KewjAcutAyO7WCBd3sYXgtSHBn7H0pAfnO+/8
	 3cKScTyaKryi9dDe4hdZ86dBjnI1J+11cXCxjOPzbs02gIHq3uQXJasaBNDXNTk1Oa
	 UcncOcWrCXz964muXizy9RaV0dN7uZCWoaHpvNqkuTQ7wXl2QJG0vSQjX+a2skG4Fj
	 VT89pmHMJBMaxdrxsHyycM2cnUxgIjHZWL1Vio6d0/o33X5svcnH4VTHafKQEk46tu
	 dFAQKvga5HIVg==
Date: Sun, 23 Oct 2022 13:31:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: <lars@metafoo.de>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <linux-iio@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH v2 1/2] iio: adc: sun4i-gpadc-iio: Fix PM disable depth
 imbalance in sun4i_gpadc_probe()
Message-ID: <20221023133134.3af0415c@jic23-huawei>
In-Reply-To: <20221020124045.77678-2-zhangqilong3@huawei.com>
References: <20221020124045.77678-1-zhangqilong3@huawei.com>
	<20221020124045.77678-2-zhangqilong3@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Oct 2022 20:40:44 +0800
Zhang Qilong <zhangqilong3@huawei.com> wrote:

> The pm_runtime_enable will increase power disable depth.
> Thus a pairing decrement is needed on the error handling
> path to keep it balanced according to context. In addtion,
> the iio_map_array path has potentially been called.
> 
> We fix it by gotoing err_map when thermal_zone register
> failed.
> 
> Fixes: b0a242894f11 ("iio: adc: sun4i-gpadc-iio: register in the thermal after registering in pm")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
As mentioned in review of patch 2 there are other problems in here that
will probably be better cleaned up by taking the whole lot over
to devm

Thanks,

Jonathan

> ---
> v2:
> - revert iio_map_array if it's necessary when thermal_zone
>   register failed.
> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
> index a6ade70dedf8..d2535dd28af8 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -648,7 +648,8 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev,
>  				"could not register thermal sensor: %ld\n",
>  				PTR_ERR(info->tzd));
> -			return PTR_ERR(info->tzd);
> +			ret = PTR_ERR(info->tzd);
> +			goto err_map;
>  		}
>  	}
>  

