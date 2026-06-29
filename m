Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CF836CE19;
	Mon, 29 Jun 2026 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737586; cv=none; b=T2nbBjBinX19gs9JlbGZwQtEOmWZCgHvOWtGFqhZc3F7VCAwUXCp5qp4ul3nDs0ziGRxJUkeA3RwaIFtoLQlHoaQdMUx7+/rc7rul3ASt/0oaOJFgOifJ1Rl641ijFEk/vpGEI1134NCG21XsGtYcFljAV9JQKRVK/gqamU3t80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737586; c=relaxed/simple;
	bh=nU6Y3w5yolp1tZccfMy8JvrFaF26v+81615Huj7uD2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b+rXaPyb4z+gqGdGf5FwKV+hkhgsAKWcLELdnkKs1FoM6v9nfTsT0O2bcL88n52mDbg2l9FYK4tS85cmFfg5kCxV3+kcSHlBTk2wIRu7Ld5sOD9fzQovwbRQbMjOgq0eWlhEMfuae+tR5m+t3kdOU32fG4f4mHpmGcDvvkillTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZUnlIKv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZUnlIKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF981F000E9;
	Mon, 29 Jun 2026 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782737585;
	bh=9Xw8i+yyhVlqVUz3VSTmocg5vpjTfcW/Y7E+yAfAoWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KZUnlIKvsUesJXJRON9atvmntmBGnbDx4aecjV8rCgvCrELpb9DF68MpfEveltNyN
	 Hh6NJmNZCAT8b8wU8wBd71yFzGabPebXa7dsaX9oOFmBLvD2i8e5/NJZ/iMHS807G0
	 7X4WnxF3xN1GiiFfW8TpjVOiQ5n7+S/6WjNwfWzl9ACTmym1hhHcJQ07uvi2mJScTO
	 Icr4cTkWd5YZ7UErrrEmqMudNYNOIOoDFMg85peLt7r/wU6Aqu0E/106ASPkcaq3mj
	 b0A4e6Xk5yinOr17+AxqQNWjz+Q0wLam+ZkP+S6olfNW2hu3+YjqCU63l/oa09iUE3
	 CEWQobL5rEi7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: sun6i: add sun60i-a733 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
 <20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 12:53:04 +0000
Message-Id: <20260629125305.0DF981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `clock-output-names` property has a global `maxItems: 3` constr=
aint and a description limiting it to three clocks, which contradicts the n=
ew clock outputs (IDs up to 11) added for the sun60i-a733-rtc.
--

commit a1565b632e372c724867216463a453c9d1600ad2
Author: Jerome Brunet <jbrunet@baylibre.com>

dt-bindings: rtc: sun6i: add sun60i-a733 support
   =20
Adds a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rt=
c.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index 9df5cdb6f63f2..197a6f67b180a 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -33,6 +33,7 @@ properties:
>            - enum:
>                - allwinner,sun20i-d1-rtc
>                - allwinner,sun55i-a523-rtc
> +              - allwinner,sun60i-a733-rtc
>            - const: allwinner,sun50i-r329-rtc

[ ... ]

> diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/=
clock/sun6i-rtc.h
> index 3bd3aa3d57ce1..5132a393ca4b6 100644
> --- a/include/dt-bindings/clock/sun6i-rtc.h
> +++ b/include/dt-bindings/clock/sun6i-rtc.h
> @@ -6,5 +6,9 @@
>  #define CLK_OSC32K		0
>  #define CLK_OSC32K_FANOUT	1
>  #define CLK_IOSC		2
> +#define CLK_HOSC_UFS		8
> +#define CLK_HOSC_HDMI		9
> +#define CLK_HOSC_SERDES0	10
> +#define CLK_HOSC_SERDES1	11

[Severity: Low]
Will adding clock IDs up to 11 conflict with the existing clock-output-names
constraint in allwinner,sun6i-a31-rtc.yaml?

The clock-output-names property currently has a global maxItems constraint
alongside its description:

  clock-output-names:
    minItems: 1
    maxItems: 3
    description:
      The RTC provides up to three clocks

If a device tree author attempts to define an array of clock-output-names
to document all outputs for the allwinner,sun60i-a733-rtc node, won't it fa=
il
dt_binding_check validation because it exceeds the maximum allowed items?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-a733-rtc-v=
2-0-7b72112784f8@baylibre.com?part=3D1
