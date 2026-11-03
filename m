Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704093;
	b=xrHAV17V22HdnSsFBls3dBc+EY3VbAzcCS0HcAMLv0Jr+apVmRjyZpButJLFXAfCM4SK
	 POfK/WixTOO3dMtckWvb9bRmLBG9wlqiWk/J/mwfFr2YRpUT1bgpnqC9KiNM9qPRu5qIl
	 CVLC1gpaD/Uy7uSXqQoiCql3Hvv1/fBPAgAm3D5joTUI7cmCAln9fhXzCMfpfrA0E3P+r
	 swRYC4CBuQoqoTBGOikbVjMsUMfOylQmCR2tV3X3QVJZHvhqMWYWqSHFNXu/g9i3v47kx
	 zqsPN+2vUX8WodcBLKCrbcz1HhTOEpO2hD8HxBJg2ahqJPCcYV2g02VuoJPs+FdI4wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704093;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xPoZusWyH3D9fdoWkwrWqXdMyuACo60BjbvRfcDTRcI=;
	b=3sTyYG6NYR08zOuEcZRx7AAap1XKhi77qf8Lx/uNOKf2qVS4E/nURDn3CVQsK4hSTaba
	 EhByvbAa6CtjauYeqR/9yh6g7oV6YFokhnFeY8OaV6tkku+OJfIM1r8Krox9v7pn23u6m
	 Nq3mpaWU47ZoBp7OBNX+vB5TfYjF0WKdwPHqtZ7YUXo/nBRIKZBEnt2aXMrBAYwdtK9Zg
	 eWH5XDQzNRmm4AriFKDv4B0y/s0prBKNkHR8Wav7+jMA7VhnbRHWMddfi5YLBmY/7muif
	 ToyDJjCg9tqqmKNRuT3J9LBesxZ8h8Tk2+yvk0znbs+hs0IZZo9ERB8EfRp9JNJQTJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHj7eU2y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C20B606A333
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHj7eU2y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0843A1F00A27
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704093;
	bh=xPoZusWyH3D9fdoWkwrWqXdMyuACo60BjbvRfcDTRcI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UHj7eU2yyOQGjbmDeez3g+eYL0Bv/uBQFaVXwnSjXyABHS2vICEdmQxCEJrHP2qju
	 kEAGy47lVIwdWk3dqx9JXTvkAaEe7ImmoKHeTbrMAIPL6tsz/btjcHiUuzd9vYHgIs
	 ACLyFdhhQWwRQyNgLOPxHcVSHobGrMkreSap/1L/sJ6373OYfeVsF+YX84ejAx25A5
	 andD1CvJB/16z3poGAxQPCT7qbH7sp1VcsXrMnPslbovnNMPOpuh6ncs1SFjs4I8TG
	 TgwrunHp7mwg1CLdW7//hRh/UPy0m0rM5NQtIgq8etzTLFKyE/9PA2bxs6d/a2UfBU
	 UytNUnElfgWpQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ac91f5aa89so37742341fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 03:08:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByh8GbAGgg5gJMfP66CuVbNOJbkWoslBtr08RILXG3L2eZZegVbd6wrhoPvhJpghFMGLGvrZGo1BOXyag==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Cw1SFVsXJdKjWpOoK85OkCB+AzYDiIUOZ37wgEg5WNQ7paMYd
	4XmlSQsFOcpHAkmlpbedyZLsKrKdE3aFPKFmOgPtEGsdvBYsFHvuIDDqA/F15q3DTScEUUibaCZ
	SdFTVlIX3Z8ff+8JBgvNUh/GWsP4lPOY=
X-Received: by 2002:a2e:a555:0:b0:3a6:5ec0:7977 with SMTP id
 38308e7fff4ca-3acb7b45f8dmr32247991fa.22.1793704091325; Tue, 03 Nov 2026
 03:08:11 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 3 Nov 2026 19:07:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
X-Gm-Features: AclHuK_7MCsHCFGRxCGrHLGiBJS1LagIQXdv248ODfyEYfHWYTzn5PL2aAFmzB8
Message-ID: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: rajanyadav0307@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 5:09=E2=80=AFPM Rajan Yadav via B4 Relay
<devnull+rajanyadav0307.gmail.com@kernel.org> wrote:
>
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>
> The CPU thermal zone in sun50i-a100.dtsi has a sensor but no trip
> points, so nothing throttles the CPU as it heats up and nothing shuts
> the system down before it overheats. On a KickPi K5C (A133) without a
> heatsink, the CPU reaches 90 C within minutes of full load.
>
> Add a passive trip at 90 C that throttles all four cores through
> cpufreq, and a critical trip at 110 C, using the same layout as
> sun50i-h6.dtsi.
>
> The temperatures come from the Allwinner BSP (sun50iw10p1.dtsi). The
> BSP drives this zone with the power allocator governor: control starts
> at 70 C, the target is 90 C, and 110 C is critical. The power
> allocator needs a power model of the CPUs (dynamic-power-coefficient),
> which the A100 does not have in mainline, so here the 90 C target

Does the downstream BSP have this? It would be nice if we could port
it over. Then you can properly use the power allocator and/or the
schedutil governor.

ChenYu
