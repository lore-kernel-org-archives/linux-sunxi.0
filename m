Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EEA2C81
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Oct 2021 17:21:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF44A1FB;
	Sun, 10 Oct 2021 10:21:15 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 684EA3F694;
	Sun, 10 Oct 2021 10:21:14 -0700 (PDT)
Date: Sun, 10 Oct 2021 18:19:46 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, wens@csie.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: sun50i-de2: Adjust printing error message
Message-ID: <20211010181848.7b0ac8d4@slackpad.fritz.box>
In-Reply-To: <20211010071812.145178-1-jernej.skrabec@gmail.com>
References: <20211010071812.145178-1-jernej.skrabec@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 10 Oct 2021 09:18:12 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> SRAM driver often returns -EPROBE_DEFER and thus this bus driver often
> prints error message, even if it probes successfully later. This is
> confusing for users and they often think that something is wrong.
> 
> Use dev_err_probe() helper for printing error message. It handles
> -EPROBE_DEFER automatically.

Ah, many thanks for just fixing this, it was indeed confusing people.
And thanks for pointing to this useful helper!

Would this actually be a candidate for stable?

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/bus/sun50i-de2.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
> index 672518741f86..414f29cdedf0 100644
> --- a/drivers/bus/sun50i-de2.c
> +++ b/drivers/bus/sun50i-de2.c
> @@ -15,10 +15,9 @@ static int sun50i_de2_bus_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	ret = sunxi_sram_claim(&pdev->dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Error couldn't map SRAM to device\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Couldn't map SRAM to device\n");
>  
>  	of_platform_populate(np, NULL, NULL, &pdev->dev);
>  

