Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA293C456F
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 17:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285732; cv=none; b=SIPPV7/ScwNaDILHJta04yBm3gQkYS03TLjBAjtk5tuOxjXOC9dWclTJAOaaclb4GTwpKzdhRHMGX8C74tD+QLN9o4HS276ghJnhDbHvVzoZcggYiLRnJoDQ106TmFs8VpVd6EZASGwBtV/X8LvEQga4EhoGYRbUG9OP0bJBRQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285732; c=relaxed/simple;
	bh=ea014rg9Id3LjbCkFFKL5NQgh0vM+cp3ePkl8S2utWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5wrXitgGOf52du9lGGTOHQiVX5HGWG74OobVCj1kkg7GSvI9z2Uvj0uqxsUfYBPyAfa2T7frIM6C/HMJiPBb3zv9ciRrn0aADOj4CKE2lwD5OLPSR2wgDIWfdB5/rexegBJh4LKv4f/ydim41JsAaKJcrCmULXjGPhyWAzCuT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a27dddecb0so6143913e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 10:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285727; x=1774890527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea014rg9Id3LjbCkFFKL5NQgh0vM+cp3ePkl8S2utWg=;
        b=BhCHVihoGwEUcfIY8JqPdPwjP5ETz5lKYW9K7PcOV0mk39i0Uq9FUi49wy8tXcL9J4
         hSGO0TJ120U+FAUcY8orvcDSaV69NRmzc+cdRos8iEf3YxGZg1H9yi3Q5zoE88/kURcL
         MMSzs1rXpa77RvjQNCr4Rtm2KFMU2WDLmphiG1NPQDMV4GfQ4t523AU+mgLbno4+xl7i
         r/4TGYpgHl6A4yTm3b2NvjuW8kxcYVI7A0sZbJM/v1wSsCH5c0ke+AmsyLhRDJEkAQtu
         ZrosNRoPgqytTZNimqCPU/bSZ9zcWIUnQUBloOBITV9BwhTbN2hJ8GcdpyfcmLiNRnQn
         0ebQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3e8MoF8nE934nrUrAM6FRNZ0WN9gDGCkwh6gWyTvFoP3/VJHsVuubqm3jjwV6Oir/EFEvUMfTc+rVqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUt0kfUA7buMUxDL4o7AZC0uOb04l4YkLKIAwe2RrOfexgxTc0
	0qxXSIs4+ld5YLjwJYg1JvMNrPnU1QPJ6UKkEMjCrzcEB+2gyqSRN8CytOEy36NW
X-Gm-Gg: ATEYQzzPYPs+Yr46QPVoisKhzkO+GQi4d26yY9Monu+Ia+6xU+wjrGVG9C265H2RNcG
	aGUQNoc5xZMl4a1AHwqMU5iJkmyedtrSyuO0bSmq9vQUDeGHFm7nzYrNFq8E+HhwJxe9VYgXPbD
	pCjgE6g5HgZ+Hu1QFOnYYzHQ4kddl+Bky0NapOO4LQaI3vVn2Hc7neaxuoVKEu+IWh/b+12E5qj
	HG2c9Wld8kw6MFsabXLZrXKj+EQgxTAu+98regk347PTorhpDwbJnzva9R13kRhL/4Jg+leSpqb
	G3HagHO9wA+yY/Xz2n6QQmd0dXJwxZqJr4VTpdA0gMeTWTPS3xSXhTBPeGevP/E3qVJDlLxWHqz
	MlPQHgSq3zSJZ3QRHoc++rfiHzUgBK0HsyTaDjaE30hk1OfORqQhhSmoL7QJG1hciI7ZF07/eiz
	d53m+hzzrePPZlSh6Ss1u5rNwgH93rd/2pMU+tfbO/CnRSEY3e4DM=
X-Received: by 2002:a05:6512:2352:b0:5a2:792f:b836 with SMTP id 2adb3069b0e04-5a285b5a31fmr5114603e87.30.1774285726483;
        Mon, 23 Mar 2026 10:08:46 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192dbfsm2657112e87.1.2026.03.23.10.08.45
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:08:45 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a142464316so4740403e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 10:08:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyLKzlx8GlOUm56P1nYldDL+rQmRScNQN8SKjdhpDJJM3KX2Vc7bNNtIVUwEzSzXCfxZQJg3xKpaHIIw==@lists.linux.dev
X-Received: by 2002:a05:6512:3b2a:b0:5a1:3400:f937 with SMTP id
 2adb3069b0e04-5a285af5768mr4364578e87.7.1774285725281; Mon, 23 Mar 2026
 10:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-5-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-5-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:08:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v64+bQL7a4C=+ja15wN5=JZM9EN6KL3i3zKiSSOH_VjycQ@mail.gmail.com>
X-Gm-Features: AQROBzCe4pxhD7VX5GMz8Rw4tgWfnVyG9ksfoBVa9-SlxUX0n6uC5n3LkQE4wJU
Message-ID: <CAGb2v64+bQL7a4C=+ja15wN5=JZM9EN6KL3i3zKiSSOH_VjycQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a523: Add missing GPIO interrupt
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Even though the Allwinner A523 SoC implements 10 GPIO banks, it has
> actually registers for 11 IRQ banks, and even an interrupt assigned to
> the first, non-implemented IRQ bank.
> Add that first interrupt to the list of GPIO interrupts, to correct the
> association between IRQs and GPIO banks.
>
> This fixes GPIO IRQ operation on boards with A523 SoCs, as seen by
> broken SD card detect functionality, for instance.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: 35ac96f79664 ("arm64: dts: allwinner: Add Allwinner A523 .dtsi fil=
e")

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
