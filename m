Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF29D12C520
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Jan 2024 16:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706718880; cv=none; b=CfwInVNTRhKx1D/r3Et4V3SZPuwyggXaiaSj/KeYXjKNXVEgJYTJPKFj18UUOyyxwjPkD11COsddPMEujhwcRaT6uoD8OlEs3exlh8ih9ZlEUtzajRshf2B/EwpkcyK5liQalFMFDuF65ajad7FbuvX+eudJEiWt9VUl7WBQKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706718880; c=relaxed/simple;
	bh=KkISyzoAojn//Mjk2EK2BnzD/RKHkw5boJQbVVV65z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJUvcgVes8rhC5wVtfwpZEzIwr4TYNTntzZrYerMBefmxrvixoSvyxsHs3u3OPyK5dqHP8oiTUdtzPsjENtx+RmV9Mb5/R681zMy6EqqNFA3WVJSZZalsIvgkGb9TdNBvAZJPeJwaOiLkWSYBLwK4INjiRxMGmt2qCmZtFs4QpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX5iwNQh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX5iwNQh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55f19a3ca7aso2094258a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Jan 2024 08:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706718877; x=1707323677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkISyzoAojn//Mjk2EK2BnzD/RKHkw5boJQbVVV65z8=;
        b=kX5iwNQh8K40I8ILcJQe3Og5jpBLmlFgTPJvxJ3VnyYdoKJUGg87o1Drb3Athi/b3W
         cYmwzSFbv7fcDW8NxlsGDh2c9SvqEfcgAMN45gl5sFNQIQ/kDaOFmfeSTdBVBNjj2T0a
         7QHAOOn+Bp5dyDdlqvIX6ihX2jc4hfIkzTyYkQURle/VjzPzGzzWb2i8cgylPrUd1AmP
         YPM6ukBZzNji+Haex3IwXoBpvcVoPjgRGDyJpYJAHGxmPZsWntxWU46w/jnnGso+IazL
         iROQcIgyYb7abzifGHj6U48XkPgQN343D8cgUB24HipbxuzqxxUclXhHkd8LRmi7MtZC
         7vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706718877; x=1707323677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkISyzoAojn//Mjk2EK2BnzD/RKHkw5boJQbVVV65z8=;
        b=OMHRQyostnLZhlne8D1orHTVSlMlmAJlo8/J8Yzr1GVkJ+koyAavhHVDvMKiCKpotn
         NLZ15+Prjr4HsPTD3q745LPxCW0kzbBjdn+6v84tLuNawNTYhP0BoRNrKkrHMLdvti8l
         XVIpdK/0E554/5ld+r81PVq3xjg6g93xcD7pOJyxzc4614PNwt9zUCWiRCFf2fAoMSm3
         VOIIV/b2jndJFslMljNt65s0I/WXneAUKYmiWdMs1iAyBo+D0qaxd105kS1ETFnNzBo6
         yx8puerNCtvmw4JR5ljK7IEyZoA0oyN4APzCQYSXOLxKhjoCVUbcsG2jcagfzJI6TrdN
         Bhdg==
X-Gm-Message-State: AOJu0YyrzxXbQFE+nV00pzOl0MYLNxXL1t0guelMriv3M6iytvmEUojv
	4sd/Mx9SL+31/97SVodGNTL8LVN9lgn3LSDAnOqBpnRkJxkQB4m0aCqbsCpiPcNLT+i/lSZvfhU
	5PUygLCJNoW/RKAZ1ahpIKUkAj4U=
X-Google-Smtp-Source: AGHT+IFYlD1g6oncACUWLgW/IS5NQxgKuyArc2mFdJsTASkUAWJlfEbLzj0KK+0uHYcKfDacVh1UqrmEF70G65ybS18=
X-Received: by 2002:a17:906:57d9:b0:a23:7633:59ae with SMTP id
 u25-20020a17090657d900b00a23763359aemr2193751ejr.9.1706718876708; Wed, 31 Jan
 2024 08:34:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240131125920.2879433-1-privatesub2@gmail.com> <20240131125920.2879433-2-privatesub2@gmail.com>
