Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAE3AD23
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Oct 2022 20:17:02 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id n12so19230933eja.11
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Oct 2022 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ8nTWipM2h43z45/cmbXzTIVENawNHsahNhS9RcpVE=;
        b=Kxqstm7VQ9wJy7Ij2ipPmH5DZw1MvmdzzW9yPfk91cw2h4QdjBThnTPeMOzrAy7vUt
         fIQwhFtefVZHjmFrYkHiSQj7GVwA4MmCgt/kL/K2koy/z97sLiocW9pv49IL56xXhslK
         kzeRNugZhIHgDhF0MB0lfKw1Bv0S8654fVbc505y+FjRWS8b13OYNSsRTZ9uv/gaT3D2
         KRYrvgtjZlx8VHvuQsAxWFftkpXNgd8+TArKt5ZWGNam2vCZM5U7Fb0bymsxwgbfPHFr
         hzkEIt4jof0kgWZy4kGAYkp6u7fVizqSSl5furJGZbzgv7eJdYCLAIOxlPI5+D/YT/Dl
         btRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ8nTWipM2h43z45/cmbXzTIVENawNHsahNhS9RcpVE=;
        b=ONBq61XJ5piAB7yPmJ/YZLVMreUvbXdnx674ovxpxJxlOwYYmzTTBSbtN8614NXUoy
         bQAuyrRz/EIwZrJNSXlye/KiW2gIQea21oXxhCv07maSvYS7l+urBflaePfAAIEW49kr
         pj46Vq2s8B2FZ8pWscLtm/f/prpw9TeGc12HkM8EWUJFkPk29Hfh51zQ0E+X6tiaLgRs
         hJZZNt4YBBmjB9c7iyDAXv17y0e60D/Px7+QklRiKjLvg/ohIWXm0ZSa9S1xjNmRgSZX
         haUHN824zB2falEnbS2BgeKFoREkysSXYA2yL063ofyjUFarMa4vBlGwcpXUngKG4y56
         VIdg==
X-Gm-Message-State: ACrzQf0POnZL+uCTgH6bxZn9+E7gq4azy22v4Vcq+wPwUefEA2Fr6LLH
	TCzMw6gi+N3+T32FEz1uYPw=
X-Google-Smtp-Source: AMsMyM5NohsjVMEM5se+lXt/+p7Lnxf45BGjphkLILdcCuAYQ4mJbYM2qqJrIcdYTHRO9Be0F2zNhA==
X-Received: by 2002:a17:906:478d:b0:7a3:cf5e:9027 with SMTP id cw13-20020a170906478d00b007a3cf5e9027mr19336206ejc.718.1666815420388;
        Wed, 26 Oct 2022 13:17:00 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id bv1-20020a170906b1c100b007aacfce2a91sm3517868ejb.27.2022.10.26.13.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 13:16:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 0/2] AXP221/AXP223/AXP809 GPIO support
Date: Wed, 26 Oct 2022 22:16:58 +0200
Message-ID: <5870583.lOV4Wx5bFT@kista>
In-Reply-To: <20220916042751.47906-1-samuel@sholland.org>
References: <20220916042751.47906-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 16. september 2022 ob 06:27:49 CEST je Samuel Holland napisal(a):
> This series hooks up the GPIO controller found in some older X-Powers
> PMICs. The main motivation is converting the U-Boot driver over to use
> devicetree, but Linux might as well gain support for the hardware too.
> 
> Changes in v3:
>  - Added patch to remove existing "ldo" pinctrl nodes
>  - Drop already-merged binding and driver patches
>  - Remove "ldo" pinctrl children from new nodes
> 
> Samuel Holland (2):
>   ARM: dts: axp803/axp81x: Drop GPIO LDO pinctrl nodes
>   ARM: dts: axp22x/axp809: Add GPIO controller nodes

Merged both, thanks!

Best regards,
Jernej

> 
>  arch/arm/boot/dts/axp22x.dtsi             |  6 ++++++
>  arch/arm/boot/dts/axp809.dtsi             |  7 +++++++
>  arch/arm/boot/dts/axp81x.dtsi             | 14 --------------
>  arch/arm64/boot/dts/allwinner/axp803.dtsi | 10 ----------
>  4 files changed, 13 insertions(+), 24 deletions(-)
> 
> --
> 2.35.1


