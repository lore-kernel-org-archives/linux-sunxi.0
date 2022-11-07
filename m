Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4F37F
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 17:44:16 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id f27so32216379eje.1
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eWjaoBznqoj2kM89mZeHCIKl3bnIdWJhw4wamO+Cyo=;
        b=gQi8cQ8zlsuNHXSruqHBWQD7jzzllZymlS2SVI594uYKR2I2PAK8IcakFFIhp4s0sa
         lplCEl40Iv5NK8qEomSZ2cy2dT8/yxbOf0ZegzW7Itqh3vbYTI5vcrmSCwmdWu49TRZa
         ugoayL7w+pfrzqcrwVljsvaJRq2BaDEQEwOIIPGFQ/p2V0WvBcjfz11VYLswsRuAQqla
         ii7YJSmTazshE9zf1sSJ1Hv559UsUxzgcwgUDKoIF9Ho2yFx+co//WLc7xaKXa6g62T5
         eZLSUZUMAdlB70cagU28SAaXkI35MH7LaNSRCea0EXsT6zX+TtpvUwmZCaV5jpi0Ms5X
         Rhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eWjaoBznqoj2kM89mZeHCIKl3bnIdWJhw4wamO+Cyo=;
        b=b928FZEIKlxG6a9VFbbGcOCGBAgwOU/sFteedGCpmF5mh26lpSszy2WdEe1ViA/nFf
         yD6d4WZ0n6LPHiZcb3Nm4JlCsOgd2pnpGMvkCd6Xir4fD/MwutVnBP2cW0qj8sOFUWgM
         aWGlMMiT81JABvUV/egQwd71OQf57+T6PDyOFjEKljlj0//u4Hi92X/QVOcBallU/zuJ
         hhwVbKe2yZMHV3SAR4/t8orwmL6shwY3KxBPMlXTxMW7T/7kRNBC3cGiGAiiW8+q6FRP
         anpJIcdP2JU95JXqMzImWPxWZTF9DEZxhaQ9Gce5eImRscVdcq5Ba9J7CKANzXwEnza3
         K3Yg==
X-Gm-Message-State: ACrzQf36gMyb2X0pg70KoDpoCP068wApnh36BCbKuYoLabFL43BU0R/Y
	KieDevl/+J2Nwb6js3N+hu0=
X-Google-Smtp-Source: AMsMyM5u1DyyUIQOXXJaLbM+lyY524+zMvhbc3473zPBgeiGrfroqdUpFBfrRcxzqBUKNFxQ4IT/5A==
X-Received: by 2002:a17:907:60c8:b0:78d:bc8d:8457 with SMTP id hv8-20020a17090760c800b0078dbc8d8457mr47448621ejc.418.1667843054363;
        Mon, 07 Nov 2022 09:44:14 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id u18-20020a509512000000b004611c230bd0sm4565884eda.37.2022.11.07.09.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:44:14 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Icenowy Zheng <uwu@icenowy.me>, Andre Przywara <andre.przywara@arm.com>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 10/11] phy: sun4i-usb: Replace types with explicit quirk flags
Date: Mon, 07 Nov 2022 18:44:12 +0100
Message-ID: <2120524.irdbgypaU6@kista>
In-Reply-To: <20221106154826.6687-11-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-11-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. november 2022 ob 16:48:25 CET je Andre Przywara napisal(a):
> So far we were assigning some crude "type" (SoC name, really) to each
> Allwinner USB PHY model, then guarding certain quirks based on this.
> This does not only look weird, but gets more or more cumbersome to
> maintain.
> 
> Remove the bogus type names altogether, instead introduce flags for each
> quirk, and explicitly check for them.
> This improves readability, and simplifies future extensions.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Thanks for working on that, nice cleanup!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


