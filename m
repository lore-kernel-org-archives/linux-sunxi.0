Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C531DF43
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:53:26 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c108e106f0so83588431fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695585204; x=1696190004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0d3YVvRT9dZksB7Z0EZhHU3PKUHlJOKGLc8dKpN2qA=;
        b=Y6qWcc9Xd3bYwZXmPmO1WYUXAEn+xS0r9XwFmuqJoup6TxVWtEM15rd3Xf8Fc0i43k
         gue6YZlv7gmwYu020x2mzhnGp+DUNP8jUSy5j6DadcCzqHTvS6iVaQ0bwTmatTtwSvEP
         4f63J3XpJXFhO1knSzvt8D2PdtqPl4zyANLN1S9l6nTItyATHSki42JsGLh17ASsgEnk
         5gR16TA+stZiY3J3DfL8dkycYYzRvmuMy3Sk9TTxh+aBrU6oUiZAW7uwsUx4/BY7jXMN
         IJtySMRfB0G5xtH23F5BWQSPl4BEShtbAAsXuCacibW4ed+o2RWdhexYCKCn0xyDXWAc
         tIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695585204; x=1696190004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0d3YVvRT9dZksB7Z0EZhHU3PKUHlJOKGLc8dKpN2qA=;
        b=jvzKtH3CjUIm636zgqYWxskXaU385XpD89ct+iBcIuSR+hn4V5Ds34eZjxpqi+mSM5
         krAqoOFMYo2xhtnGYroZU7ZSFDBw/iIhAWPK3vKuGOJyvDj+JWvBdNn5JbBsgqzBPnCs
         DYSobeXkTkMospjIt84LYggUxXOfDq4FEQNVk6jjjm2BUls7aLnYfqsJQXiUBj31zEdd
         +kjxh4ydx8anp3YbnLdAh8e8MAuAxP+AKZm3dlTWLvidbdi3rAGiLU5YbLwKakSZbkSF
         RsP1PMlZmblTBbT4rVJ/9bJuIy+v5qjZx68gpBq2b+w/ZMTbDaJzjkwmAPtGtQYerOqu
         L8Hw==
X-Gm-Message-State: AOJu0Yz9DeCSCc9HeTZaECs7bOf7FUAfT0TFjNu0J1qUrPpOn2cF6ACf
	0L3lCii8bGE3R8YZVTj/H7E=
X-Google-Smtp-Source: AGHT+IGS18qcaUt/JSWnUE5QJPAZC0mw8nPR6JoiV75sIqS6/y3U/VEFHkRsM7E5MB6Xlp/hfv86mQ==
X-Received: by 2002:a2e:994a:0:b0:2ba:34d0:fa5f with SMTP id r10-20020a2e994a000000b002ba34d0fa5fmr3887452ljj.37.1695585203989;
        Sun, 24 Sep 2023 12:53:23 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id ce21-20020a170906b25500b009ad850d4760sm5285822ejb.219.2023.09.24.12.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:53:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH] riscv: dts: use capital "OR" for multiple licenses in SPDX
Date: Sun, 24 Sep 2023 21:53:22 +0200
Message-ID: <3256759.44csPzL39Z@jernej-laptop>
In-Reply-To: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
References: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 23. avgust 2023 ob 10:52:38 CEST je Krzysztof Kozlowski napisal(a):
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

Best regards,
Jernej

> 
> ---
> 
> Rebased on next-20230822, so might not apply cleanly.  What does not
> apply, can be skipped and I will fix it after next RC.
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi     | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts  | 2 +-
>  .../boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts    | 2 +-
>  .../boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts    | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts      | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts           | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts      | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts               | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi                    | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts         | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi                   | 2 +-
>  arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi                | 2 +-
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi               | 2 +-
>  14 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
> index 9b03fca2444c..ed7b12e65a10 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  / {
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> index 8785de3c9224..3a2c3281eb88 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include <dt-bindings/gpio/gpio.h>
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
> index 4df8ffb71561..711450ffb602 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include "sun20i-d1-lichee-rv-86-panel.dtsi"
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
> index 1874fc05359f..b217799e6166 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include "sun20i-d1-lichee-rv-86-panel.dtsi"
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
> index 6cc7dd0c1ae2..10116fb3935a 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include "sun20i-d1-lichee-rv.dts"
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
> index 52b91e1affed..08cf716328a0 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
> index d60a0562a8b1..204da82a5dc6 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
> index f2e07043afb3..e2bb6bc16c13 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include <dt-bindings/gpio/gpio.h>
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> index 4ed33c1e7c9c..8dbe717c79ce 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  /*
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
> index 97e7cbb32597..b18f368e06e0 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  #include "sun20i-d1s.dtsi"
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
> index e6d924f671fd..1a7d6ef33f17 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include <dt-bindings/gpio/gpio.h>
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..450387265469 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  #define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> index b7156123df54..3b077dc086ab 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  / {
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 822f022eec2d..5a9d7f5a75b4 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  #include <dt-bindings/clock/sun6i-rtc.h>
> 




