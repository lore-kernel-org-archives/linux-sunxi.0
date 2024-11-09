Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8335119ABAC
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Nov 2024 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731168172; cv=none; b=jdz/m/QPt43fKJ4IqAaf1rhDntieQR4ca3GOjjiWLlD/9nmen9p6YZf8Rj5ts64zxaXjhzXfBuvu+0KACQy5gYY1nkMUixF0/a2Z+/5xgtlRsYk5b9Rj8BLxcaPX4CRYhGO/Tk0hXl4vEOeNhw6OMmLy5966+Z8xA/33b+QpyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731168172; c=relaxed/simple;
	bh=JNRz9V8zybDxy33qe+xTMatn1D6PMQo1GuPUrhcHyiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auz3MGPtOKJ6wyO15IiXW/dIyTWyRlKquyJoU6Xmg3kfX/d5asd5uwrjDX+Jbt7y3yKrMbXfFhRTh6t3nQ3aP/KnMPpele4m/rucVjKL/qmInqMtsW2OMjB6KR5WY0znPzO1PWZm3mDbzTbwsNca/RcLNc+fdFToXyfOi1FoAsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53d8c08cfc4so553599e87.3
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Nov 2024 08:02:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731168167; x=1731772967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oenLxzEzs2z/WFco/RA5EkTJEBkKi12h1iB/gMJYaSM=;
        b=AIwk/f2yndur6H8Kc7kBjrdfDfbF5iybiYwqd7ZcsGS29SB3YzgcrOPuk2SRhaTMBf
         uDmCGJawqKIxIP++ODJJM+Yx4UagkhaR7gltHCxdtk5wE1zkI/Rvzl1FIHTP+qwCdHPQ
         odpdZ9l9g9H3P3irv+9CEECoAdxA4pZeHmsonQur58AsjBtFw+EgyeXkQ5Fjg2dOunzX
         J556CjVdt44kvwLLmlY3LKydnzuSDcx9k7RRpTqpTr7HKR/jj521TkXZDBwNGozmXkCg
         GhgwcaEjwroK6czJnEMQ8HKiSKkdptIRIO8hzYRnG7TLC33NmpPBxikMvO7cGDCy2Z2Y
         jI4A==
X-Forwarded-Encrypted: i=1; AJvYcCVMrkD5Q6Ek0+87Nnl5D+8sHxli9hKIcmPZyOvGJTGgLT3WAYkkVqk6zybGVqlv3wPR2CTlSxdaiK6uKg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4cFk10SDGZX4IGeMqx23vUML3t5BoGEtebdlZ+DgXajcDzcUW
	pRuJSR3jcAvoQIu2N3RoN5FF8gPBqK4vtRUx0IAPVw63vuvN1s4GubRDVeKE
X-Google-Smtp-Source: AGHT+IExI3OFZjk7/ou0LZDxeyFpLSH2Erl3xIFOl4rfclR8VUL0rXWg8BMDN+p28b3IE5QYlcgKQA==
X-Received: by 2002:a05:6512:3a88:b0:535:6aa9:9855 with SMTP id 2adb3069b0e04-53d862667aemr2791430e87.0.1731168166617;
        Sat, 09 Nov 2024 08:02:46 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a7248sm948495e87.127.2024.11.09.08.02.43
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 08:02:45 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so30804281fa.3
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Nov 2024 08:02:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnpHGXgXHUlj/UwjNfkCJ+NAp172jP0gzr5WR7uFFpNiCxCdRg5otPxvX6MNpkVXglc1e419gqaz7/VQ==@lists.linux.dev
X-Received: by 2002:a2e:bea8:0:b0:2fa:d84a:bd8f with SMTP id
 38308e7fff4ca-2ff2028a865mr26875221fa.30.1731168162943; Sat, 09 Nov 2024
 08:02:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
In-Reply-To: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 10 Nov 2024 00:02:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v663xMyiEx4BpPkuRew9t8fAgbz6EENEj--8Y57E87Lgcg@mail.gmail.com>
Message-ID: <CAGb2v663xMyiEx4BpPkuRew9t8fAgbz6EENEj--8Y57E87Lgcg@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: a100: enable MMC clock reparenting
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yangtao Li <frank@allwinnertech.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 8:38=E2=80=AFAM Cody Eksal <masterr3c0rd@epochal.que=
st> wrote:
>
> While testing the MMC nodes proposed in [1], it was noted that mmc0/1
> would fail to initialize, with "mmc: fatal err update clk timeout" in
> the kernel logs. A closer look at the clock definitions showed that the M=
MC
> MPs had the "CLK_SET_RATE_NO_REPARENT" flag set. No reason was given for
> adding this flag in the first place, and its original purpose is unknown,
> but it doesn't seem to make sense and results in severe limitations to MM=
C
> speeds. Thus, remove this flag from the 3 MMC MPs.
>
> [1] https://msgid.link/20241024170540.2721307-10-masterr3c0rd@epochal.que=
st
>
> Fixes: fb038ce4db55 ("clk: sunxi-ng: add support for the Allwinner A100 C=
CU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

You should still keep the version number from the original series if
resending or increment it if changes were made.

ChenYu

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a100.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a100.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-a100.c
> index bbaa82978716..a59e420b195d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
> @@ -436,7 +436,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc0_clk, "=
mmc0", mmc_parents, 0x830,
>                                           24, 2,        /* mux */
>                                           BIT(31),      /* gate */
>                                           2,            /* post-div */
> -                                         CLK_SET_RATE_NO_REPARENT);
> +                                         0);
>
>  static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1", mmc_parents,=
 0x834,
>                                           0, 4,         /* M */
> @@ -444,7 +444,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "=
mmc1", mmc_parents, 0x834,
>                                           24, 2,        /* mux */
>                                           BIT(31),      /* gate */
>                                           2,            /* post-div */
> -                                         CLK_SET_RATE_NO_REPARENT);
> +                                         0);
>
>  static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc2_clk, "mmc2", mmc_parents,=
 0x838,
>                                           0, 4,         /* M */
> @@ -452,7 +452,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc2_clk, "=
mmc2", mmc_parents, 0x838,
>                                           24, 2,        /* mux */
>                                           BIT(31),      /* gate */
>                                           2,            /* post-div */
> -                                         CLK_SET_RATE_NO_REPARENT);
> +                                         0);
>
>  static SUNXI_CCU_GATE(bus_mmc0_clk, "bus-mmc0", "ahb3", 0x84c, BIT(0), 0=
);
>  static SUNXI_CCU_GATE(bus_mmc1_clk, "bus-mmc1", "ahb3", 0x84c, BIT(1), 0=
);
> --
> 2.47.0
>
>
