Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796714406
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Sep 2023 14:44:17 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9adb9fa7200so728085166b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Sep 2023 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694961855; x=1695566655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76MVv177zY9dsxPsQgQCgjtWxWwiLSVOTVF9dOpujsM=;
        b=F7mh4UfeOyxaxvmBdCNQ+Rc8R5gUXCGlgMkhqApcVZ7Sy7xHK6w9HqPtQY0bIwRkj0
         xHWDfeiJNSLddNdC2V/d2Mx47htZZHz51pGq6Ae78TPfChVwWuyW/TsuQZgkSDCI0ME4
         4jAR0aM528PuNdSzF+xZixX2ldnLGA5WujzEseEKRnOKxJ2IS9FrCKZU6fDGLB3fJyre
         OIllxt8cKaZ4WtG1klFI/DijdhDTb+eJP0n3s1Be5haCmEHvPuzZ+cFgcmCjd6JwsSSU
         HKOzPsqMdSr3XPq3iyYNBA2vY+an+zlgy8fxQ60aEeESs4wMcPqFIdXUl5UX29vnhdf/
         GCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694961856; x=1695566656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76MVv177zY9dsxPsQgQCgjtWxWwiLSVOTVF9dOpujsM=;
        b=NKrJOBpQjAAtgE7UuFic5J/BY7SFEt0jWMme43b54j14dI2hnnNF3B+t2YDhKdItI5
         r/v2RWB+IuX3DAm7GeCJCxLgW260mp5ACH1M1kG8YpqyxwmJ5hlMiWKKmwdBq70dCpIs
         mSBdb8WXU6tAJdLokwoFTCWLY0Y0YrWUceG3LC9/9JKJhQxJX9fnTkBPf1apo9fg7+Uw
         Vfsz0u2MGsqKzCcrpFO2C6Ers6M2uppL0x3DRHvXyguX8/6lOdI7zlMYd6chovoCTPIJ
         viQN6a1poqF5WwpyYmgBUGVZssGsYtB/lN3wQ4vtG1xK+EDIy092jC5XSqJQcrE6jPII
         e7kg==
X-Gm-Message-State: AOJu0YyLpSH/k5B+fUCiWjVmSCuomw0nmMZ/oxXXap91jEwzGr4EUL60
	khj4MMtYSEq4/rRJ6dYg8So=
X-Google-Smtp-Source: AGHT+IG10fQvNKmNWOCHHO3EJrMAN6SKA+/1Io0nXHROE7X4TQTiZl1pdzhSV1Hr6ZXK4WLsYWLxDQ==
X-Received: by 2002:a17:907:728e:b0:9a1:c69c:9388 with SMTP id dt14-20020a170907728e00b009a1c69c9388mr10830626ejc.37.1694961855448;
        Sun, 17 Sep 2023 07:44:15 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-246-155-gprs.simobil.net. [46.123.246.155])
        by smtp.gmail.com with ESMTPSA id e24-20020a17090681d800b009a2235ed496sm5176569ejx.141.2023.09.17.07.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 07:44:15 -0700 (PDT)
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
Date: Sun, 17 Sep 2023 16:44:12 +0200
Message-ID: <4863891.31r3eYUQgx@jernej-laptop>
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
> Link:
> https://patchwork.kernel.org/project/linux-riscv/patch/20230915201946.41844
> 68-1-robh@kernel.org/ [1] Signed-off-by: Conor Dooley
> <conor.dooley@microchip.com>
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi index
> 8275630af977..b8684312593e 100644
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




