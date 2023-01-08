Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3413222
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:54:41 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id hw16so3671095ejc.10
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 12:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQj67zpDv0H9yJYRa8oUtp0MLfg/jFk0jkz9ie85Sp4=;
        b=Q/YQaKFGRMmoIjjrAVitQfWgLD6nUYHd3jPGMrsaIR83LO7EoYrqfRWgRZILFpOz0C
         oixFPlQ441ZdIwmfQ1pd1HXMceADZynnmSAhqrB2RjdLz0+6yb8hEv56VhAUYIXCIla4
         pKkxHsKVKwbqe85IdMVZkuj9ELVkhDRwfMeuTcqirpv3vguhXPQY7xXpeDKI6ieWXLZs
         CZAUv/K9vhkrzFrReSUFXdlNA3F1cU+PvJS7hTlnTq56M7gNz6OUNgUaGjfT6E14BuUq
         JUdMrADSJM8ZrsotJGSkrtG4/HdD5nBaqUzIp0PUdrbQOGIlJS3cG2sbo8tYnYiRa7+A
         QjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQj67zpDv0H9yJYRa8oUtp0MLfg/jFk0jkz9ie85Sp4=;
        b=GkkudBntARWOxFE8C8QSDJwQop8kMIIUlbTVBRzo+Zuvm2RWP8IzpyykcLmRL8+N7U
         BHtxAB/h4E8qI7K4gM9dmoN6XwB0OIE4X5ps8z0ONUQvyG0i84VpfReivLczxlXMa33X
         yaVOmF0+OMHZvVS9RzuLkvGDPWVqwDZ1m/cEq5jOLAysZ0Wio45ZfkMc/EK2ELKGWcWm
         ZeLDxwgjoEIVI1Slm2yVv5R51PB4MfZj28KN0o67vMmFwyBSyOBgQ5opql5Vm/zoruNS
         N+QzRrz+kTdlx2qybeFK8dnRTbRiUeq/q5Aib1ySg1090jR+uxbRsQg62GjucOBPd9/q
         072A==
X-Gm-Message-State: AFqh2krMDiMagmpHKpnejm1wDhUNMHITUOXMzrTOETTd8J0ou7RCY+fb
	nvM2dBav6CAslzO17urSZZM=
X-Google-Smtp-Source: AMrXdXsIsv1gmrDL00g74IjFR9tyZ8Cu7d+50pp2FQqi8lWzNq2P1DpX/WxOEKfep0LHNfahlTGZng==
X-Received: by 2002:a17:906:68e:b0:7e2:ca68:6715 with SMTP id u14-20020a170906068e00b007e2ca686715mr53242941ejb.63.1673211279702;
        Sun, 08 Jan 2023 12:54:39 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060cd200b0084c723a626csm2871248ejh.209.2023.01.08.12.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 12:54:39 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi-ng: h3/h5: Model H3 CLK_DRAM as a fixed clock
Date: Sun, 08 Jan 2023 21:54:38 +0100
Message-ID: <8241808.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20221229042230.24532-1-samuel@sholland.org>
References: <20221229042230.24532-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 29. december 2022 ob 05:22:30 CET je Samuel Holland napis=
al(a):
> The DRAM controller clock is only allowed to change frequency while the
> DRAM chips are in self-refresh. To support this, changes to the CLK_DRAM
> mux and divider have no effect until acknowledged by the memory dynamic
> frequency scaling (MDFS) hardware inside the DRAM controller. (There is
> a SDRCLK_UPD bit in DRAM_CFG_REG which should serve a similar purpose,
> but this bit actually does nothing.)
>=20
> However, the MDFS hardware in H3 appears to be broken. Triggering a
> frequency change using the procedure from similar SoCs (A64/H5) hangs
> the hardware. Additionally, the vendor BSP specifically avoids using the
> MDFS hardware on H3, instead performing all DRAM PHY parameter updates
> and resets in software.
>=20
> Thus, it is effectively impossible to change the CLK_DRAM mux/divider,
> so those features should not be modeled. Add CLK_SET_RATE_PARENT so
> frequency changes apply to PLL_DDR instead.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied, thanks!

Best regards,
Jernej


