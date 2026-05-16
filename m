Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B07933BBB9;
	Sat, 16 May 2026 05:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778910604; cv=none; b=jZmAV7DRywkHoY+67vWy9PaZDGI1EfV5HBrLwlgKtsO3TCE7DZ0iles9HZNLeCL0VqBO95ugGc+m5Afo3p8OWOvjwUlnODBP0DRiVxmuUJCxA0xm/BSn6+0pYDO9j++K8U4QPZ9OrP3EFWJ3u8nMTQ5XCReJhu6u1EFvindncXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778910604; c=relaxed/simple;
	bh=PR36ZCC8Semt40CDOjJoubOvz1hqXvxcqlYkcd6pN5I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tDsZvJidJOJ3yTYXcJVCm4krE9Vw9BiOflMwlFiwKx2dhFD+RqNhAUblK6kJdMmKTT7xON2Yy1WOmW6Vr+ExcaP0TdBV7fwJcf6mr5FWFcJPdAT09JyEKZKJFmjsKsHGYZHDzo2eeDxfq94ZOdT1JvVfMMEET6DKceEqXAZH7w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6USo5Pn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6USo5Pn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F014C19425;
	Sat, 16 May 2026 05:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778910603;
	bh=PR36ZCC8Semt40CDOjJoubOvz1hqXvxcqlYkcd6pN5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=R6USo5Pn0WYtD98y+psORZByyKz5HWc2qrZI/6hUuiwUq79rHpBAFhH2bBoXMfYKJ
	 1JRhYpr0uzwHHvtB5YWc9NWN2Uztr4+Q0RAFzZHtMbHcK8tiRuBGcRbtUtO9eM0Hs1
	 6iLQltYdgK5FCwIDXVZpp7dRCTgaQ8E19U1oBsp6yXN4PaZda3yh837Hk62EEskg3p
	 GH0Occ2rxoRyg9xEzgdA1X3pZDM5H0GCUi/f/0x7bnMgq41P00mLgDaDdvrpYfSMGJ
	 jzQJF2XNp2emrTX4T0XK+jaOZQt6CPfnHdKL5rqDUJ0NJyVnWQOib+Xahl+rRn8Ahe
	 RUG5uJneyJp9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner
 A523
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Piekos" <michal.piekos@mmpsystems.pl>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260516-sunxi-a523-gpadc-v3-1-a3a04cff2620@mmpsystems.pl>
References: <20260516-sunxi-a523-gpadc-v3-1-a3a04cff2620@mmpsystems.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 05:50:02 +0000
Message-Id: <20260516055003.3F014C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Brittle schema conditional matching for compatible string
- [Low] Missing device tree example for the newly added A523 variant
--

commit 8ef795d51c1bc739366c917fc7bb2c4c8c5c937c
Author: Michal Piekos <michal.piekos@mmpsystems.pl>

dt-bindings: iio: adc: Add GPADC for Allwinner A523

Add support for the GPADC for the Allwinner A523, which introduces a
second clock compared to previous generations.

> diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml
> index da605a051b949..6467800d30e27 100644
> --- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
.yaml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun55i-a523-gpadc

Could this conditional matching be brittle?

Using a strict enum instead of contains: enum will fail if a future
hardware variant uses allwinner,sun55i-a523-gpadc as a fallback string
in an array. Would it be better to use contains: enum here to ensure
standard extensibility?

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock
> +            - description: Module clock
> +        clock-names:
> +          items:
> +            - const: bus
> +            - const: mod
> +      required:
> +        - clock-names

Should an example be added for the allwinner,sun55i-a523-gpadc variant
in the examples section?

Without an example, it appears the new constraints for the two clocks
and the clock-names property will not be tested during dt_binding_check.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-sunxi-a523=
-gpadc-v3-0-a3a04cff2620@mmpsystems.pl?part=3D1
