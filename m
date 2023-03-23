Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9CD2E2
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 21:17:16 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id ew6so430714edb.7
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 14:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679606235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+99Id4vlxpRMOhGjaSB6bloNnr3EAmVVri5OUB3HI0=;
        b=Z0OU4zaxuMlq76Gk4nh+Y3sS3l4JuzykQcrJRFgVcU4j3G99BBLVe5F8T31Hs1pnfF
         hYPLX9iuFec7w3kEKsmgrOGm7M0dfAXgq0u6Tw2FglaTMif9h7HGqo306Nz6FSKUfdxs
         /E8CtpxeTvNfOIVx8LcKy/9AU6GDQj6pOXr30TAad6lh0Qw7dNL+V3CC17p0hpWI1PyJ
         JP+dWjVOA3cB6bETXZ+L4xHytwjWrUfnrcmTWlxCLf9N6fpPp2lsvVpEmoGzz4RtQw9c
         OcTeKFFPxCbmCtyYq2tUArCpX7wefJwkmGb4fS18m3V5qswE+8F7KsDwk4+R3De956Ie
         uSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679606235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+99Id4vlxpRMOhGjaSB6bloNnr3EAmVVri5OUB3HI0=;
        b=pu8GSS5vaRSLP7eg/rkTTlAf8CyA6rTZ528fjwYaq0t9XGwZBk9D2DsnUIEqq4hj/n
         eIi2z3B/59s7LyQwFNgGFMxHtWvPe2ABemovS4ptDOmP2PSs4bTWDB+R08FRTE/qh1gZ
         XLasjwgnwbMS/DKOPXVvMmB/6QNHGAqpCqQy5208XS6I2at2WfYSKF9K4FoCU7/Hiw8R
         VHs4+xDk80sHpbK3gni5gCUfzQreGK3NeKkMhggEk5yARjpM308yXBeZCyBhtRux5lWK
         Z4H1zbcxElMKJ6/6xV8bneFG497+of/pNsNASjxxJOdANaHj678K9rvp2iy02PLiRx5f
         8kMw==
X-Gm-Message-State: AAQBX9fyWEHBUzyciS5rT/HwKtroraoj4MbRrQvyelxLJSBZwmOPmJVJ
	S7efYOg3Kig+H99jo5nLdOM=
X-Google-Smtp-Source: AKy350YXV7OnGGHypgylfPA7W/z5nJ+1x5GYw3D1Ob/zxZAWqv391Qz43ld0dBcs8lA0IxMw54UvSQ==
X-Received: by 2002:a17:906:fa0b:b0:8b8:c06e:52d8 with SMTP id lo11-20020a170906fa0b00b008b8c06e52d8mr404362ejb.36.1679606234729;
        Thu, 23 Mar 2023 14:17:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id r5-20020a1709064d0500b00923f05b2931sm9111409eju.118.2023.03.23.14.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:17:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?ISO-8859-1?Q?Andr=E1s_Szemz=F6?= <szemzo.andras@gmail.com>,
 Icenowy Zheng <uwu@icenowy.me>, Fabien Poussin <fabien.poussin@gmail.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Belisko Marek <marek.belisko@gmail.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: sunxi: add Allwinner T113-s SoC .dtsi
Date: Thu, 23 Mar 2023 22:17:13 +0100
Message-ID: <13227090.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20230320005249.13403-3-andre.przywara@arm.com>
References:
 <20230320005249.13403-1-andre.przywara@arm.com>
 <20230320005249.13403-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 20. marec 2023 ob 01:52:47 CET je Andre Przywara napisal(a):
> The Allwinner T113-s SoC is apparently using the same (or at least a very
> similar) die as the D1/D1s, but replaces the single RISC-V core with
> two Arm Cortex-A7 cores.
> Since the D1 core .dtsi already describes all common peripherals, we
> just need a DT describing the ARM specific peripherals: the CPU cores,
> the Generic Timer, the GIC and the PMU.
> We include the core .dtsi directly from the riscv DT directory.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


