Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFDA28E4
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Apr 2022 18:45:02 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id kj29so2090368qvb.8
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Apr 2022 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DpzKp6GQylN2DVn3Q8F44AaoMz54tuxDB2xUboNmmNk=;
        b=pzvr3/UvSftncfosMfmgiWOYhMYbYHuIZTCgY5hDDTvmyy0dEedr9JVfuEeVSTpSm5
         Wod5E9A0cF7e6X5SdVy8UQacTpGtFKdz/js8K/09qJ95ej2UAw2PGlDkrsu+YG2dXUGA
         p/jEJQdqi+LBuQNomKnUI+S9NQyVkZ2ZnEbNnNiPIsX8T4w6VzABtzJx/TXysyHMCVQ+
         ScUWgjAh3cPwFtBgN8jKf/CoS7zoCpT0JVr0YNB0YwEC8YxElSpInoxiPR7dP6Gy9x+x
         Z2XHiikQMiTNKC8bErgRGi2i/cEQhRjtXly2a1DC44EwlTnp4zUihn+XzrUyE57MfFZT
         LYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DpzKp6GQylN2DVn3Q8F44AaoMz54tuxDB2xUboNmmNk=;
        b=i7TeQXdOm1s5h/JCnXBGj7Q+/14YoMNCSMGgqK2gb2qPRW1I096BqpArYo2Xq4YpAl
         MSqE16PjDFKN0cDuTXkFb6sDc5HDmS5INRlOWWJRvcxXXcwYX74ry1Owat806uUTh8k+
         knDIoSaTTzd4iRj6c3T9vUK6B2rtTbas2VeXFQ3KTOMZi+2tDLVa6S0PGpeI8PIxAFNr
         7Yjckm0cTvS0vVZJlYVEh7ZGsx+usnuCcbwFggU1OSM2AuAMKOLnYpF2aRNA+L9N0n3O
         1MigxygITMCa21dRPbCQQ28NjfD3oH30wbwgJmu++mU3jJrjWe5GBXXi58M08rKcJ0Lw
         XaEw==
X-Gm-Message-State: AOAM530gCc7dCawh6E2YfaUFSk6Ro1s/FRF1Nz+s6B0VEOU1KUhNpgvm
	n5beKCpfRORrgOW4q0W0RTuIF/0VQVfBLVNckYA=
X-Google-Smtp-Source: ABdhPJyDTdfYVPmGi9JCDZSwQ3dGVcvDeC8/OPyjPu7IjhwDECkrHzuq3quIB48TTMhTBLoEclHmpE49GOqp3rGJBbM=
X-Received: by 2002:ad4:5943:0:b0:446:5c3e:2c2a with SMTP id
 eo3-20020ad45943000000b004465c3e2c2amr4554955qvb.75.1650653101635; Fri, 22
 Apr 2022 11:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BYAPR20MB24721F9954252BECBEF486ACBCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
In-Reply-To: <BYAPR20MB24721F9954252BECBEF486ACBCF79@BYAPR20MB2472.namprd20.prod.outlook.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 22 Apr 2022 11:44:35 -0700
Message-ID: <CA+E=qVfMm=8aQOM_HW_3EeqqLi-Fgn1Ex3h6kor89FQ0KfTvRw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: sun8i-thermal: add binding for
 R329 THS
To: icenowy@outlook.com
Cc: Yangtao Li <tiny.windzz@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linux PM <linux-pm@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	arm-linux <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 9:12 AM <icenowy@outlook.com> wrote:
>
> From: Icenowy Zheng <icenowy@aosc.io>
>
> R329 has a thermal sensor controller that has only one sensor, and the
> structure of it is like the H6 one.
>
> Add device tree binding for it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml  | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> index 6e0b110153b0..87b4103e0a5f 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> @@ -20,6 +20,7 @@ properties:
>        - allwinner,sun50i-a100-ths
>        - allwinner,sun50i-h5-ths
>        - allwinner,sun50i-h6-ths
> +      - allwinner,sun50i-r329-ths
>
>    clocks:
>      minItems: 1
> @@ -63,6 +64,7 @@ allOf:
>              enum:
>                - allwinner,sun50i-a100-ths
>                - allwinner,sun50i-h6-ths
> +              - allwinner,sun50i-r329-ths
>
>      then:
>        properties:
> @@ -85,6 +87,7 @@ allOf:
>          compatible:
>            contains:
>              const: allwinner,sun8i-h3-ths
> +            const: allwinner,sun8i-r329-ths
>
>      then:
>        properties:

There's also a check at line #99 that requires clock, clock-names and
resets properties for thermal sensors in other Allwinner SoCs. Are
these not required for r329?

Also are you planning to add a node for thermal sensor to r329 dtsi?


> --
> 2.35.1
>
