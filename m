Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA474182C3
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jun 2023 11:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C68C433C8;
	Tue, 27 Jun 2023 11:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687867164;
	bh=OMH79suvV90YGL/6hCh1wogF4ewTEowNOGyXoNxRihs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1vprvjajWvHh2Q9wrPdei22SiZ0xoAlXqJXE+YES9kzBAIg7VI2Fl8iz4Ay00fEd
	 RzFkALzAVVcgMPsDUddXn45o1Xt71kYRIsRPJcJznH8ECJhPw2L7VZM3dpIZViNas/
	 FjnS0SFvuJvU0TPHhkem19iKqIQhH4Oy4qxgdXdwxiC/m+Z+QRRLThw3tLskHLTuCU
	 hKsNK+aXyN9IGTOdKLJueM2FTHm9cQX4LTTLZB+JnU8+dz66n4i6PGoyIe0xmG+AFR
	 8xIgI2ddjPuedG9sE2RyO3GKKKTURJOgIHe4Bpu4qNdJNginaQDl+Sh2iP81BCwZDD
	 z0OYwpx5dFrSw==
Date: Tue, 27 Jun 2023 13:59:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: sun6i-p2wi: Fix an error message in probe()
Message-ID: <20230627115920.c4ms65vgrbiyekc6@intel.intel>
References: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>

Hi Dan,

On Tue, Jun 27, 2023 at 10:12:36AM +0300, Dan Carpenter wrote:
> The "ret" variable is uninitialized.  It was the "p2wi->rstc" variable
> that was intended.  We can also use the %pe string format to print the
> error code name instead of just the number.
> 
> Fixes: 75ff8a340a81 ("i2c: sun6i-p2wi: Use devm_clk_get_enabled()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> index ad8270cdbd3e..fa6020dced59 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -250,7 +250,8 @@ static int p2wi_probe(struct platform_device *pdev)
>  
>  	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
>  	if (IS_ERR(p2wi->rstc)) {
> -		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
> +		dev_err(dev, "failed to retrieve reset controller: %pe\n",
> +			p2wi->rstc);

Yes, good catch! Thanks! But I think we want to print the error
value here, so I think it should be:

-		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
+		dev_err(dev, "failed to retrieve reset controller: %d\n",
+			PTR_ERR(p2wi->rstc));

Andi

>  		return PTR_ERR(p2wi->rstc);
>  	}
>  
> -- 
> 2.39.2
> 
