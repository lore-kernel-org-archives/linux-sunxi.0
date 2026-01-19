Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44B322D7B6
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768851034; cv=none; b=rKF2jWUmK0ZktjbV30OsKQwC8YREh6WSjfQb6/27mf+3CkjqJgL0CMXqZ20+wkRzWFrR8pia+iVP2LYQNelk5rfoqAkAISVIdL8eL+jEKWFwireNI7BS0RNHDWjvSs/a4q6LGJaL21fkRDboQG6+XvBiNQMqYXZ9Vj77ok2t8Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768851034; c=relaxed/simple;
	bh=mMp6iFxraRTP7W2rjXz9S3lRqN19hV6viOdRrtle5z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P87u+HqrfxnODMCLMpF617fbzwkAkqZH0QyhCM2Qt5R0XNw6HmZ/DAxPb/mVkJkZ3zU7Amm6CYkj0YV5UQNpGZxcyP/Jt1kvRPO7Ykg4ELqxRB6QTkEtg3AnYZYn/4fWDxHMa2bxET3Jk1jwd+FwPijWoH3rgrPCZ1cjOkeaWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81dbc0a99d2so2316813b3a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768851033; x=1769455833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCb1Q/eNGJuZWnaSy0QMCWG02dACV3WSdsoPlEt9HTE=;
        b=iTwfmqxFHGeHHxGALUNkEwBQOl+pftOspv25lKJpJOXoL4AZoiYvd9YMNz0KPAKR8Q
         Vm5klGShgoNRlDkPuXeOQHvOr53oZXGjBIyc1J8luWIBOPZlGZ33p2FeAllbDW2x85Ej
         YfqBJi5QjArQZVIpEEaqU9xHKCtkTQNqznMMd1m0jPYmFzfSbeOwm/l437Jc+NKPsHCV
         Gl8Hnb46zP9OVNakRBBhwGZCHbNZdJfXKFgXiUVLJQxX98PeaTl7yfm9FvbUG9uUePcX
         BHQZAfhFfS7ps6iwzr56YE/exo0DddO2Txd5ay4Vxq1TmBFHHh9jNv/KQkshvBZDdiLH
         KCsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQr8cL+Ap9zUdjlFPXroM9DvrETjkee5mqNwrEIaPGT4kw9GOFc/hZqKuelEZEo0alUP6P/K0jOqyujQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy4hSpQWGKysXpmVT5NDgI0+sdRVwqcpZ5VXEVmRiY84CdnT6U
	D7UrYqitf5uR3FepnRDwzdMTCe1gt4vkU6robis+viObfcBjKjPFyY5G/bovc85n
X-Gm-Gg: AY/fxX5L91fc8jrLw5VfaS7u5LVdASGPxFYEfs+0M1vXlQm7DvD+Fus0Zkgx4Itb6z/
	6aIsqcYzqb8YohtFqnXZFNxZzxNWSTDp8r1OlrY2RGFprNEwIu+Rx4d0x5gF4N7izMwVECi0GWh
	mhD/WIjRbeE8GvN0P1FCuS1SQoQiP52sRPg1iSYpZmSw0uap32XIjZfcGoDHL68r1xclDz+7YY0
	/jDT8u2bVzutHAJSp6GoeC6C39F+qc/F6ctg36mHn+dOdlVJSVAwix8gSQyn2hl+1sU+coYvLnz
	nuhEz5qOzgezOl0X4j5FuuHzQIWXiHcq5MA0eVlnfKv2M3QBZANKOHEtx3fe532reADtuqkMRoQ
	o/3ZAUlWirjSnd70/8FdaWgPGtDEo8aaSyiXEJFeL3gbzEThgTsaNARfRp0Msk14DOAyxLdSBvh
	+XS+emMQLZmk10eXaIMZp77nURjINqJiEa42B7mK3gT2kze+DB+28=
X-Received: by 2002:a05:6a00:808:b0:81c:6ca8:8007 with SMTP id d2e1a72fcca58-81fa03b431fmr12224359b3a.69.1768851032858;
        Mon, 19 Jan 2026 11:30:32 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108c23esm9980040b3a.8.2026.01.19.11.30.32
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:30:32 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6c6f89f23so5121548eec.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:30:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbEepXN+iGmc6Wx3ebn2KCuQXhXiyvf8fhREflWruzP2D6M9xXY8R8nqypDSHyYUuWFtAvNiOXBvaptQ==@lists.linux.dev
X-Received: by 2002:a05:6102:44d2:10b0:5f1:c453:b5ab with SMTP id
 ada2fe7eead31-5f1c453b6acmr1782180137.13.1768850612507; Mon, 19 Jan 2026
 11:23:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:23:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXt69AywBVsY3DKH+cS52=Cw1xsvvBDBV3MXirZ+LYj+A@mail.gmail.com>
X-Gm-Features: AZwV_Qja2okCrIX9za1x2Adx7NBF3Qx2Xd3iJQm2I4PbFkiFeek_zkUKX3woR2E
Message-ID: <CAMuHMdXt69AywBVsY3DKH+cS52=Cw1xsvvBDBV3MXirZ+LYj+A@mail.gmail.com>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Some SoC drivers reimplement the functionality of
> soc_device_get_machine(). Make this function accessible through the
> sys_soc.h header. Rework it slightly to return a negative error number
> on failure to read the machine string (SoC core can keep on ignoring
> it). While at it: make it use the __free() helper from cleanup.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,6 +5,7 @@
>   * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/glob.h>
>  #include <linux/idr.h>
> @@ -111,17 +112,18 @@ static void soc_release(struct device *dev)
>         kfree(soc_dev);
>  }
>
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>  {
> -       struct device_node *np;
> -
>         if (soc_dev_attr->machine)
> -               return;
> +               return -EBUSY;
> +
> +       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> +       if (!np)
> +               return -ENOENT;
>
> -       np = of_find_node_by_path("/");
> -       of_property_read_string(np, "model", &soc_dev_attr->machine);
> -       of_node_put(np);
> +       return of_property_read_string(np, "model", &soc_dev_attr->machine);

I am not so fond of these of_find_node_by_path("/") + something replacements.
What about adding an of_machine_get_model() helper?

>  }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>
>  static struct soc_device_attribute *early_soc_dev_attr;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
