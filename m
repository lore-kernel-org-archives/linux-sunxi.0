Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DF32917
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 19:45:35 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id fi2so23411557ejb.9
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 12:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fQ8Il+1xPSOiB3xTi8ckjDydW1jD8EUHsIV+FtKFLqg=;
        b=gcOylOkT5WTQ3dPLhA5E174DMkmIRa1bUSD0r6+wz5OxAfjNk7SxKEVM1OeqzEa6lE
         G6sGvyIqD+8r8y9MtT9zdyFOZy5iqZLozIOPh+KntERR5gMjeV4ARS6UoRPNBHPefBko
         TXwhByyu6+zb0YDDT7rJKU06egJpMFRZ0gxByXuFKQbL2PvMqwHAAX872l6+ptFDgQjH
         4Jz4YP9Anf9XT55Ldky6FWHGNT25ImtoWQJgZCxCM1UQy96HIPo+CW5svJXfxa2eFy16
         ylW/CtoDje28JRgdQgYI+XPNuB+sBd6QLVP7bt+T3JFbLIWHWQdXQLNyChYuHdPV62pI
         XFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fQ8Il+1xPSOiB3xTi8ckjDydW1jD8EUHsIV+FtKFLqg=;
        b=NdtEhPaXftehYlWYEK0h/RL0fBHTUaofJ/58FBfg71uw6CdmMablO83cOQKmLU4Ix9
         i+1mK1MRSC3c4xaF9ailBN/+W3xu5iJuzQyIPkZ2XxRkT1vE8OZVdZGydBxG5F3PB2nu
         S4N0wVO0mqQzt8LACKAa3zMoGbeEYTu2cm3xY8qIKOGDikIHohqBX9dQ//PsEaA2tfJY
         tGjhGTWyhRukeuyHLLtmaqCJlHKnkkxup+QeAf/ZiYAnJg01evBNQXkR+Am4fdqKTVYD
         TyWje9Vv/nji8Lyu0T+41pv7f3hyigN16Zmyr8SSz7BbxyY/8Eq737obUX3Kve74dHRK
         xD+g==
X-Gm-Message-State: AJIora8lBTNoys58ZA1H6S8xsxFej3IUWaxSX70YA85RkXiHb/KVxJEc
	uH8HsFeJa2pmLcejIUNloL4=
X-Google-Smtp-Source: AGRyM1sw9aYAXHCG2hkDhMKhQg0SO46odbeaKjrBDV3M21Aft9N3nJaJYcu3RriA6OWDPmkmw471jQ==
X-Received: by 2002:a17:907:3d93:b0:726:3ade:a299 with SMTP id he19-20020a1709073d9300b007263adea299mr35802645ejc.635.1657050333521;
        Tue, 05 Jul 2022 12:45:33 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id p27-20020a1709060ddb00b00722e559ee66sm15992983eji.62.2022.07.05.12.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:45:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Wolfram Sang <wsa@kernel.org>, Samuel Holland <samuel@sholland.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: a100: Update I2C controller fallback
Date: Tue, 05 Jul 2022 21:45:31 +0200
Message-ID: <6399243.G0QQBjFxQf@kista>
In-Reply-To: <20220702052544.31443-2-samuel@sholland.org>
References: <20220702052544.31443-1-samuel@sholland.org> <20220702052544.31443-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 07:25:43 CEST je Samuel Holland napisal(a):
> The I2C controllers in the A100 SoC are newer-generation hardware
> which includes an offload engine. Signify that by including the
> allwinner,sun8i-v536-i2c fallback compatible, as V536 is the first
> SoC with this generation of I2C controller.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


