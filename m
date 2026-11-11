Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382382;
	b=P0ofN0hFQ1h4fn8hVjDKb0STpi2pkxMhspUer4XicGt9hqeekhOjD4KT5naJd3Nb3JR1
	 As7pu4w8rRdqYN5JyZ2123yk/Ba++i+MJwvvJ9g6ul9/toGrdflbBRAAVdwrqjXHWa/KD
	 nx3JT1pkMNkYrx58UGMG0K2ugLiG8GT7fEd9GiWxYrWc+ay7bsmiZER9Aaiz4aRGNIdxx
	 jg8nvPB6OQqkIRNOcMbkLmQfL2WvBGjUwn2Tu5iD8Mns1FvVT5gzdeM8lx3adBXy8TnCW
	 2hKV87QRbTL0Pt+qGoKCreR87deatCPPr78OK+DNTsFEbWxw3pB4Wwn86vFHmSMgNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382382;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/Q64Ix2X/kmoKMESKFF7GfIJozkR1NEfXs5+MGDyEJw=;
	b=qIUcPXAKWQYNdYBKTWk3C5c/lJrrUNvmHCuQ7/bMFriXuQ5tSpZVIwlF6ymj5e9Kx2Fe
	 NGlZve/5zyCtWgo2DYQ/l4rCv3vFvhUj5ixnOtKfaH7rp3vbE+/toSF5Y/uBCH/pUOngQ
	 plyyZXEbaKfLl8z4Yh2vbmMewRvdgMP4OEGbGlgq/8Xbof+ZODyK/5/S/QQeKV1I9mo4P
	 g0WpVr1oCeabOPpWdK0o6ioXodWVnqEY6RdC6lgszSyZx8OHtd1eUokxOtJzN/mHvfqET
	 x0ZVyC2vylWyXkScTzQtEILkQwj+3MolO88dty/ATM1O/HFQ2UOoeTR0z6GDSz7/Rvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFKtYIRm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E87606A327
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 07:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFKtYIRm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCFF1F00A05
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794382381;
	bh=/Q64Ix2X/kmoKMESKFF7GfIJozkR1NEfXs5+MGDyEJw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=LFKtYIRmdJLTkkClRaSCyq6qSvGBQLlGy2IT3YvJc6GpmYyNGMEHXvrqGlOiGQgMt
	 F22FwBQSP3RwONjGFhRF+iu8NQPa7ZXdnEgW4IrzBcYEfpVDAdfX4BuQI5OIwK542z
	 yMvQ93hyDm7oPYY1NSMHj91ORrujekYl1h9TkgyyLzppLFqiFmGnmSGcWfxLwvDnmH
	 oNT0DUvaPTQGkYwP/bXcJNlkfbCgNB+n3OVWa+PwWbQtfcwtgV2E/BRdGNQD4fTA2/
	 kS3FX4oPW6rUWw2oNquPnXG9pTKgVlikVwabONyMRFAkzVHaV7GUBouGLknay0pK4m
	 qV7aGDlxnavRw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ada7d53082so31657351fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 23:33:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHfuQRufjm9ayZ50RacoNCeuEG9UPv3K2nxT4O4Xi1nGoaH5BcVdBL+cbFkYXYw9hbnSLx3mrN1Ql/MuA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8n1Mk2e+juGKIuoJ9twKPOYr4EYgHlPrb9I3tFl3QaxRd1m984
	D0lidb3LfA31kCF8xN5SzlQMVAgMuPFK+oMjYdZacF1yxm4X0IozumDZDGG7Nwki+4NNIj9KZ9V
	QzpdWEa+IsdGGhbWh7NR3at9Ab4nj1pg=
X-Received: by 2002:a05:651c:19a6:b0:3ac:4b79:573b with SMTP id
 38308e7fff4ca-3ae126dfeb2mr2383681fa.13.1794382379903; Tue, 10 Nov 2026
 23:32:59 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-sun5i-hstimer-arch-sunxi-v1-1-9016f63e186f@gmail.com>
