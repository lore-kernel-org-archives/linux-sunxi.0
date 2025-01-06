Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0547148316
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jan 2025 16:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736180359; cv=none; b=RlORxIJgpHoGqfohOlXPPB5vBkJS3M5ufgFT0CGgqi6bxmC1m0DWBDdOueiTRrJcI75g+jR5qwpN3tz/1oEFDVQ5xJgYj8erxgBO6EczFlU63Srsh0Su3dSxTz6AHuh5fJ+SyVRUSYSzAX/S5HbKL5UnqwK8fbR2hp2I4pl1SrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736180359; c=relaxed/simple;
	bh=pQcrsINi1b4av2nM8uBnjgbG/1A93CFDXR3VxrW04ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PNvdDOiWkvryYbbgPbd4nNrjBfXOwmppf0UA4/uai14UC3izwmoAUPlFGqUYhh8YGtwL85V9Sgcg8+lIMv7tZfVqbtT8m86b/pRxgrczg/WSScbYDDC94kSX5ytELPaC9j2hUielh2EI+vhMF2j+cB2CijlNQ80Ae9id5hWp/kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kGMFjM3h; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kGMFjM3h"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506G54D8008507;
	Mon, 6 Jan 2025 17:18:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	2l6yGUMAqbBbwFW6T71mdO7jHSTqEhQG1rr7BQEsO6Q=; b=kGMFjM3h7NgVsYRH
	sTDFUvjsY7nRFqcWC41fapUVOOjxPxIzPV0GhJ6I76BTRvN3JRupEM12x5+WjuRE
	QGjPW4TGSpM34q/pVspvuA7KlWDb8sv+i0hJY1ilGF4blZPMmy4OSTa9IjF7s3nT
	73X1rNQwBuf609nv1iJLQif0j6BpLISUIV+diQ6c2gkbLtCFbWO7Cdh6ufa+faW1
	JlnYNM6c1efGaQRCa50UObTQ1IgYN42R+tiejmvE9/VrtTcZzetsNfvhiS0esDzJ
	y8QrhEzqbX8P+9bkzHXJdVpccSGQsOGTegWmBWtCfAsFU2JZi567zF3xx3MNLLuc
	sRJMmg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 440jcur1a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:18:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1CB4340048;
	Mon,  6 Jan 2025 17:17:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E864E28EFA9;
	Mon,  6 Jan 2025 17:16:10 +0100 (CET)
Received: from [10.252.22.94] (10.252.22.94) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 17:16:09 +0100
Message-ID: <85acb818-43db-4d4e-aef2-33a2ce25a45b@foss.st.com>
Date: Mon, 6 Jan 2025 17:16:08 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
To: Sean Nyekjaer <sean@geanix.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec
	<jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Yannick
 Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01


On 11/25/24 14:49, Sean Nyekjaer wrote:
> Check if the required pixel clock is in within .5% range of the
> desired pixel clock.
> This will match the requirement for HDMI where a .5% tolerance is allowed.
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_modes.h     |  2 ++
>  2 files changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4d977b297f5d5359 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
>  }
>  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
>  
> +/**
> + * drm_mode_validate_mode
> + * @mode: mode to check
> + * @rounded_rate: output pixel clock
> + *
> + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> + * CVT spec reuses that tolerance in its examples, so it looks to be a
> + * good default tolerance for the EDID-based modes. Define it to 5 per
> + * mille to avoid floating point operations.
> + *
> + * Returns:
> + * The mode status
> + */
> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
> +					    unsigned long long rounded_rate)
> +{
> +	enum drm_mode_status status;
> +	unsigned long long rate = mode->clock * 1000;
> +	unsigned long long lowest, highest;
> +
> +	lowest = rate * (1000 - 5);
> +	do_div(lowest, 1000);
> +	if (rounded_rate < lowest)
> +		return MODE_CLOCK_LOW;
> +
> +	highest = rate * (1000 + 5);
> +	do_div(highest, 1000);
> +	if (rounded_rate > highest)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +EXPORT_SYMBOL(drm_mode_validate_mode);

Hi,

With an agreement reached by everyone on the name of this function:

Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Regards,
Raphaël

> +
>  static enum drm_mode_status
>  drm_mode_validate_basic(const struct drm_display_mode *mode)
>  {
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index b9bb92e4b0295a5cbe0eb0da13e77449ff04f51d..4b638992f3e50d2aba5088644744457d72dbe10a 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -549,6 +549,8 @@ bool drm_mode_equal_no_clocks(const struct drm_display_mode *mode1,
>  			      const struct drm_display_mode *mode2);
>  bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
>  					const struct drm_display_mode *mode2);
> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
> +					    unsigned long long rounded_rate);
>  
>  /* for use by the crtc helper probe functions */
>  enum drm_mode_status drm_mode_validate_driver(struct drm_device *dev,
>
