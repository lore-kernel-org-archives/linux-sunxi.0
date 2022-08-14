Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43462EB8
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 10:21:34 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a7so9093776ejp.2
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 03:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=NgLSVABhBcWdug9UrtD9+LNXeaw8h4QX1AgubMiZPaE=;
        b=EWvXkmaUv98OEwpQ4/IYmrswQI0ewNc7UtMSIuYn7fJHsAM62v+gfIu/BTKPAVTH1B
         pQTRJZQv1BNl8pixFn+wZTIHhHoqpcmYv6cDoko00mjKMdziHvqpzvIrriE+j85mNz6l
         s8S1bnbJ6jIGOucu2dAE2VPK0XTHPOCFA4mjuzfJ8JCtIAUWRmYzP/T17Qn4G+5rVCWx
         O/jxBkup/cUM/qCQsuyA1Uk18oBlV+V0xGbArxcE+nl7Bi6L3tzBzMCzoHiy27ngq2le
         VbSAlwRMnQiXV0gO1fxLwLwUbfhMGZWygn1Ad+EpxitARvigcros1fJ+HWjCeb3ekbLu
         vgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=NgLSVABhBcWdug9UrtD9+LNXeaw8h4QX1AgubMiZPaE=;
        b=Vkt5TQpXElraVV14d1LVfXLYZOifWZj9WQSLQ7GvHhefrLU6PbdEnJfd5sguk+01NO
         Vmp/m0jwMYUZySezlDAwWbyTF3jFPfq3ORBdImkk9F/ytssELIKbsyNF6H8tgAJAGydB
         XhKuPJVDlBokYC7IyWO7qRVpTPad50Jk3gBFWgwObzEarrXOUXf3T1v5j1BN20Axzakz
         UbY1okp+vMS3dxGwmBR9v8/aXbbgGPKJWo8s2RBKGmAG0/sjANN1YD3jATUcN9JpPYkC
         txQD6AfLbxfoA4mJRX+jTDxOeJy/ESJ6xq8T68kUtx/OParJYaqRPrqjeJLlMur+EuVr
         yksA==
X-Gm-Message-State: ACgBeo0SXCIWFsjkeWnO3OFd0fGXhocHC9l9Nzg8HReu27LxPJbmYV3d
	Rg+SoPnbOGnXr9asUobzp8E=
X-Google-Smtp-Source: AA6agR41uSYgu6jwgwi4GNbOiiHGpeVDJUS+R3XUJ+D/AlJZSWhM9JJEsC2Abiy5Ip6gc0dNsSdgCA==
X-Received: by 2002:a17:906:fe45:b0:734:ca71:9672 with SMTP id wz5-20020a170906fe4500b00734ca719672mr7419035ejb.446.1660472492615;
        Sun, 14 Aug 2022 03:21:32 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id jl4-20020a17090775c400b00734a9503bcasm2788909ejc.135.2022.08.14.03.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 03:21:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/9] soc: sunxi: sram: Actually claim SRAM regions
Date: Sun, 14 Aug 2022 12:21:31 +0200
Message-ID: <3368908.QJadu78ljV@jernej-laptop>
In-Reply-To: <20220801030509.21966-3-samuel@sholland.org>
References: <20220801030509.21966-1-samuel@sholland.org> <20220801030509.21966-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 01. avgust 2022 ob 05:05:02 CEST je Samuel Holland napisal(a):
> sunxi_sram_claim() checks the sram_desc->claimed flag before updating
> the register, with the intent that only one device can claim a region.
> However, this was ineffective because the flag was never set.
> 
> Fixes: 4af34b572a85 ("drivers: soc: sunxi: Introduce SoC driver to map
> SRAMs") Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