In-Reply-To: <20261110-sun5i-hstimer-arch-sunxi-v1-1-9016f63e186f@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Nov 2026 16:32:47 +0900
X-Gmail-Original-Message-ID: <CAGb2v66=UbyC0jaW6tjeux5VruUAXN_64bAs3+LyS=CRG1qm9Q@mail.gmail.com>
X-Gm-Features: AclHuK-OY7M3itmCA0XTlJzxAvWYSOF7vEwzX0YxEQKq8s6HmV426ktA_3YHpdA
Message-ID: <CAGb2v66=UbyC0jaW6tjeux5VruUAXN_64bAs3+LyS=CRG1qm9Q@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/sun5i: Allow enabling the driver on
 64-bit sunxi
To: aiyengar1990@gmail.com
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michal Piekos <michal.piekos@mmpsystems.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:07=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The high-speed timer driver binds "allwinner,sun20i-d1-hstimer", which
> the H616 device tree uses as the fallback compatible of its
> "allwinner,sun50i-h616-hstimer" node and the D1/T113 device tree uses
> directly. SUN5I_HSTIMER, however, only has a prompt under COMPILE_TEST
> and is selected by the 32-bit sunxi machine Kconfig alone, so arm64 and
> RISC-V sunxi kernels cannot enable it and these nodes never probe.

This could be simplified: the high speed timer is available on many
newer platforms, but it is only selected by the few original platforms,
and not visible to the user.

> Make the prompt visible on ARCH_SUNXI. The driver registers its
> clocksource and clockevent at rating 340: below the architected timer's
> clocksource (400) and below the sun4i timer (350), which ARCH_SUNXI
> already selects on arm64 and RISC-V. Enabling it therefore adds a
> second hardware time base without changing which one the kernel uses.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> The H616 and D1/T113 hstimer nodes and the D1 driver support were merged
> for 7.2, but the driver still cannot be enabled outside COMPILE_TEST on
> arm64 and RISC-V.
>
> Tested on an Orange Pi Zero2 (H616) with a 7.3 kernel carrying this
> patch and CONFIG_SUN5I_HSTIMER=3Dy: the hstimer node at 0x3005000
> probes and available_clocksource lists "arch_sys_counter timer
> hstimer".
>
> This patch was developed with Claude (Anthropic) as a coding
> assistant. It investigated the problem and wrote the code and the commit
> message; I reviewed it, and it was tested on an Orange Pi Zero2 (H616)
> as described above.
> ---
>  drivers/clocksource/Kconfig | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index da83483296d5..971491d2e584 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -172,12 +172,17 @@ config SUN4I_TIMER
>           Enables support for the Sun4i timer.
>
>  config SUN5I_HSTIMER
> -       bool "Sun5i timer driver" if COMPILE_TEST
> +       bool "Sun5i timer driver" if COMPILE_TEST || ARCH_SUNXI

Nit: I would probably write "if ARCH_SUNXI || COMPILE_TEST" just to match
the other instances.

>         select CLKSRC_MMIO
>         depends on COMMON_CLK
>         help
>           Enables support the Sun5i timer.
>
> +         The 32-bit sunxi platforms that have this timer select it. On

"selected"? BTW I think we can drop the "selects" from those platforms
if the option is now visible to the user.

> +         64-bit (ARM64, RISC-V) sunxi SoCs such as the H616 and D1 it
> +         registers an additional clocksource and clockevent device, rate=
d
> +         below the ones the kernel already uses there.
> +

This doesn't really say _why_ a user might want to enable it though.
The only reason to do so is to get a higher resolution timer, but
the rating for sun5i-timer is lower than sun4i-timer for both clocksource
and clockevents. Realistically speaking this is never going to get used.


ChenYu

>  config TEGRA_TIMER
>         bool "Tegra timer driver" if COMPILE_TEST
>         select CLKSRC_MMIO
>
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261110-sun5i-hstimer-arch-sunxi-167ea2ebcbd7
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>
