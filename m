Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829B0A29
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 10:34:12 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id j8so9084894ejx.9
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 03:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=wzo/x007uCa6HXfMQAlfCGpeZPzzBdlngiaw5dHiDKo=;
        b=TRjw2/aFGxFEPk773kgZUbxVW7yh9qhMpDpQo3Y796X6EV/1Ec/ZY05nU90L3Cpt/A
         f1aqu+MMBpw80UIDHv6fghQCmkf75jcR/WU1g90lMwxo1xeAtlbpgotJ4YTuNKsr4Lfx
         s/LcbiMvKF74XhX6E9ZVKolfX5GQRnEmzf5OuN7/33R3Dt6Et8on9JXVb9G8RqpqZyzC
         ZsUegrj1hPQa2YARtOSh+ZxWGtnROHrkfLThuFaRzuI/3j+2waMRAA9gKW3jHivF5xRs
         nDsX6+rJ9vewzZETDFmhN2DYEzYK4lbZeaqEy675YWz0HdkANyrKQpF9FrgSFw04f+pV
         rtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=wzo/x007uCa6HXfMQAlfCGpeZPzzBdlngiaw5dHiDKo=;
        b=C9HOU554YfzHAkK21YcDXMHOZ6UP6fimhj2MzYkVRkelB8pwg0OzmOhn/VJykhpxka
         SKfOK43Bq1Uk49/eNta8UEy1MGrUcxcJcgg2DbHFX/b14LULGFhSEn1bDJBC3QHIcR4v
         0TffkUCJcdig0ymIFKhwvribpdnZEkCVcM3XFV6gP8rqhC0BNcSB/+vENEa7BvR2mOQC
         whB3uKBGqQ+qXAgf7j9XhymlyWcMt62a8tCElotnjI1BkQ2vr1U1NpJ4Pj+EY2e1Vs3x
         ryiXsOtkZY2xLkWxq5cl0o75zOy5CV0evXyrSZtT1f5OUbPqkin3oq7JI6fjfA9qNb5s
         +SLg==
X-Gm-Message-State: ACgBeo0Jlkik1/+tWCamwjg4ZT7vz8aMruPJSrq6pTJfLH0TdDVR+N3T
	nbGfas7G4ULEQRZKDW6svyA=
X-Google-Smtp-Source: AA6agR68vjtEeSmB4p3tGG238cu9MyJhZ+D4gcaOReUeNSdAs6XkWbWsaUH4Xda/O4ruBuUwqT21Rg==
X-Received: by 2002:a17:907:288a:b0:730:996d:c605 with SMTP id em10-20020a170907288a00b00730996dc605mr7191809ejc.682.1660473250865;
        Sun, 14 Aug 2022 03:34:10 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id n11-20020a17090695cb00b0072f9dc2c246sm2764897ejy.133.2022.08.14.03.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 03:34:10 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/9] soc: sunxi: sram: Fix probe function ordering issues
Date: Sun, 14 Aug 2022 12:34:09 +0200
Message-ID: <4204539.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20220801030509.21966-5-samuel@sholland.org>
References: <20220801030509.21966-1-samuel@sholland.org> <20220801030509.21966-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 01. avgust 2022 ob 05:05:04 CEST je Samuel Holland napisal(a):
> Errors from debugfs are intended to be non-fatal, and should not prevent
> the driver from probing.
> 
> Since debugfs file creation is treated as infallible, move it below the
> parts of the probe function that can fail. This prevents an error
> elsewhere in the probe function from causing the file to leak. Do the
> same for the call to of_platform_populate().
> 
> Finally, checkpatch suggests an octal literal for the file permissions.
> 
> Fixes: 4af34b572a85 ("drivers: soc: sunxi: Introduce SoC driver to map
> SRAMs") Fixes: 5828729bebbb ("soc: sunxi: export a regmap for EMAC clock
> reg on A64") Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


