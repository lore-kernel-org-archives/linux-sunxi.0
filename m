Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BDD257C
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 18:33:44 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id uj29so10308837ejc.0
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 11:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=4+2ulhFVcoDAjZEoMthRjrOaXvnt89QHNhQtRqhHP4s=;
        b=fX9pi09EiTGFxwGOxA2V8wdc4cS8yTLAY5O+Lr6evH7WYQfLNkQPjwLA2TgtZPHOMh
         jxjpmtzkHC8K082p36rUUQDcHGYqPstimpHyacdkMk24iiQzLf37vOOGPjs8l4yVJe/w
         6wkT6xr5guhQGq/x5jslkQCMuRuMWfs1Hdo9pbcV1uEWsP3IKhq8CVlCZXaRjdLnKvaC
         J3lrFLEWJcRgoy1nFmi4hZ8muwNhyrYyAIJqCw5lHhcgfX7dE2IWmJtlS8NnYN2WbD9Y
         5MJQRql+oOAh8Wcw0rOhflL5YxgP26rXhTIWwCPM7JXreuXWjasSScqI9LPII9zRyfQF
         su7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=4+2ulhFVcoDAjZEoMthRjrOaXvnt89QHNhQtRqhHP4s=;
        b=AojojNeVYgPdUnwtlMNYffvZiK7niZz0b4TjlEHX1AMSQdarOL7fcGpX2xFL9PvPQn
         YAbJc0dfPkUzxDgCo9s0I62LnZOQiPM9ci2Y6F19FGOI7/8iIFBSIuUd5ANzLMZjvWvn
         Jv6L77ijW0G00DscY+Wv7g6MjtJbbkhShPdSsM9mWAzvgxZZuwyf0FNkUgqCZlqLUryG
         UgbnV56EMwtwxY/FZ3EtTn8rv8WtB/e7jnM+3slsJiFZUVdQeR7GPQI2w7tDAECnyPt0
         tXWEPeRxXNZT+ybpv+4m1TkWaj3qDGEAWz83A4yOxK9efTlob8amTMErbak6F37j0Fah
         xO6Q==
X-Gm-Message-State: ACgBeo1B5jI0b/df2sCQb7LNVoebUzSL7dYaY4lu8lKdLHp8btbK6Si+
	u4+yX11qfccNM5hXO9V+WQg=
X-Google-Smtp-Source: AA6agR4/M9HH2/f84AG8Fd/KLTX78rK74rtI0dDGgYRxggAqcMOivuaVI3DiNTELE+WqZshrf4D2Pw==
X-Received: by 2002:a17:906:8a73:b0:730:9af8:b335 with SMTP id hy19-20020a1709068a7300b007309af8b335mr8740361ejc.14.1660502022790;
        Sun, 14 Aug 2022 11:33:42 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o19-20020a170906861300b0072eddcc807fsm3183679ejx.155.2022.08.14.11.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 11:33:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 9/9] soc: sunxi: sram: Add support for the D1 system control
Date: Sun, 14 Aug 2022 20:33:41 +0200
Message-ID: <2310270.NG923GbCHz@jernej-laptop>
In-Reply-To: <20220801030509.21966-10-samuel@sholland.org>
References: <20220801030509.21966-1-samuel@sholland.org> <20220801030509.21966-10-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 01. avgust 2022 ob 05:05:09 CEST je Samuel Holland napisal(a):
> D1 has a single EMAC and some LDOs that need to be exported.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


