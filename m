Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7164B21A0A
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyfDVv+a"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31f71b25a99so2276026f8f.2
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697224950; x=1697829750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kye3A1Yvs5J4Iww0la3AMmDBB+iCND6AhkOM5t1F0VI=;
        b=iyfDVv+ajXXY0Cd4MunDsR2meTl7M2gDO5xBoy3xYf2uGXTOzz6sI9XXQ90s0YMSK3
         3YYv+Q76EZPU4OryRybyWZMBiN/+jBjr4vRb8iRwcpfQsI1LGpDeN8kACwKdXcGU27SO
         RheCZ3vZYKT+qlKzOo/kcAo9pSkRpvycirOwK/eIrWEoIrDopiHUzFD9H1m+hdoz/yTb
         jrmH6/sJcD4vXeniMlXKzimWKCwR/hshHxN52q+Rlqfn27GNM9MHUfhLrRu0/eU5YvWi
         7q9uUxRZksuU8oc/CEQwqBM2ai79laPXWeKwTHEduKup0bTi34+j2+y7s9uvMpI9N6Qt
         ZA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697224950; x=1697829750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kye3A1Yvs5J4Iww0la3AMmDBB+iCND6AhkOM5t1F0VI=;
        b=Lp09V4xvsbskYaTRfuIeyihwZsbsw8kDdN9lwWPChAtbSFM0PAljIjjIsIALPAGSn4
         xpPCC1EBH3kYemTryauKtHmnCwKc3dCVzZjTDDFZn4KREQBkqlXV1C+q3vcqN4a1MwTg
         dEYlKVpfQFp64PjOhctO1wg/WlHtc75mY3yYVR/TKBVoXBOS27r6bvYwBUre/Mjxl0ZO
         kR6vjMtzuHW0QQTwqNN8kx/8YhNzqPLMXtoVWNW0bjcGXbmEOfUcerBKaCnjMeqg+Q4I
         BVS//c/R0X9IfuJTMWdwcz8HV4oYFP8hQ+Oem7OujqW8BmlIiOeegNC0oSUgfTEJoZ7J
         SjCg==
X-Gm-Message-State: AOJu0Yww1tVdPtxZhpIh7tILaj716ajid+t9SMcWf1IQ3ve0jBhJQ5go
	9rhYqm5aL2PyAKBr4SUZ2uI=
X-Google-Smtp-Source: AGHT+IGajdHE3PweJdvXSQ0yret8uEjGOtFP2vrw3G3CEj2ABtyBTVw14FyU6Qk14fADJaWQKUMP0A==
X-Received: by 2002:a5d:5391:0:b0:32d:9d3d:3025 with SMTP id d17-20020a5d5391000000b0032d9d3d3025mr1851163wrv.26.1697224950584;
        Fri, 13 Oct 2023 12:22:30 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id i2-20020a5d5582000000b00323293bd023sm842831wrv.6.2023.10.13.12.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:22:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-riscv@lists.indradead.org, Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org, conor.dooley@microchip.com,
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
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject:
 Re: [PATCH v3 5/6] riscv: dts: allwinner: convert isa detection to new
 properties
Date: Fri, 13 Oct 2023 21:22:28 +0200
Message-ID: <3766810.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20231009-moonlight-gray-92debdc89f30@wendy>
References:
 <20231009-approve-verbalize-ce9324858e76@wendy>
 <20231009-moonlight-gray-92debdc89f30@wendy>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 09. oktober 2023 ob 11:37:49 CEST je Conor Dooley napisal(a):
> Convert the D1 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied, thanks!

Best regards,
Jernej

> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 0856f18dc3cf..64c3c2e6cbe0 100644
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




