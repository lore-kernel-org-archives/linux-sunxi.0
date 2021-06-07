Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2FD29CA
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 13:19:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76DCD61245
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 13:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623071956;
	bh=J61pmu1j6ryUYserdHWBlYXXfYgPMBBoZsm7N71ZXTo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=luDGpmoMaPqOz6JQKS2C869/LKwIckgqB98U7tTCwqBtuuE29lcxn0qFaGPJvG5hb
	 Lc/r7hiFU/49WgjIepztF13Mtg1P6vHbsLx3fAWYEu6Jl7U+T91r5HGpubKgTyH8DZ
	 +Pf6AiJhIqcSfZhUGrUY3uI7Nm5VrzMaY9CxhqZyY9TPTPsviEuiHHP8+su2eo2doq
	 Kr7ldUKVElE/SQVFfuQ9fCyyCdPBFn77FuyGDsmzz/V3/0Ho3RftrJ70F3gt6AzCbx
	 B0aav7Ojadb5A+PFUGzng6SKqMaO5LAK/0iuYPSnUTWAuiuiXWaEgDWLq4i4BZIULa
	 0CI/SIIgWMCqA==
Received: by mail-ed1-f47.google.com with SMTP id r7so5921653edv.12
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun 2021 06:19:16 -0700 (PDT)
X-Gm-Message-State: AOAM533NxikUstxJwJVCqxykpXr3QQs9z6tHPqEEqRCfSRz4ELjJL03t
	PlMuUmRk5pTE023jIpCavCbzmnR4Cb6SZ89vtw==
X-Google-Smtp-Source: ABdhPJxzNlBS2VOpGlScoot1ij4UCYezPM7U/GRvFvlIEwgG7TrZboNzbJF0wUeqhr9QzxmTbA30S0QW1GcfIlRBKQY=
X-Received: by 2002:a05:6402:1d0f:: with SMTP id dg15mr17392452edb.137.1623071954956;
 Mon, 07 Jun 2021 06:19:14 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210603144216.10327-1-s-anna@ti.com>
In-Reply-To: <20210603144216.10327-1-s-anna@ti.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 7 Jun 2021 08:19:03 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+mhJgFZniXYTVf5ZEM84APhm2w_ozLJg_pFtgz+W_wYw@mail.gmail.com>
Message-ID: <CAL_Jsq+mhJgFZniXYTVf5ZEM84APhm2w_ozLJg_pFtgz+W_wYw@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: hwlock: sun6i: Fix various warnings in binding
To: Suman Anna <s-anna@ti.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, 
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 9:42 AM Suman Anna <s-anna@ti.com> wrote:
>
> The allwinner,sun6i-a31-hwspinlock.yaml binding has a mismatched
> $id and fails to compile the example due to undefined args specifier
> values for clocks and resets. Fix both of these issues.
>
> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Wilken,
>
> This fixes the warnings for now on linux-next, but I think the example
> should be including sun6i-a31-ccu.h files instead to be accurate, and
> those files are missing the definitions for CLK_BUS_SPINLOCK and
> RST_BUS_SPINLOCK. Feel free to send a newer version or do an incremental
> patch on top.
>
> regards
> Suman
>
>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
