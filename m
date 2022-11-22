Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF8B7E
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Nov 2022 02:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=S5UQwhQ86B3Sk/yj+YA+vYGEBxKXXRDQ5dJk/qGX/I8=; b=bWjPQkvTLxBsmebw/tihw0Co9f
	r7fMuNokzwFEwD2FFdcmraInf+ey5ldekR6juJOTwFopwInVwCvBCOVS7dFMftkbW13Tc7MaLQ9XC
	K4dBYgsuFCZjdnhuQENexY47JwK4vsaSMcb3jffm+KRuVXSivOKFh8rqyOlHEcKqWDmjMfaS7eZv4
	7DudSvHzIsQIA6sm9QNdG7qw4fBE1Z8CayLyQS6nGavLqdX92ox4zpxpwQG/MyhHt+s+lpBytrqkx
	h+52XYCf77Yu8JvZ4mLsNQSlS1PuTixw7vBYxO7CMwUIirOAfwVrRrr2D4N2YPwht6nVmS/oFq6v7
	pluGnCbQ==;
Received: from [2601:1c2:d80:3110::a2e7]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxIkr-002M9O-Db; Tue, 22 Nov 2022 02:11:21 +0000
Message-ID: <c9cf3c02-fb48-33bd-4a3b-987209c7c21d@infradead.org>
Date: Mon, 21 Nov 2022 18:11:20 -0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH -next] clk: Fix one kernel-doc comment
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, mturquette@baylibre.com
Cc: sboyd@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20221122011616.1530-1-yang.lee@linux.alibaba.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20221122011616.1530-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 11/21/22 17:16, Yang Li wrote:
> drivers/clk/sunxi-ng/ccu_mmc_timing.c:54: warning: expecting prototype for sunxi_ccu_set_mmc_timing_mode(). Prototype was for sunxi_ccu_get_mmc_timing_mode() instead
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3230
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/clk/sunxi-ng/ccu_mmc_timing.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_mmc_timing.c b/drivers/clk/sunxi-ng/ccu_mmc_timing.c
> index de33414fc5c2..c6a6ce98ca03 100644
> --- a/drivers/clk/sunxi-ng/ccu_mmc_timing.c
> +++ b/drivers/clk/sunxi-ng/ccu_mmc_timing.c
> @@ -43,7 +43,7 @@ int sunxi_ccu_set_mmc_timing_mode(struct clk *clk, bool new_mode)
>  EXPORT_SYMBOL_GPL(sunxi_ccu_set_mmc_timing_mode);
>  
>  /**
> - * sunxi_ccu_set_mmc_timing_mode: Get the current MMC clock timing mode
> + * sunxi_ccu_get_mmc_timing_mode: Get the current MMC clock timing mode

function name and description should be separated by a '-' instead of ':'.

>   * @clk: clock to query
>   *
>   * Returns 0 if the clock is in old timing mode, > 0 if it is in

-- 
~Randy