In-Reply-To: <20240131125920.2879433-2-privatesub2@gmail.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Wed, 31 Jan 2024 19:34:25 +0300
Message-ID: <CALHCpMjkfvmN4i98FW1HxH+tNoOCsMJFwjwmLR6WqRvhizZGKg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, John Watts <contact@jookia.org>, 
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aleksandr,

=D1=81=D1=80, 31 =D1=8F=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3. =D0=B2 15:59, Ale=
ksandr Shubin <privatesub2@gmail.com>:
>
> Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> controller witch is different from the previous pwm-sun4i.
>
> The D1 and T113 are identical in terms of peripherals,
> they differ only in the architecture of the CPU core, and
> even share the majority of their DT. Because of that,
> using the same compatible makes sense.
> The R329 is a different SoC though, and should have
> a different compatible string added, especially as there
> is a difference in the number of channels.
>
> D1 and T113s SoCs have one PWM controller with 8 channels.
> R329 SoC has two PWM controllers in both power domains, one of
> them has 9 channels (CPUX one) and the other has 6 (CPUS one).
>
> Add a device tree binding for them.
>
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> .../bindings/pwm/allwinner,sun20i-pwm.yaml | 88 +++++++++++++++++++
> 1 file changed, 88 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i=
-pwm.yaml
>
> diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.y=
aml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> new file mode 100644
> index 000000000000..716f75776006
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner D1, T113-S3 and R329 PWM
> +
> +maintainers:
> + - Aleksandr Shubin <privatesub2@gmail.com>
> + - Brandon Cheo Fusi <fusibrandon13@gmail.com>
> +
> +properties:
> + compatible:
> + oneOf:
> + - const: allwinner,sun20i-d1-pwm
> + - items:
> + - const: allwinner,sun20i-r329-pwm

According to the bsp sdk and other mainline drivers for
R329 SoC, the sun50i prefix should be used instead the sun20i

> + - const: allwinner,sun20i-d1-pwm
> +
> + reg:
> + maxItems: 1
> +
> + "#pwm-cells":
> + const: 3
> +
> + clocks:
> + items:
> + - description: Bus clock
> + - description: 24 MHz oscillator
> + - description: APB0 clock
> +
> + clock-names:
> + items:
> + - const: bus
> + - const: hosc
> + - const: apb0
> +
> + resets:
> + maxItems: 1
> +
> + allwinner,pwm-channels:
> + $ref: /schemas/types.yaml#/definitions/uint32
> + description: The number of PWM channels configured for this instance
> + enum: [6, 9]
> +
> +allOf:
> + - $ref: pwm.yaml#
> +
> + - if:
> + properties:
> + compatible:
> + contains:
> + const: allwinner,sun20i-r329-pwm

Same here.

> + then:
> + required:
> + - allwinner,pwm-channels
> +
> + else:
> + properties:
> + allwinner,pwm-channels: false
> +
> +unevaluatedProperties: false
> +
> +required:
> + - compatible
> + - reg
> + - "#pwm-cells"
> + - clocks
> + - clock-names
> + - resets
> +
> +examples:
> + - |
> + #include <dt-bindings/clock/sun20i-d1-ccu.h>
> + #include <dt-bindings/reset/sun20i-d1-ccu.h>
> +
> + pwm: pwm@2000c00 {
> + compatible =3D "allwinner,sun20i-d1-pwm";
> + reg =3D <0x02000c00 0x400>;
> + clocks =3D <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
> + clock-names =3D "bus", "hosc", "apb0";
> + resets =3D <&ccu RST_BUS_PWM>;
> + #pwm-cells =3D <0x3>;
> + };
> +
> +...
> --
> 2.25.1
>

Best regards,
Maksim
