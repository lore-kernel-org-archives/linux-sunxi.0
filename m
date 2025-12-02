Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A393161BD
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Dec 2025 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684266; cv=none; b=H0rsfWY8yAacb9FIlOsAKLXn0cazYnssLPCGklhFck4+6qQVAAk1TdgnXND1wmsuciEWris5luDjrOuF5U1RXktAQdIp+lZuhSk/qiwgGuEqgdlINp/yN/nlZFuna+XxeYQMuLHjmt/dbOOnMxKLR5qK8V2gTA1KITmo5+YbCfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684266; c=relaxed/simple;
	bh=ak/Rt6uWiX+MT4pBJfZ+PD2Fezju7a0RibofMkxgxGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5KPv+v+WeFXUAwKiWtIyPXTj4r5aas2XIfK33iVfdXO+mFqoyvG9E0Hywe4BkNSv+L4bh0x7ZpIlKtcqKQiFiL1aXD79UWGcD8F3cQkAZF6bXXn2mBSEIJcujMn/rgTJiIYDmI34LNs2vScrK1513yd31v/mJKzZScD/pVCXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-295548467c7so63446695ad.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Dec 2025 06:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684264; x=1765289064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcG/XQXLp9HYcvharszf8uW0YuqvJnIwjKHOdBnLhz4=;
        b=hmjtgpzqJ1JJqg0lMtuoBfvdkwaYjH5zmMsfomboCD+DXrWe1tcX08lGwCo7ck4sKK
         30CooEyNLFdZwC75xoNwfS9oXdK6pkWAiRZgKJirg35nLeSb5Q5mKrorSkBMHgWKyTGU
         IWC4Aj5aR7Zcwq/DAICBnOHJ0IdZ5vTbtdKp315xJz72cai9ay8XQy4yyT32St+ntPtg
         ev2na9EsllibmsNzzm7JmOTn4kGMn+oaMLyAJQ4SldBtmxz80BxaxErYkumv9+LIUGw6
         LVgGknPHA92QTlQOUAqq0EjsoyfNEvWji8Ogb04Co6IvBkYpgt05qe30AlVjJH6uiqQ5
         K7eg==
X-Forwarded-Encrypted: i=1; AJvYcCURZ0RCjcDrWdVSk5xeDS7vBOdwTxiVA+agvjtuigKUlDAPbkcbACNSwYejM9TOhY4p04N+au57rk0aIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFJeL+XP7WZay/9i5xwShd1fNu/F5WOsBA8wtmSRcbW9of+fMY
	9gcyBpBvpUqOQHYYQ9JYVQ2ZOC/2a4EsMg6rIgGrSo401/T4GLhL511h0n8iZxZQ
X-Gm-Gg: ASbGncuPChcNCzyX3iq8hMM/zYr1B4ob0VYkANMuVg77zaZjJeXa5z9YXFxL5BIZv8L
	5n80l5v+8CKZCTcE0JYTCCPsjrGJfR7atoqrXmitBYmEzhLpKMhzzq2tN7WziedB6h0gMuE+6gi
	oDkE9iXxqFFa4V8aQq0OIxsZBON+3dhzHyE+pDZJ4RtLsQCDIDLaRQcVvX69rEfbgVtW/7gXr/c
	exJ95GQcXp7hRLRUaWt6b9VF0XgQIp0nHHCah7/5Dijqy8chvCqfBoqk5UyMCt5Qd01BqwlQEfp
	noSw/PlyAeBlKnrye0RAva9KOaAjhtajox55T2BcJU0RMi8c3LRFtjT5Q+FrfPgShUWO4g39PBi
	gTjJbEidQTMPFGeh3GnCmT0MNcEgh+0wRK1/2jFnJMiebiANV42i9mQTaBbJaxsWj5KJ4s8mSFs
	Pgf8ljVGAfz03mewzPTo4BeGVIshcQheMjJNDPsH6nvOpNFzS2WtYf
X-Google-Smtp-Source: AGHT+IF+kyNxzUpeXaXKWvkkdLFGEay0Qhj/KdyhsuZJTacZvEHrpSbc8LmG13T/u+0DtNsj7br8Xw==
X-Received: by 2002:a17:902:ef45:b0:298:3aa6:c034 with SMTP id d9443c01a7336-29b6bf3bc3fmr436250435ad.32.1764684263184;
        Tue, 02 Dec 2025 06:04:23 -0800 (PST)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com. [209.85.215.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb52d14sm155337705ad.82.2025.12.02.06.04.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:04:22 -0800 (PST)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bdb6f9561f9so4989605a12.3
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Dec 2025 06:04:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+zzz2aIpxMEf7CHoklUMdQ7DJZe+B0KoueIB9ZC4fhUk9G3PTLnyOJSV+kTazxgqbusK/EgOaT9Qs2A==@lists.linux.dev
X-Received: by 2002:a05:6102:26c9:b0:5dd:89c1:eb77 with SMTP id
 ada2fe7eead31-5e1de39d9cemr17004298137.29.1764683823416; Tue, 02 Dec 2025
 05:57:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 14:56:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnP_BfEGwKLqJN8UevZeVXg10-IsXC-lVqCY3H9e2HFkqZ11liOD_Kw768
Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzystof,

On Wed, 12 Nov 2025 at 11:37, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch, which is now commit 6ea891a6dd370ab2
("cpufreq: dt-platdev: Simplify with of_machine_get_match_data()")
in dt-rh/for-next.

> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -219,20 +219,13 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
>
>  static int __init cpufreq_dt_platdev_init(void)
>  {
> -       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> -       const struct of_device_id *match;
> -       const void *data = NULL;
> +       const void *data;
>
> -       if (!np)
> -               return -ENODEV;
> -
> -       match = of_match_node(allowlist, np);
> -       if (match) {
> -               data = match->data;
> +       data = of_machine_get_match_data(allowlist);
> +       if (data)
>                 goto create_pdev;
> -       }

I think this is a change in behavior:
Before, the pdev was created immediately if the node's compatible
value is found in allowlist, regardless of the value of data (which
is always NULL, except on RK3399),
After, the pdev is created immediately if the node's compatible value
is found in allowlist, AND data is non-NULL.

>
> -       if (cpu0_node_has_opp_v2_prop() && !of_match_node(blocklist, np))
> +       if (cpu0_node_has_opp_v2_prop() && !of_machine_device_match(blocklist))
>                 goto create_pdev;
>
>         return -ENODEV;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
