Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D92DDC9
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:42:15 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99357737980so621366766b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695584534; x=1696189334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1OAJIe+rOLUJzcNXVPzHOsb+JGDg6uIpunRCjru7BA=;
        b=WdnUbKH7Zbp/snGFChW1B3xJVF67yEw9MULtShdMWfY6M3IeBW9N7eBdLEGLZwIKlf
         8xy4iQ3v4ppRY1FRTkzqDTf9txC7UIgKnuPMunBfAX62/iAXTmgWyZQ/+Wzy6OupPQjy
         Zb8WD27bP3uOJ2wOu/S1eCR0PINoy03Xe6Qpalmf0/G/N4fxIjY0gbUSOaY2mZUFClno
         shI/VGP/INiTWGw06azaeJ8v1JdkuTkQ8ent4WoUooFGDIi9yxaccI07WOuMWorlBXCc
         y3y1g8fEnnOydNKPqF34HzXOaXbzddT1rPh5LKv22+9R3iSrOmN/YKS5eiACshM1QKLS
         012w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695584534; x=1696189334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1OAJIe+rOLUJzcNXVPzHOsb+JGDg6uIpunRCjru7BA=;
        b=AEOIVHzdNMu8FFpQlNwVsV+Q25QOG397Fmtz4nODJidrLkAXpzvLc1SGpMgcPKTHiv
         Hq4sTx0QroOHTwqs0Sesx/STJVOcvsPBN0Wmwqtq/KheG1iG60nguqydXg97/8+BSZ+K
         BTegdyZmpI0YD9LFMy7vwFjK8oLy6R4fSShYmwGnjvC5iTkRKD0Ohy1PUT2VaYAaL8XV
         DNQQTOmciYfSmNgg9i/VDZNoUXD9oBuqf3flpe66qInqBMWuy4eoBQlPK0ertRlcsakm
         DCf4fvnBKbUrW6nDjRi2c0IW5XO2lgyUgei4wJ2cNCe3xTamibbRGDNwVYw6ysAK3yvE
         IeXw==
X-Gm-Message-State: AOJu0YxwgLG55bwV+R3ZFFqAspwPnborpUtqATdgyrl+E8IXwBh54jk+
	En9n6k7U+m/Lc6WxrDqXe9Q=
X-Google-Smtp-Source: AGHT+IElTLWdxYzDdmFsBbLbnhFSAtGhPSM0V5vdb/GQFUHvl00TjFJ8CTOxEMzXqAItwMFv4I1k2w==
X-Received: by 2002:a17:907:2e01:b0:9ae:406c:3425 with SMTP id ig1-20020a1709072e0100b009ae406c3425mr4634928ejc.0.1695584534105;
        Sun, 24 Sep 2023 12:42:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id d18-20020a17090694d200b0099cb1a2cab0sm5322258ejy.28.2023.09.24.12.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:42:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
Subject:
 Re: [RFC v2 5/6] riscv: dts: allwinner: convert isa detection to new
 properties
Date: Sun, 24 Sep 2023 21:42:12 +0200
Message-ID: <4833002.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20230922081351.30239-7-conor@kernel.org>
References:
 <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-7-conor@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 22. september 2023 ob 10:13:50 CEST je Conor Dooley napisal(a):
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the D1 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..947e975d2476 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -25,6 +25,9 @@ cpu0: cpu@0 {
>  			mmu-type = "riscv,sv39";
>  			operating-points-v2 = <&opp_table_cpu>;
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			#cooling-cells = <2>;
>  
>  			cpu0_intc: interrupt-controller {
> 




