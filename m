Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DCF173
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Jul 2021 05:51:31 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id x14so2249907edr.12
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 22:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YHRp36bG7u+FDs07iyp7QzfPeLS/I55OgAKDF8o9L94=;
        b=FZOPUJR1gQbr22sAT5Saa+mI22aj6qruvYvSs7/wIydCI6ebW1KtLYSILQMlvbenhB
         EjO8eU+szBhrfNefXbiPc1J3lIi5BV9cECBAdd0EhZMkNMQ4c5zJuYVrEHKTjGVcX3cK
         dKYDJs7neavGxXy8QYHzo12oBgHLhwLKivtOdyDH6kRbKKCIfKoWE5gAUEp5mxmu4jrI
         bfqGo+G00yWMtsC03MdGaMklz7VgAGPEH7brzWu/CC/IBGbJeuXzR1820u5TDq1O/hHP
         JoDY9kswbb1IZ0lbJIWW+56YREJWNcta7618eFGWNlHkDi9GJW8URzW+uKbhdfRtHsPY
         Yynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YHRp36bG7u+FDs07iyp7QzfPeLS/I55OgAKDF8o9L94=;
        b=AB4Dog5sXtm/2YyMaNz0CeXt6p3Ic6+XTi7Ptyvzz7QxrZgkKCjD3+9A2B1F0w9qwR
         of5YUO6P8iH94DPJRt+wGtXMO17V5l+FonmWa20qZZ0PyQSh0z/ioGNyjF9SU214mg2m
         j3JMzx7nhxgMxIiKSZh5qZcPL2CAkvl2hrRRwRtBazYbhWivCuj5J+AZuHHnFR8Cs1YK
         oz4mUmbuFGjsXMZuHjUuzvh7JN4nIYEgdJTHF/WEs0nYsqlhhYaiQOJaB/iaXCYpaQFG
         4+DgYQoUcuc4u2SpIaFPly3eVbcwCl/BYHf2Cx+Zx1jsVKkl8xAaOWEjPTyt7bNbZj9a
         NB6A==
X-Gm-Message-State: AOAM531acWXGqphj/Tq9yxlS6+7MSxJt8IpRho80cTMxcAeZtSOjhfMP
	cIFgSpczkLaeGzsAMl62yCo=
X-Google-Smtp-Source: ABdhPJzBif2Cr3WzuHeQVHxcmoB882c4Z1w13ZVQVWoBKMdPjMB6SiODhbMqbZA2/zvIzxObdMgnCA==
X-Received: by 2002:a05:6402:22c6:: with SMTP id dm6mr14793005edb.228.1627192290109;
        Sat, 24 Jul 2021 22:51:30 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id n17sm135390edr.84.2021.07.24.22.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 22:51:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 04/11] rtc: sun6i: Add support for linear day storage
Date: Sun, 25 Jul 2021 07:51:28 +0200
Message-ID: <2045295.MUk6NRVmsd@kista>
In-Reply-To: <20210723153838.6785-5-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com> <20210723153838.6785-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre!

Dne petek, 23. julij 2021 ob 17:38:31 CEST je Andre Przywara napisal(a):
> Newer versions of the Allwinner RTC, as for instance found in the H616
> SoC, no longer store a broken-down day/month/year representation in the
> RTC_DAY_REG, but just a linear day number.
> The user manual does not give any indication about the expected epoch
> time of this day count, but the BSP kernel uses the UNIX epoch, which
> allows easy support due to existing conversion functions in the kernel.
> 
> Allow tagging a compatible string with a flag, and use that to mark
> those new RTCs. Then convert between a UNIX day number (converted into
> seconds) and the broken-down day representation using mktime64() and
> time64_to_tm() in the set_time/get_time functions.
> 
> That enables support for the RTC in those new chips.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 66 +++++++++++++++++++++++++++--------------
>  1 file changed, 44 insertions(+), 22 deletions(-)

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


