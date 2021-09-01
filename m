Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA8D3FCD
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Sep 2021 13:55:06 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id i28so5088506ljm.7
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Sep 2021 06:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=1qbLir7t00tIXtsSOowis8wzBunbda5Sb7xAud87L5k=;
        b=uG/5F+o1v8/SIUcCtTARgam4bmRy8nw+0FXW+/SosC09XjMMhDoazsa7gvTxhU1nGi
         +rAfhvJdQA0iAw0a0Caz2lgIuqkbjQjPUpUlVmLLtEBU5sPlmAQCbT48H0zQvOiJgF2h
         Ev1yOTyf5fceZRGRBSL76irx+fidnYynkX+4WT6SPyMxvst0jM3lrU3Hp2m5Vy0hjQgS
         Lzvar/YfL7m7b7Erljbwhg/8COG5AQZdB4lJqytdgTv1nwWruCCTtHzPkcSRLN8KMkzm
         NP+jiiPNMEalhDwsVrFR6v/51Rkx1o/kJGjaYF6T0HKw+tRo7n9YSu+R7VAcJYaNAcBx
         rNyA==
X-Gm-Message-State: AOAM530o6A5mtAixDA9LyROlemcHXVmjOJaOgkyy7OBg8qdS4PYcLZQY
	8UPTXa1W9J1lu5Ne3DME7ZmEMRhemZS+GA==
X-Google-Smtp-Source: ABdhPJw0X7MBea4lea9mlZ9geMKJem/jY2Qx9DUqDxrR0UBYHh8eMgQMbx8fbgWSL+tm7qhDrgtVRg==
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr29024841ljk.121.1630504505001;
        Wed, 01 Sep 2021 06:55:05 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id w16sm1007565lfn.83.2021.09.01.06.55.03
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 06:55:04 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id k13so6625049lfv.2
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Sep 2021 06:55:03 -0700 (PDT)
X-Received: by 2002:a05:6512:3f89:: with SMTP id x9mr26306205lfa.233.1630504503566;
 Wed, 01 Sep 2021 06:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210901050526.45673-1-samuel@sholland.org> <20210901050526.45673-6-samuel@sholland.org>
In-Reply-To: <20210901050526.45673-6-samuel@sholland.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 1 Sep 2021 21:54:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v668_prQ8zw9rX3=Xi9L73cqqo+KhUN_4m8OUzF0qhCH1A@mail.gmail.com>
Message-ID: <CAGb2v668_prQ8zw9rX3=Xi9L73cqqo+KhUN_4m8OUzF0qhCH1A@mail.gmail.com>
Subject: Re: [PATCH 5/8] clk: sunxi-ng: Export symbols used by CCU drivers
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 1:05 PM Samuel Holland <samuel@sholland.org> wrote:
>
> For the individual drivers to be built as modules, the ops structs and
> callback registration functions must be exported. None of the helper
> functions are exported, because they are only referenced from the
> corresponding ops structs. of_sunxi_ccu_probe is not exported, because
> it is only used for built-in early OF clock providers.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/clk/sunxi-ng/ccu_common.c | 2 ++
>  drivers/clk/sunxi-ng/ccu_div.c    | 1 +
>  drivers/clk/sunxi-ng/ccu_gate.c   | 1 +
>  drivers/clk/sunxi-ng/ccu_mp.c     | 2 ++
>  drivers/clk/sunxi-ng/ccu_mult.c   | 1 +
>  drivers/clk/sunxi-ng/ccu_mux.c    | 2 ++
>  drivers/clk/sunxi-ng/ccu_nk.c     | 1 +
>  drivers/clk/sunxi-ng/ccu_nkm.c    | 1 +
>  drivers/clk/sunxi-ng/ccu_nkmp.c   | 1 +
>  drivers/clk/sunxi-ng/ccu_nm.c     | 1 +
>  drivers/clk/sunxi-ng/ccu_phase.c  | 1 +
>  drivers/clk/sunxi-ng/ccu_reset.c  | 1 +
>  12 files changed, 15 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
> index 31af8b6b5286..3ab109582646 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.c
> +++ b/drivers/clk/sunxi-ng/ccu_common.c
> @@ -83,6 +83,7 @@ int ccu_pll_notifier_register(struct ccu_pll_nb *pll_nb)
>         return clk_notifier_register(pll_nb->common->hw.clk,
>                                      &pll_nb->clk_nb);
>  }
> +EXPORT_SYMBOL_GPL(ccu_pll_notifier_register);

These symbol names aren't exactly specific to sunxi. Maybe we could apply
symbol namespaces?

ChenYu
