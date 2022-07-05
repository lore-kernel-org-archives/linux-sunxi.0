Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC0601E
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 19:51:12 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id k30so8512168edk.8
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 12:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JpHX3o8Gr6YdjHiWia1ySFjvRs3ZRI2eysFYCJSrNlw=;
        b=Xi6YRaopnDGl5B0GRQBbUT0WIRVVBzn1AfWtDzEfHW87dD+rxZc3uJBqNOlx66bztm
         48pP7K0Uwt3mC7fPCglaUfCFvYzHlBwpVFJMVNdhHvuzT4YkgTbNKTAqI4Y7uiRwLtyD
         MhlEqFPTHYVFL5TL9s127cLNFOxAdB0fTotwsJOeKhvYvvOXMhNXWfIfwASFbSOpriTG
         0ac+5KtzqJjws19ikmVKSbX+iNrv190ZDzkX+w4BSMIkiAyqrossLS0jEqUdoqSemB5q
         +jZAbQNqe9Yo+5ZNelmLaKnss3CGEF2Z2y7ajnDgu/owkm8L0XtEgPi49jMbsz05Yq7b
         iisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JpHX3o8Gr6YdjHiWia1ySFjvRs3ZRI2eysFYCJSrNlw=;
        b=OebLu8p+ANyEquHn7drAO5lmFU7zxl8Y5nPGXJ/vd0Ar2RmkmUBM+En5UP3iE0+AAr
         Dpjyou+Ra0F0L1IoW4RCAdKo7w4kVBhFvBWEWN0fgFwfvZiUgmUMZyg2EChUcszk+E4L
         DECvGnUG7C5IIZf6WTrj2F0c0sNMsGdjuLwv/PekOoHBbgBnXQ2RM3xjztnOYDZuJNb8
         feymKpXflvGZB2BraQ6sREQFE3tKLe9IOtVYuz54XfJtdY0UAB9nkn1X387z5fc1TuUt
         onNXWIWoBs+wCUswyIj2zQ9JMtCubUPS+Mqt9G3/IHVWnU4lYb/3BJ5hMaUk5clfAVjo
         G5dQ==
X-Gm-Message-State: AJIora/jqe+b18NwnXL+3z/va1JZP6Yp4s+1cXP2wWp3k7D3tUPISdoq
	6mTdIpqJZyx6wW+3hlxVPd4I/6dZTALgWg==
X-Google-Smtp-Source: AGRyM1sNJktg1YmMdLPTYeKTqHNOv312OI3jMf97duZ3lXEcAUza27lYPuJ/nh7rhfh6F59NsJijgw==
X-Received: by 2002:a05:6402:27c9:b0:435:d420:5ebb with SMTP id c9-20020a05640227c900b00435d4205ebbmr48029957ede.89.1657050671132;
        Tue, 05 Jul 2022 12:51:11 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id g4-20020a17090669c400b006fe9f9d0938sm16474180ejs.175.2022.07.05.12.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:51:10 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Wolfram Sang <wsa@kernel.org>, Samuel Holland <samuel@sholland.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH 2/2] arm64: dts: allwinner: a100: Update I2C controller fallback
Date: Tue, 05 Jul 2022 21:51:09 +0200
Message-ID: <3482564.LM0AJKV5NW@kista>
In-Reply-To: <6399243.G0QQBjFxQf@kista>
References: <20220702052544.31443-1-samuel@sholland.org> <20220702052544.31443-2-samuel@sholland.org> <6399243.G0QQBjFxQf@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 05. julij 2022 ob 21:45:31 CEST je Jernej =C5=A0krabec napisal(a=
):
> Dne sobota, 02. julij 2022 ob 07:25:43 CEST je Samuel Holland napisal(a):
> > The I2C controllers in the A100 SoC are newer-generation hardware
> > which includes an offload engine. Signify that by including the
> > allwinner,sun8i-v536-i2c fallback compatible, as V536 is the first
> > SoC with this generation of I2C controller.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


