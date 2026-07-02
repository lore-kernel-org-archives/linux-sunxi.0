Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACBA48B362
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998607; cv=none; b=hTppAmZSkV6+dGAxbj6hbDciE/rACSaeio4msF0NSAxzjULzpD2imPxun2PH0LHxxFSW5Cmrg5Ekh24kT82UtvViNQ0GrRKhAkPYJWSIKkgrMx10JhwsACG9u86Y6XDqeSSY46WxDyJhkcUXoaVgMiYITaBKUq5Gok4Njp7VMA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998607; c=relaxed/simple;
	bh=O/+xDYMCTDVOyhlY3bdOgfogvDZjRIBQUbYt9QjBRk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCKH9Ai5dg8bLQ7+ZW0drBF5TsViU/gFXKrtVyT4rJKnsXBg8UdDzXHXK105i0nVAXO/OVa/70xE8hIk/t0zyABfC2jw+GRx1AUSZXm6oNc2qjYE++uO1inuQeau5bg1hQl3ZTaxJUzSwQMQDWDLGJkGFEZNV6JG3ozTnRyycig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqbaxj3f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqbaxj3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209281F00A3A
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782998606;
	bh=O/+xDYMCTDVOyhlY3bdOgfogvDZjRIBQUbYt9QjBRk0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lqbaxj3f3sxqz5zXLRjl2SjXgVF2ARha+OAma9+j1biQ+VwgoG5UBa4YwqGIrw3uS
	 1qXzdt/kY8BGNTq0nRffGkovhq/FPQcFGuitj/QOQh4EVlvdOZjtgdCwAMXR3crPKv
	 a9p3F2iAwPgNyMfH9exKu+FoPlltpsyR9b9tti3TCPhqnPtCTm3FBQ4s0qsXadd0xT
	 Yy0vWhz0rVsw4Hnhvys4WT4ssEcGUKzRkUD0kWUCf4Vd1poFUxp4OZI0dSRrN36wIG
	 WSKkFehInXE4OnsbaDnNoqkgYFelTo+mIqZMKTkCgNTC+Qjl40HI5eZ7o/QPdhhjNJ
	 hc25E3eOqDpOg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39af64026dcso16110931fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 06:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqIzrFHIrDkDSrG1GM3ohmskAScnDlOI4TrsoHCr4UVyX1ClvUlajc+9udywem99Q6ovplzsfLoRm0ZDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvDzs9ealID91+PfriVFDE9Y1tmicgcotdq/5MS87deHlfWOmL
	JR5DP1C7JQTriZ6Rt6/yFfDhtkOd6npRm8vPkQb+iLeeMneFj4wti5jBQbQtUovnxTsuzig975v
	SHLMu4rVdV1k88IMN5QCS2vO+tkadRIs=
X-Received: by 2002:a05:651c:993:b0:39b:4231:8b85 with SMTP id
 38308e7fff4ca-39b42318d0dmr2458931fa.40.1782998604620; Thu, 02 Jul 2026
 06:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com> <20260702-a733-rtc-v3-3-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-3-eb2580374de6@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 2 Jul 2026 21:23:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v66KapepNOPf7ef5dd_AqDQdVBo-cFOJrR_Deu0zA0xWaQ@mail.gmail.com>
X-Gm-Features: AVVi8CeV6-IjWgsA2LmKA_98iO6chNHg3C1q7oOyJiDDAU0-Mdj71gMQi3ZmkpE
Message-ID: <CAGb2v66KapepNOPf7ef5dd_AqDQdVBo-cFOJrR_Deu0zA0xWaQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] clk: sunxi-ng: fix ccu probe clock unregister on error
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 4:10=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> When registering clocks with sunxi_ccu_probe(), the number of ccu_clocks
> and the number of hw clocks might be different, eventhough they usually a=
re
> the same.
>
> If they are different, it could lead to out-of-bound access or registered
> clock left behind on error.
>
> Use a different variable when iterating on hw clocks so every registered
> clock, and only those, gets unregistered on error.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260629131254.7E34C1F00A3A@smtp.kernel=
.org
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
