Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98EC1773B
	for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 06:21:07 +0000 (UTC)
Received: from [10.12.176.125] ([10.12.176.125])
	(user=m202071377@hust.edu.cn mech=PLAIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 34B6IdG3005001-34B6IdG5005001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 11 May 2023 14:18:39 +0800
Message-ID: <9935262d-a68b-edbf-0329-f755cbf99c45@hust.edu.cn>
Date: Thu, 11 May 2023 14:18:39 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] drm: sun4i_tcon: use devm_clk_get_enabled in
 `sun4i_tcon_init_clocks`
Content-Language: en-US
To: XuDong Liu <m202071377@hust.edu.cn>, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Boris Brezillon
 <bbrezillon@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: hust-os-kernel-patches@googlegroups.com, Dongliang Mu
 <dzm91@hust.edu.cn>,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230430112347.4689-1-m202071377@hust.edu.cn>
From: XuDong Liu <m202071377@hust.edu.cn>
In-Reply-To: <20230430112347.4689-1-m202071377@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FEAS-AUTH-USER: m202071377@hust.edu.cn

On 2023/4/30 19:23, XuDong Liu wrote:
> Smatch reports:
> drivers/gpu/drm/sun4i/sun4i_tcon.c:805 sun4i_tcon_init_clocks() warn:
> 'tcon->clk' from clk_prepare_enable() not released on lines: 792,801.
> 
> In the function sun4i_tcon_init_clocks(), tcon->clk and tcon->sclk0 are
> not disabled in the error handling, which affects the release of
> these variable. Although sun4i_tcon_bind(), which calls
> sun4i_tcon_init_clocks(), use sun4i_tcon_free_clocks to disable the
> variables mentioned, but the error handling branch of
> sun4i_tcon_init_clocks() ignores the required disable process.
> 
> To fix this issue, use the devm_clk_get_enabled to automatically
> balance enable and disabled calls. As original implementation use
> sun4i_tcon_free_clocks() to disable clk explicitly, we delete the
> related calls and error handling that are no longer needed.
> 
> Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
> Fixes: b14e945bda8a ("drm/sun4i: tcon: Prepare and enable TCON channel 0 clock at init")
> Fixes: 8e9240472522 ("drm/sun4i: support TCONs without channel 1")
> Fixes: 34d698f6e349 ("drm/sun4i: Add has_channel_0 TCON quirk")
> Signed-off-by: XuDong Liu <m202071377@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
> The issue is discovered by static analysis, and the patch is not tested
> yet.
> ---
>   drivers/gpu/drm/sun4i/sun4i_tcon.c | 19 ++++---------------
>   1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 523a6d787921..936796851ffd 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -778,21 +778,19 @@ static irqreturn_t sun4i_tcon_handler(int irq, void *private)
>   static int sun4i_tcon_init_clocks(struct device *dev,
>   				  struct sun4i_tcon *tcon)
>   {
> -	tcon->clk = devm_clk_get(dev, "ahb");
> +	tcon->clk = devm_clk_get_enabled(dev, "ahb");
>   	if (IS_ERR(tcon->clk)) {
>   		dev_err(dev, "Couldn't get the TCON bus clock\n");
>   		return PTR_ERR(tcon->clk);
>   	}
> -	clk_prepare_enable(tcon->clk);
>   
>   	if (tcon->quirks->has_channel_0) {
> -		tcon->sclk0 = devm_clk_get(dev, "tcon-ch0");
> +		tcon->sclk0 = devm_clk_get_enabled(dev, "tcon-ch0");
>   		if (IS_ERR(tcon->sclk0)) {
>   			dev_err(dev, "Couldn't get the TCON channel 0 clock\n");
>   			return PTR_ERR(tcon->sclk0);
>   		}
>   	}
> -	clk_prepare_enable(tcon->sclk0);
>   
>   	if (tcon->quirks->has_channel_1) {
>   		tcon->sclk1 = devm_clk_get(dev, "tcon-ch1");
> @@ -805,12 +803,6 @@ static int sun4i_tcon_init_clocks(struct device *dev,
>   	return 0;
>   }
>   
> -static void sun4i_tcon_free_clocks(struct sun4i_tcon *tcon)
> -{
> -	clk_disable_unprepare(tcon->sclk0);
> -	clk_disable_unprepare(tcon->clk);
> -}
> -
>   static int sun4i_tcon_init_irq(struct device *dev,
>   			       struct sun4i_tcon *tcon)
>   {
> @@ -1223,14 +1215,14 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
>   	ret = sun4i_tcon_init_regmap(dev, tcon);
>   	if (ret) {
>   		dev_err(dev, "Couldn't init our TCON regmap\n");
> -		goto err_free_clocks;
> +		goto err_assert_reset;
>   	}
>   
>   	if (tcon->quirks->has_channel_0) {
>   		ret = sun4i_dclk_create(dev, tcon);
>   		if (ret) {
>   			dev_err(dev, "Couldn't create our TCON dot clock\n");
> -			goto err_free_clocks;
> +			goto err_assert_reset;
>   		}
>   	}
>   
> @@ -1293,8 +1285,6 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
>   err_free_dotclock:
>   	if (tcon->quirks->has_channel_0)
>   		sun4i_dclk_free(tcon);
> -err_free_clocks:
> -	sun4i_tcon_free_clocks(tcon);
>   err_assert_reset:
>   	reset_control_assert(tcon->lcd_rst);
>   	return ret;
> @@ -1308,7 +1298,6 @@ static void sun4i_tcon_unbind(struct device *dev, struct device *master,
>   	list_del(&tcon->list);
>   	if (tcon->quirks->has_channel_0)
>   		sun4i_dclk_free(tcon);
> -	sun4i_tcon_free_clocks(tcon);
>   }
>   
>   static const struct component_ops sun4i_tcon_ops = {
Ping?
