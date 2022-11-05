Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622EE7C
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Nov 2022 21:13:41 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id y14so21325424ejd.9
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Nov 2022 14:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3Atp6OQ0hihmNz5QNadkHqhzgkTJKoUcjOaBjypw+Q=;
        b=bglHRnU7qLXHRwlACNnGxRtFU87lku3jx4z8p+iuFay60Y+qhtekjyPje77IX2HDUm
         PQqQWBuCa5r1TADFDwyvCE5As/H+aB7sd/4WYChe2pomHXSaVaqszjNd556B0ViY3QTf
         dXsFgprtTwBld3U36VY2vBkYBuT5lsZ6qde8XiV3CaYm/nQJwPYiiVyBHdZQdMaRF7bb
         tBvlENeZXV01SkeWeEvj8lojikZX3K6pnbpZksLONvd6BzBxxHIeHIG1g70opmppmoit
         qn0EwdMw3SiTI3AXQ/eIhv/+VPKpwRj2H5zGv0MPVQjDEOSPmxBM6yp7kXXceRO+g9UN
         MqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3Atp6OQ0hihmNz5QNadkHqhzgkTJKoUcjOaBjypw+Q=;
        b=5+NfExp8XUwEcnJevMgvzgt87UxMukI0qojClOAefzFG5f+4muZANhvOHT32vX8XHS
         5aNxteeaTFFC4zRZqcuG06qcey9CPDwz2fKM8noPI6+d99A0XUevQs5xlKpq+hLpek5t
         Un96tSq0ZZZU7HhDAXIsmBm4ZMXpil/ENZQzmKM14jIXFEunc0iOdZx6m6tt/XkstN0R
         s4gleidfo9HiXWnXAd2D4xo2U3V//Q1om9KNB8GxsnQWxWbRGRhxM8MZdVwbuSfbfvzZ
         uNy/lOF0KvWnCm4kekJyGu0iRntKj5hyfVOWBZO8/A1z7j97nIYDW5PHVFj7C272srcy
         p+xg==
X-Gm-Message-State: ACrzQf1lYmnzZUGXTBdyWfwJBtGxXDxOXATgoqjOIe9Jm1OfbqyufTcn
	OyzWiMUL3okshaFPE/ZWg74=
X-Google-Smtp-Source: AMsMyM79/7WOpzBWpxDgJ8bsfPTIPC+HmiuFD6hoPreKi16DPueMc86u46duAg2o3oOTVhj7pnUXHA==
X-Received: by 2002:a17:906:33d8:b0:7ad:a195:ce51 with SMTP id w24-20020a17090633d800b007ada195ce51mr40269876eja.365.1667682819641;
        Sat, 05 Nov 2022 14:13:39 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906300800b0078d22b0bcf2sm1324907ejz.168.2022.11.05.14.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:13:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 6/7] arm64: dts: allwinner: h616: OrangePi Zero 2: Add USB nodes
Date: Sat, 05 Nov 2022 22:13:37 +0100
Message-ID: <3195779.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20221031111358.3387297-7-andre.przywara@arm.com>
References: <20221031111358.3387297-1-andre.przywara@arm.com> <20221031111358.3387297-7-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 31. oktober 2022 ob 12:13:57 CET je Andre Przywara napisal(a):
> The OrangePi Zero 2 has one USB-A host port, VBUS is provided by
> a GPIO controlled regulator.
> The USB-C port is meant to power the board, but is also connected to
> the USB 0 port, which we configure as an MUSB peripheral.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


