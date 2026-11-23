Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396868;
	b=PSKT1yyjxWZ/YYqFzyj7UXbsGnTHVjF2QNY0hqJuK7dPvT5x3zHht0I1pSYSEAFu3vQW
	 8UEpkZXyAD76hWBH7wFTsCTRfCVI7zsJ0dQ9hB85GS9SroIpCjNuEk0y/cqJk7ROlMGor
	 qdpBSVfYQH/zt/0M+D9rCaLtwHafNCqNxE7/ExIxO1sMw7sh4pYSwFKRsrbEG06TJcDTD
	 Nc3aU2zoe8N31aJzT1UgEyci9ocMj70YK7G5MKNQsZkq7mTMonF1mYCOOm9Da7ZBVN+s7
	 0SQZw4vBD5C14Irkt6wy0afFsLIMPJ6kgIfRQaT3/QeSQzdGeile0eGca1+aVgS9kbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396868;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mZqHayVGS1xgtvg32Na1JhcmVegYW+rmWEW78/lQ8ms=;
	b=lpmCt3zLPo1Lmh5VG9wFDnq4j2LjyePJO0PJS7B2JByoAS0xoXWsswmNVE8Cum0OUPjU
	 Hv4zOR7BZG1ivBv7VoNfnQAA1NWuDgWoNzerjIG01mngYO55ph1Y2K6H6jCw2UGSnvUUt
	 TDe80104rCLVM7tyN5VFGqKjBTTaaH3bfi4bFoiGPdOuO+BhG07+zN9w1YMuGy6l+DZ8w
	 dxUs/A5PqGMe2OcnwIBmChgY4bPClXDabr7yakudG8H9mBM4Ev9rvQsl8KvgV1axN/uis
	 u7Zqgx/hL238q2h6sPmvXUCkKlnPX2J8w7YcPTozicE270iuoUs8rrdAUCYZni+4flw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivOklNN2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62700606A32A
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 01:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivOklNN2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84321F000D2
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 01:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396867;
	bh=mZqHayVGS1xgtvg32Na1JhcmVegYW+rmWEW78/lQ8ms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ivOklNN2KOGbBFBnB9FPVh7Ld7SVUF0l6X/QpLensP7wYUOgIaUzgygVwGuX7E66A
	 wa5iA5ScRg88Zqb2fwPTGVh7+I+j/AmodinTS0CRnmjCVZaKjS6LnTKBWYLWgP5GwZ
	 xyx6e8khX7plnxrs1xYCkPsOtjoHXTksvq1K97EenFi/26xOxfKZzoHNEYrs5boju4
	 MDi3UwugVv1uuAQI7Z7FakahmJbHcb/vEFgHGr65TyzTFcEM+z1N6HzGLxc8EUmc7Z
	 hQr+k3m+qe+pBonf4F92P9FjY+aM5LUrwkzUjMMt+YKdS7APbtTG9F4yBDYve8LJ5y
	 ggDdZwilvsWQw==
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so10844295e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 17:21:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEqzp8Oc7TrPEtm/mmJNulntTwnG8CUh2PS8JCwMGA9SmjE7E+2AbRZcc5WypD+ArK2DGbaRY1Ve5cpXA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Dn5KwQHjGmKTzgvzZs4O/uCCJhzhJJCJudezKE90efUvyLt2h
	P2ICvolw+/FjI2uEz2aYFQYWKlRBoZ/EjMLAVGURsq/ZRqFZ5rk7fYlsnsD/eWoczXF6vaYaW0t
	Kr9tcqdIlGnI1HezgrnOG18GiCOi+qL4=
X-Received: by 2002:a05:600d:600b:b0:4a2:167a:c939 with SMTP id
 5b1f17b1804b1-4bb88815f1fmr209227025e9.21.1795396866520; Sun, 22 Nov 2026
 17:21:06 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
 <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 23 Nov 2026 09:20:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRiDrhOTJ77nnHm_v3k52iz2JPk15zZVE0SS_w1KJAVeg@mail.gmail.com>
X-Gm-Features: Aa3M54ouhks5E3p4QI9taB6w48IYX-BM80EMc8-2bbL7hF7KLogcDmZQZpD8tBk
Message-ID: <CAJF2gTRiDrhOTJ77nnHm_v3k52iz2JPk15zZVE0SS_w1KJAVeg@mail.gmail.com>
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Han Gao <gaohan@iscas.ac.cn>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Some references for v861:

https://www.cnx-software.com/2026/01/04/allwinner-v861-dual-core-64-bit-ris=
c-v-ai-camera-sip-features-128mb-ddr3l-4k-h-265-h-264-video-encoder/

https://www.allwinnertech.com/index.php?c=3Dproduct&a=3Dindex&id=3D148

https://docs.allwinnertech.com/docs/soc/v861-tina-linux/en/

Hope these help you.

On Sun, Nov 15, 2026 at 3:31=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni =C4=
=8Das je Han Gao via B4 Relay napisal(a):
> > From: Han Gao <gaohan@iscas.ac.cn>
> >
> > Add the main CCU driver for the V861, based on the A523 one. The CPU
> > PLL, the CPU subsystem clocks and the E907 clocks are left to the
> > firmware.
> >
> > Unlike on the A523, the second divider of the 27 MHz output is a power
> > of two. pll-audio-4x does not pass rate changes up, as its parent also
> > feeds the UART clock mux.
> >
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>
> Do you have any user manual for it? Or at least BSP code? It's hard to
> review patches without any of those references.
>
> Best regards,
> Jernej
>
>


--=20
Best Regards
 Guo Ren
