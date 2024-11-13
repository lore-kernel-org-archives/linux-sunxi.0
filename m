Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3273A230999
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Nov 2024 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731487838; cv=none; b=cQMix+tPxpR8sYpGVKCVow89jgskDreUEDdP0Kqt6PmDOeKTWUl6qu4WQ8kj67uB0XGS41PYa2khl5LLnm6z3tpmoOp5jMRyztpjgGyRHWmkcqNcJ6EdzeyQVpF2xTsr8kxgKTNkbwOd41pR4HSEbw9i6g+dZONuBlHnQZi2EMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731487838; c=relaxed/simple;
	bh=kVFxWJzrPuWll8DgFXFbv7lBgh/gNNMdDt7g127NaRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYWovc6nRYvEM5qc3ggMinWxOQmVAhg+SKpcY9L99x9bIzwAfY6AH0egK4iNZaPeanZ40zo2uT3tml/feMO4WNjxGiKBxX2v3w45UlOX/acaAQDG24wdATThHFxQ5GsMA64ni8OvfCV92/TjExOv0WOpHMTj37dV307ForvUbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e8607c2aso7347260e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Nov 2024 00:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731487833; x=1732092633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QI8MidwZZ5apE6IYuuUbrPqi3d8lcdFWg29g280gmXo=;
        b=KHN/nScBFtELllJ8nSHd5Z4WGqRwVNML2A2lo5m2ogEyw/94A7J1sy5eM7hZrtjlyA
         HZiaFOaOLZ0r2HPWXDmAOwvXiiBoqzKF9TKiw4TQpDZjtbHPEQAHnJL56fvQTioOMQkW
         Zsrqxw3Noh5bMLFIIbsYOuA7/hYLqBmFeBOo0D2kLi6yp8Ay6WOe6sQdU9h0sjpAPuWr
         aWFG6Wo1dwhOH8gGwMny8QovQ7kZXUyGTmzW9XNaTj0NsntyMDx+PsoMdf0IqpToWwNI
         hCk7Wyey+dF1BRiKBEWGM7YzdKKg/ydfEV67jeQyeExlQZoCpSiDbvI3pTTIY3Tk+RdU
         Cnsw==
X-Forwarded-Encrypted: i=1; AJvYcCVqQTsIFSqRKIZnRPTr7ctQXGK1KInyP9XUjpmfBtnJVYEtUB/969C8rKqj3oQt7In7GLiNeYfzAC/KRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrOkWpvZ5AK2TUCbvZTCi19FK4ecphUCb7k/BpBvRPL4He/pbY
	OkFXYmgsC2B4RboYLff4Mi4cUCS7va7Ba275R2UUCIxs0ZhdzE2duMcg5ETA
X-Google-Smtp-Source: AGHT+IGPvyoq5FAVPgL140f5HZYBtUrUyu0fMe9uS+Z/PsUnhOqP6rgxABAL6kSaQV5XX3RyT9Y8Xg==
X-Received: by 2002:a05:6512:130b:b0:539:fed8:321 with SMTP id 2adb3069b0e04-53d862eb665mr9282664e87.51.1731487832753;
        Wed, 13 Nov 2024 00:50:32 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a72e7sm2117392e87.150.2024.11.13.00.50.31
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 00:50:31 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb518014b9so55609241fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Nov 2024 00:50:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMl4Rj4KCLBO2CrvsBUBSM2cL2qLswGg7WLXtfc2wy47RW6uAgDjLL4yNaAHJfbtL8kht2qhry1RHfWQ==@lists.linux.dev
X-Received: by 2002:a2e:a551:0:b0:2fb:4b40:1e18 with SMTP id
 38308e7fff4ca-2ff2016fc88mr87156771fa.13.1731487831435; Wed, 13 Nov 2024
 00:50:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241111005750.13071-1-andre.przywara@arm.com> <20241111005750.13071-6-andre.przywara@arm.com>
In-Reply-To: <20241111005750.13071-6-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 13 Nov 2024 16:50:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
Message-ID: <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 8:58=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The A523 contains a pin controller similar to previous SoCs, although
> using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> This introduces a new style of binding, where the pinmux values for each
> pin group is stored in the new "allwinner,pinmux" property in the DT
> node, instead of requiring every driver to store a mapping between the
> function names and the required pinmux.
>
> Add the new name to the list of compatible strings, and required it to
> have 10 interrupts described. Also add the new pinmux property.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a1=
0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml
> index 4502405703145..6fc18e92e1e94 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> @@ -56,6 +56,8 @@ properties:
>        - allwinner,sun50i-h6-r-pinctrl
>        - allwinner,sun50i-h616-pinctrl
>        - allwinner,sun50i-h616-r-pinctrl
> +      - allwinner,sun55i-a523-pinctrl
> +      - allwinner,sun55i-a523-r-pinctrl
>        - allwinner,suniv-f1c100s-pinctrl
>        - nextthing,gr8-pinctrl
>
> @@ -64,7 +66,7 @@ properties:
>
>    interrupts:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 10
>      description:
>        One interrupt per external interrupt bank supported on the
>        controller, sorted by bank number ascending order.
> @@ -119,13 +121,17 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [10, 20, 30, 40]
>
> +      allwinner,pinmux:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: pinmux selector for each pin
> +

Why not just the standard "pinmux" property, as given in
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml

>      required:
>        - pins
>        - function

This section should be made to apply only to the existing
compatibles? Maybe we could just split the files and have
a clean slate for sun55i?

ChenYu

>      additionalProperties: false
>
> -  "^vcc-p[a-ilm]-supply$":
> +  "^vcc-p[a-klm]-supply$":
>      description:
>        Power supplies for pin banks.
>
> @@ -156,6 +162,17 @@ allOf:
>          - interrupts
>          - interrupt-controller
>
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun55i-a523-pinctrl
> +
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 10
> +
>    - if:
>        properties:
>          compatible:
> @@ -166,6 +183,7 @@ allOf:
>        properties:
>          interrupts:
>            minItems: 8
> +          maxItems: 8
>
>    - if:
>        properties:
> @@ -244,6 +262,7 @@ allOf:
>              - allwinner,sun8i-v3s-pinctrl
>              - allwinner,sun9i-a80-r-pinctrl
>              - allwinner,sun50i-h6-r-pinctrl
> +            - allwinner,sun55i-a523-r-pinctrl
>
>      then:
>        properties:
> --
> 2.46.2
>
