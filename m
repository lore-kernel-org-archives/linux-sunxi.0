Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA641853
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Sep 2025 04:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756873275; cv=none; b=hQpfem4tg2LzeGMgotGTf+uR6B5ezpPqTj8D2xy095qzqjpv8uUCKVH9epCyckp8clQfvk58PMUCkpYumZg3wQekCgFfAxFNN3CWzRRq7ZOzkOZqEtECkCzVH2Vb6BbJQ0Gf9qcuvo+tvnxBjDAsc1cY7KIgtiuoZ7wYQm1V+d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756873275; c=relaxed/simple;
	bh=ZoXxCHWqaro5pXtAU4oVQfP5mp8AkjK8NRJcUqEzsiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nIulXq5uXHFbynea/BD71wdXJsYCmJgvKSSokvR6XbxV/UOK7wTXiRt4jodTNC9JJePll0z3cXCya4cItwSfnkc6dfR+kOlRMkpa527+BtVglY/kEQ56nrT/s9X575bxgiUCmNm/3BxZ4Se6Q9f9vMgZmVBHkYdipFq7Ghvy7QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f76277413so3633408e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 21:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756873270; x=1757478070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADtwGUks5/GGWfb4oIFPF0C8f7SmDwE61v3oi+KH4+E=;
        b=H3b/kVM2u2YYe3tP7WyNh50QILxH6gPn5CAdDMt7iHMRBJ2e12bDxxKDUsF08D1fza
         KV0c7EUxqwNlknHIhyW2gVQ+ZtR3sh3sjn6B0zlfbjNMAGtQJ8bI7QSFZE5Gh4ygwXv9
         O8U83grk8phRCOGA0yWxzIfAaIN3Sx5xmkMvZup6UiZqaA605fppCwh5c3IVGEb2+WV9
         q0J7CI70yT0sPZ8vylqDPXkWOYFvU1nsaTDqaAqiBrMcuw3UzmleyoyX+32CQkPumUbR
         t1u4q7R/wOXhdwodn/0xHgIOUEMKV5Bs3OqfZJJlJznNMYefq3Z+bEmjO0P4de1dKwIY
         ecSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3yg4AoB/LY92LDTL6sxYy+01aP8+FxZNWTpIxEpQi68RmVsceKcuwHHWZY7/BJQXKUCThFtnNKx1Xeg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrgp2Ca3GNlBwIYeAAdkNL8TDihOdosx+vkVxM6IGcSCkFTlSo
	MHcy1nq/SVhAsR2E4ZoXGzn52GRUU4Q1nk0uu8f4JDihJ/YUYG7+ONLTVq1VLkov
X-Gm-Gg: ASbGncsyKqscPSeDk0jsVMyxy2sTABT/CzuTeKLd1Yp1MlIW7E7PjmvFJDcgzmTwo1S
	XDOUW2hXFPaCmRaQ60nqCRlf3Vjp6B3K9fbovD/vUuVg3nk5rNZ8wRgHo/5eb7G0nf1RZQsJ6NW
	XPhPlKI0Rs4rbwXl/0BJ77WfD3UD/rsvlD6HTvNCmvK0sfFNOt0V4mH8CP6nv6zsscwrb//CJSB
	yUyaLybSS/gj/nxybhDy1xcs+JcGL4Fwc2hR7lQla/jvuufPxqCUhfUby2X7CImALSoPk6jE1EO
	ET/siRPtSzwscO5Udn230+oGx26YCQG4OtpHaNUzi0sryvHT6jsdZxgItu+KLLFYLypOJpP0dwQ
	rGCLp8IiByAHupvisBkhUoned3D6hbzIBr/vcqukSgLwQDJWr5bw=
X-Google-Smtp-Source: AGHT+IHbia5KgtXqaIBtMcsYtx7MxtgBLYgq5B0FQI35EWzR2eFqXyhhB+nE2ZG+Yj/yaXl4olpFcg==
X-Received: by 2002:a05:6512:ad2:b0:55f:46cd:2c79 with SMTP id 2adb3069b0e04-55f7089c53bmr4318050e87.9.1756873269637;
        Tue, 02 Sep 2025 21:21:09 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5dcecsm249831e87.25.2025.09.02.21.21.08
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 21:21:08 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so4513179e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 21:21:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiIZyuY7pyDnmWD/jlE8UQPb4uJVvbh8jR7yov75VwZJpaMaatCn4pYHTNF8OCvWkPF0uVKRkcZ5ONIw==@lists.linux.dev
X-Received: by 2002:a05:651c:551:b0:336:e102:9611 with SMTP id
 38308e7fff4ca-336e1029af0mr33033101fa.36.1756873267878; Tue, 02 Sep 2025
 21:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-4-andre.przywara@arm.com>
In-Reply-To: <20250903000910.4860-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 3 Sep 2025 12:20:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com>
X-Gm-Features: Ac12FXwDJPiA6-F7YvlIel1VqSOtkOlXCU1uqZBll3biFaGOGyU1Aw_g7q5-Q7Y
Message-ID: <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: sunxi-ng: mp: support clocks with just a shift register
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> The "mp" clock models a mod clock with divider and a shift field. At
> least one clock in the Allwinner A523 features just a power-of-2 divider
> field, so support an initialisation of the clock without providing an
> actual divider field.
>
> Add a check whether the "width" field is 0, and skip the divider
> handling in this case, as the GENMASK macro will not work with a zero
> length.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

In my series I have a patch that adds this to the divider clocks,
thus adding a P-clock type to the M-clock bits.

Maybe use that instead? I prefer we use actual matching types instead
of disabling one part of a complex clock type.

ChenYu

>  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.=
c
> index 354c981943b6f..a03dac294d048 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsign=
ed long rate,
>         spin_lock_irqsave(cmp->common.lock, flags);
>
>         reg =3D readl(cmp->common.base + cmp->common.reg);
> -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
> +       if (cmp->m.width)
> +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m=
.shift);
>         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> +       if (cmp->m.width)
> +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
>         if (shift)
>                 reg |=3D ilog2(p) << cmp->p.shift;
>         else
> --
> 2.46.3
>
