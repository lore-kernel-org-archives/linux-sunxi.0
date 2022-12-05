Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE8815C8B
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 20:16:49 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id qk9so1254965ejc.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 12:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/8PD+0FCsCI5+iBj2b9lGbdoNFHsSi0yThSh9yKErQ=;
        b=fUbiS0O5RNRd/6YLOHExF2EWqK3wCnZYEzYQ4vhl8yHzO9NXLOjsX5fBHsMsG/YpO5
         0EuncsVTRMxs4LWoQgA/NRhKu14AudrbM/hnQQb9DQC4LB9c+qntnAXbRNQApfSWxs6V
         j4xx3bRA+KLz+Celw7jK8swAP29jnoPHm74MD/uhy42TMmO0zTzfEumgpztQz96OaGvK
         E/N/JbvJrOhBiqz3bXE4j0RryuTnVT4kxSbGltjKjd391OvIgsl9i5u67jLFFJ61tI/J
         X5nRNnN/n87a4iR+vgfECNf8cvmKsCgWpUBB1GlJUknuMkThb5hDhceDlLS2kZNKPhFw
         OxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/8PD+0FCsCI5+iBj2b9lGbdoNFHsSi0yThSh9yKErQ=;
        b=czffYSkPVkA6uKF4qeGTrFnvy2fe3Qrkb/r5VL7DQ2w+KwEq8uzpOV7RNQcKf5RQDk
         ieGfaqvmXYp8PFzqfVCNXcnfU936YRAQd0yuIRZlcTLe1ESg8h0+SbI3YodbBGKEKlPG
         ZjwhyWDN/nITb/fcQF5fuFrMqVoenYeGmSIJEay2Y2uSa2oqSFxvwso1fdXA+HcdgrWt
         VTBhtd/fpQngyE+QpDWML2RifVHqYujeR/2z4aXIlZMxBQ+vQLwDUJoyyp5ulr42/LZi
         gSddmQzN4pqDGi8SLK6/hDv9IaMdXZfXnqPkgrVpXyNoZM7Xdvm86WUSXhjNJ1IhbGy7
         FXDA==
X-Gm-Message-State: ANoB5pmLv5zHzGDjUy5tNF3sMfLotuWNhOK6g2o7R9cRs9xqCiuz18Lk
	7nWQ5srGiNqsy7MSdfk598lhQBBGvbxE7w==
X-Google-Smtp-Source: AA0mqf74Gku64+ob6YAE4dV316Y74LBb5vnlKktLNPxs0a6p3f6Hx/aBnfk8Np3/5dcuHpYly/Z3Ww==
X-Received: by 2002:a17:906:830f:b0:7c0:a3c6:e788 with SMTP id j15-20020a170906830f00b007c0a3c6e788mr8193345ejx.476.1670271407686;
        Mon, 05 Dec 2022 12:16:47 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id og40-20020a1709071de800b007c0d6b34d54sm3218302ejc.129.2022.12.05.12.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:16:47 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/5] clk: sunxi-ng: Move SoC driver conditions to dependencies
Date: Mon, 05 Dec 2022 21:16:46 +0100
Message-ID: <1834760.tdWV9SEqCh@kista>
In-Reply-To: <20221126191319.6404-3-samuel@sholland.org>
References: <20221126191319.6404-1-samuel@sholland.org> <20221126191319.6404-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 26. november 2022 ob 20:13:16 CET je Samuel Holland napisal(a):
> Do not duplicate the same expression on the `default` line, so the two
> lines do not need to be kept in sync. Drivers stay disabled under
> COMPILE_TEST because of the `default ARCH_SUNXI` applied to SUNXI_CCU.
> 
> Three drivers had no conditions.
>  - SUN6I_RTC_CCU and SUN8I_DE2_CCU are used on current hardware
>    regardless of CPU architecture.
>  - SUN8I_R_CCU is only used on pre-H6 SoCs, which means no RISCV SoCs.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


