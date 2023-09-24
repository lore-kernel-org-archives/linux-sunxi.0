Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C390DDD2
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:54:39 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so14341522a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695585278; x=1696190078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBJ4eW5WukCsQ+DoRqfNvvhyVgTkVqFsDx/NRH21ELQ=;
        b=fMqg8t8XDWCKx43xRZ745yRd2iC3JYqN9HbTQSNfkt4T/FyXUd00ro+ufWEoAdLnI7
         zoN2NMoqNZ+YKOmZEwz7vjWD2ysZrJcVx4Xysco9YHYgN6CR8pU4J6CNkTfzZbCD85B1
         /S2+ZTh8ovc7BslKKnFb0bGPVTDFzTerV8gIskGDl+9D7mcc1IN9RQMxhFCR6iPS3IxF
         rz+cyS7hcqDh5i+qThVhMDlV6o9a1+G6wtkc50CKb+15H/cyPSzMRUs10UJdWSPZuMJe
         XB7lmLf6Ktc5VSCWbTFf9gbXM/VsBfq9sFGl7uto9je4aom2oaNQqUktBH7Tdh+lm2Qe
         rsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695585278; x=1696190078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBJ4eW5WukCsQ+DoRqfNvvhyVgTkVqFsDx/NRH21ELQ=;
        b=REhJT/l/+GIsiMNHXeQlhwdBRunI8i7NKL5pPNSU4G1X7rLEUd8+V78NJPZjTnlL0x
         8GtfdkZu3cdeMqbTP3NzH1cl4kRyILkVYM3hUfAix8m5ls001cKOffRqWNxjIZkK2Z+p
         w4CBDkamZ0jK6xPoj2y4bqxVh87GR4XYmi8TIqiL5VhIZSBnY0T6NhQSI4WX+f//WXU/
         08P5xVmk8cHNzqHF/5aXSviY21ABMuRyKzw0tNv0eSInaM/nD0NlBIr5r6aHvZIdJwQJ
         +7n1TpfUt5pli4bpalGzEDtOoQGBBW1wBgQU0b+LpFZJ1scpCk9amTFtQ2wSjkRjPNhE
         purw==
X-Gm-Message-State: AOJu0Yz3jIsEw89IgBRfXQuN/HtwAmKyAav+YOYhuXge8i7fvlBUdjNG
	LYRxcXxF2voC28kgpL3HPtQ=
X-Google-Smtp-Source: AGHT+IEg4Ffl4e4EwIXj2zJUO5/CRFwkOyfOlyWF1+MbH0y3nxE8C2jfCFV30MbtEJIi+L7O2OTFSQ==
X-Received: by 2002:a05:6402:274b:b0:525:4d74:be8c with SMTP id z11-20020a056402274b00b005254d74be8cmr12848115edd.14.1695585277637;
        Sun, 24 Sep 2023 12:54:37 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id x13-20020aa7d38d000000b0052fe12a864esm4653293edq.57.2023.09.24.12.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:54:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v1] riscv: dts: allwinner: remove address-cells from intc node
Date: Sun, 24 Sep 2023 21:54:36 +0200
Message-ID: <10341211.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20230916-saddling-dastardly-8cf6d1263c24@spud>
References: <20230916-saddling-dastardly-8cf6d1263c24@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 16. september 2023 ob 11:14:00 CEST je Conor Dooley napisal(a):
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> A recent submission [1] from Rob has added additionalProperties: false
> to the interrupt-controller child node of RISC-V cpus, highlighting that
> the D1 DT has been incorrectly using #address-cells since its
> introduction. It has no child nodes, so #address-cells is not needed.
> Remove it.
> 
> Fixes: 077e5f4f5528 ("riscv: dts: allwinner: Add the D1/D1s SoC devicetree")
> Link: https://patchwork.kernel.org/project/linux-riscv/patch/20230915201946.4184468-1-robh@kernel.org/ [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied, thanks!

Best regards,
Jernej

> ---
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Chen-Yu Tsai <wens@csie.org>
> CC: Jernej Skrabec <jernej.skrabec@gmail.com>
> CC: Samuel Holland <samuel@sholland.org>
> CC: devicetree@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: linux-sunxi@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..b8684312593e 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -30,7 +30,6 @@ cpu0: cpu@0 {
>  			cpu0_intc: interrupt-controller {
>  				compatible = "riscv,cpu-intc";
>  				interrupt-controller;
> -				#address-cells = <0>;
>  				#interrupt-cells = <1>;
>  			};
>  		};
> 




