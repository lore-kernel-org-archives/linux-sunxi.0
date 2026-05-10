Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BEA31578E
	for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 18:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778439128; cv=none; b=osFpivL091daN1wUA4Nds7CA+6X+fo8uOW9ThOjiVVvfyRQzfWa1r504ZDN5bgGJZEpCOVsdaZynXafIQk/gUIr4HAWjaWjb2jwIWZngQ07YjH4Ij/JNxFhvoSAipxqz/jSPuDOt7yU9NlF8Mnmpf9RxLomnZfXTDWXhWh0ECag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778439128; c=relaxed/simple;
	bh=6X37JkWmCFqA7bbHPeQuhtJy5NShMty3XT8KC4xBePI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mf5QjV7r+4PSHPQ3qANic2I32EpLOJrF/M7QEA8y/G9TYfTGIiI0z1r4ZkDp0iKNKLAe0Hap+6gUx9E9Vh1w96wZSHQtVmt1SHza3mXkHK728WydIHrGcLuEt3fwgK4fNDjiFSqCPlkB6U7AMAvosqvcNF4ZjjeVJJsGCVwITvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=uNtaI4C4; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="uNtaI4C4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778439126;
 bh=zXfZDjohjcuqqa3l+apN8rP0uDgPRGjuDvE54ZzEqGY=;
 b=uNtaI4C4LWCqWdN6zG6sQ0Lv3j/NSdRkxsN3YntSOkmDYM6dlZ/Sm3ntF6bqimFUIUEsloJIr
 Fe+aTtlvCKcVgvCMVZLHrFTS0JP+15ycL4Q7TGkslQB7rz+aqYIkZJw+ymdOxjQ3sdTVNEJxw8P
 p6qtkUIWP42ZYpvmzyxoPkXgpmvVCzjcQUK3GeBG9iwazIdFTcf5EYH825dC+sfJbJ7/B9G24XW
 I166gZiMPxG99pRHrz71inIPmzAhhw+kCgKxvNT++3sW9AY8qDfPCMSJGe7DYkHq3eJdIePXEYS
 qEBoxFIwPM9hqUseOMcd1qYq80y4Ya+iHxPT71KufNoA==
X-Forward-Email-ID: 6a00d34a0f7977181662816c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <ba52fb4e-72a1-4a92-a094-52e305e37c37@kwiboo.se>
Date: Sun, 10 May 2026 20:49:39 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] drm/bridge: dw-hdmi: Pass bridge attach flags for
 dw_hdmi_bind()
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, wens@kernel.org, samuel@sholland.org,
 luca.ceresoli@bootlin.com, Laurent.pinchart@ideasonboard.com,
 jernej.skrabec@gmail.com, victor.liu@nxp.com,
 dmitry.baryshkov@oss.qualcomm.com, shengjiu.wang@nxp.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20260403070032.447102-1-damon.ding@rock-chips.com>
 <20260403070032.447102-2-damon.ding@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260403070032.447102-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Damon,

On 4/3/2026 9:00 AM, Damon Ding wrote:
> For Rockchip and Allwinner platforms, the HDMI encoder attaches the
> dw-hdmi bridge via dw_hdmi_bind(). This additional bridge attach flag
> serves as preparation for the Rockchip dw-hdmi driver to support the
> bridge-connector framework.

We should not extend the dw_hdmi_bind() function with a new flag.

Each driver can instead call dw_hdmi_probe() and drm_bridge_attach() on
their own, similar as the other dw-hdmi drivers that currently use the
bridge connector.

Regards,
Jonas

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 5 +++--
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       | 2 +-
>  include/drm/bridge/dw_hdmi.h                | 4 +++-
>  4 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index ada45e8b3e2c..dd50dda3a4f5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3619,7 +3619,8 @@ EXPORT_SYMBOL_GPL(dw_hdmi_remove);
>   */
>  struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
>  			     struct drm_encoder *encoder,
> -			     const struct dw_hdmi_plat_data *plat_data)
> +			     const struct dw_hdmi_plat_data *plat_data,
> +			     enum drm_bridge_attach_flags flags)
>  {
>  	struct dw_hdmi *hdmi;
>  	int ret;
> @@ -3628,7 +3629,7 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
>  	if (IS_ERR(hdmi))
>  		return hdmi;
>  
> -	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, 0);
> +	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, flags);
>  	if (ret) {
>  		dw_hdmi_remove(hdmi);
>  		return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index 0dc1eb5d2ae3..21b141b7cb9c 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -608,7 +608,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>  
>  	platform_set_drvdata(pdev, hdmi);
>  
> -	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
> +	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data, 0);
>  
>  	/*
>  	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index 96532709c2a7..04173335f7e7 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -188,7 +188,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	platform_set_drvdata(pdev, hdmi);
>  
> -	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
> +	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data, 0);
>  
>  	/*
>  	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 8500dd4f99d8..e789fb451ef2 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -6,6 +6,7 @@
>  #ifndef __DW_HDMI__
>  #define __DW_HDMI__
>  
> +#include <drm/drm_bridge.h>
>  #include <sound/hdmi-codec.h>
>  
>  struct drm_display_info;
> @@ -182,7 +183,8 @@ void dw_hdmi_remove(struct dw_hdmi *hdmi);
>  void dw_hdmi_unbind(struct dw_hdmi *hdmi);
>  struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
>  			     struct drm_encoder *encoder,
> -			     const struct dw_hdmi_plat_data *plat_data);
> +			     const struct dw_hdmi_plat_data *plat_data,
> +			     enum drm_bridge_attach_flags flags);
>  
>  void dw_hdmi_resume(struct dw_hdmi *hdmi);
>  

