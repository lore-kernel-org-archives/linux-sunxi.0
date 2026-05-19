Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A7535201A
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200239; cv=none; b=oGuX82RkiSb+Ryk5V7qKjxYqm31lYb3vQFtmQRQbQHwAbGpR9xH4cPdkWE7FFe+Aq18NvSDyq1qLR5IicVGT1SWxbUS/Pclm2ooOAuO2oI8feTXzggqzn7nKb30CnprpU8k9WfQLabgscyKJjuAiBcsRCQRvzaWqp5Y6vTxb9eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200239; c=relaxed/simple;
	bh=JPEGfwYDm+wtJBdtPNA1uHSSeOC3hKxmFQdM64SV/Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=r7m06NHW+khagDcv2MYY3R5ECmj8B79tkIYpCaSj4bmv0oYfvD0SIjSC26ZOXdETJlxO5lAw+37OUCAhdfxq6BB4lJEQ1J4IpcN0Jk7hM0SFxQRtoPOTqnFlgd2VQW9ggUi4OmXnnddXvhLa35FM3kf0xR3v8g37972gsdZukcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S+kcyk4r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S+kcyk4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779200234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrmbyndpK9nGCZ/GyDIT140wuqKj2glshGplDtAamKU=;
	b=S+kcyk4rf32sh50k67HfdkyocPZY4exyTwpS2BGCJ+nTVwRE6UTeQhin8GqDq/TWwoaBpJ
	M7adoPI6qIZhcUuuQaeS6YyfnzgDJkMXf5fubSdkOUageYeAH3Fwcip6uaZvjBy/+YbiqP
	qVM/AP+4zr1ifm0rdMW5eNsoS6jlLLU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-3jQcxxZoPEGJ6XLQKWl0Rg-1; Tue, 19 May 2026 10:17:01 -0400
X-MC-Unique: 3jQcxxZoPEGJ6XLQKWl0Rg-1
X-Mimecast-MFC-AGG-ID: 3jQcxxZoPEGJ6XLQKWl0Rg_1779200217
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7dcc8f071b3so9397099a34.2
        for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 07:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200217; x=1779805017;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WrmbyndpK9nGCZ/GyDIT140wuqKj2glshGplDtAamKU=;
        b=ZHikGxP1fM5mbo7D7Aw+U/8mLJ2PgS4kISUtuR6AeHS8Tj/C/8yYtFmK3ADg+ealds
         2vjjSgd7IgIryr5PJyUQ27uqSNUMvZe0XMXqMmpTOGdSPbDQTpMm7qIrLZSJGnPMpKhg
         BlLHnCawpSUu1jDZq+xPZvAGZV9mEIknDyqwInSK+7u4pEQKiNGi4X/8t/dDJmUbimij
         h5oEdYlvJHin8QO4EM5IgjUU0UFVvy7Qt1vSRk6ee66BN15t3ljqFhEtiRVNzmGaTU8f
         zIFgj5Qg5UnlTdlrVL3COKpfBURxRApJvNtbAFyWtCdiSe65kMgaPsb31V9R4b6WqlEO
         Ejrg==
X-Forwarded-Encrypted: i=1; AFNElJ+xYnI4Ycbp2urm08Aj4CVQZzJLvts19SO6mGwx6LHZq8gq7eVQEAhFSoiQ784cuBhvaZAEABz+IUvaYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcWXaJRRO3vuJ1bfCNHM601GIfOG+G+xOeZm9UcRMcm+F3Fsar
	rYDId8dsIwZHd0vQgZyNrNin2dd6GEvb2sU2yYiJEUhffjhg0YXlH8tR1rrT5NvyocKlPKOX8lK
	0n/RzSaTjOeyFYtCVK1iJgWOGa3kiohFkzz8avQXV0v7wErZbPcNUMWZOlzuhunUE
X-Gm-Gg: Acq92OG4hEGvgy3llWV8JjVoqkeMEg+46kopqohDmMeTW12PEYYPHL2YbbP9yyj086a
	1XAcI9tT9pVTjUmhOeaL48lV9cVAeb+wZoLBUxylVCWXThRZODRLgUA5nAWq5tyy2rucpNcl+4v
	MhW1ghrUTrcYwUibfEmhvXRF9u+58t0jZnq6mjmqDV8o2LGLp7+Ief4lkRmt8Wx/qjUZdKMacWl
	TVWvTl2EIXiICHwJswY3nW9vsuwM7CyefQt2wZhqxYGaMKxl/bIqcz1IzKLcbIk6+JaCC9GR+R4
	JZvnKUHEwFJm/5Sv5gzY6OnBqH1h/DvubHPiEiDvivPh8CuIgLgflO6iSwYRHAeZ+RmW0BeeeFi
	cdaqvErpntF+hwTjE2JGeIVJEiQEjOm7sSGFHlKCfGAuT4xCUIigzPsEV
X-Received: by 2002:a05:6830:4704:b0:7dc:e090:68a with SMTP id 46e09a7af769-7e4de651649mr13481227a34.0.1779200217232;
        Tue, 19 May 2026 07:16:57 -0700 (PDT)
X-Received: by 2002:a05:6830:4704:b0:7dc:e090:68a with SMTP id 46e09a7af769-7e4de651649mr13481185a34.0.1779200216870;
        Tue, 19 May 2026 07:16:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51645856d4esm163498791cf.27.2026.05.19.07.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:16:56 -0700 (PDT)
Date: Tue, 19 May 2026 10:16:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: Use of_device_get_match_data()
Message-ID: <agxw1glcXB2fpA-s@redhat.com>
References: <20260519003950.626727-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260519003950.626727-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k57viAB34LWh9PjNvodUt_QP_hZyiWFip0yGjEtNrh0_1779200217
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rosen,

On Mon, May 18, 2026 at 05:39:50PM -0700, Rosen Penev wrote:
> Use of_device_get_match_data() to fetch the RTC CCU match data directly
> instead of open-coding an of_match_device() lookup.
> 
> This also lets the driver drop the of_device.h include.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> index f6bfeba009e8..a3cf0dde05be 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -9,7 +9,6 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
> 
>  #include <linux/clk/sunxi-ng.h>
> 
> @@ -353,14 +352,12 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
>  {
>  	const struct sun6i_rtc_match_data *data;
>  	struct clk *ext_osc32k_clk = NULL;
> -	const struct of_device_id *match;
> 
>  	/* This driver is only used for newer variants of the hardware. */
> -	match = of_match_device(sun6i_rtc_ccu_match, dev);
> -	if (!match)
> +	data = of_device_get_match_data(dev);

sun6i_rtc_ccu_match becomes unused after this change. It'll use the
table associated the dev from drivers/rtc/rtc-sun6i.c.

Brian


> +	if (!data)
>  		return 0;
> 
> -	data = match->data;
>  	have_iosc_calibration = data->have_iosc_calibration;
> 
>  	if (data->have_ext_osc32k) {
> --
> 2.54.0
> 

