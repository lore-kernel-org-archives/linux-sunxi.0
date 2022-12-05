Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF88F15C8B
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 20:13:39 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id z92so17452878ede.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 12:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cWtDONIsCwTgfk8sAybr8IvLiR4HP8gBPcVUNlysGg=;
        b=iglSNUijG2rKTe2lz9E2sf3v7dbj8huBMfl2nT9sDlAq8ieIr/fqh60MuPioWhktMC
         TUfHhi9/K9nz7eSIbOQ9+cDZEA01LwpOA5pYeUkY0I9XfodYJowNmAFM0QzOG3JfA9zj
         ZlmeDbpfVgwkF2bDoruKE5tdNxfUlPYJ9Szpr1csQzB2VOOHxBUHlJNIU6mnKBwxhogu
         cc+NRNjvBz9bdEAxc+IJTyXPxTSGJA3ri5jxAqLHPtEP4O64Nc84OF2yTLglhvFeKvJz
         d4Vi6WRGbK2uCyTVbJesGIndB3AIWuOnXq6d+G7Q7cy2baE6m5+DMuMMjjtSvvwsreOo
         PMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cWtDONIsCwTgfk8sAybr8IvLiR4HP8gBPcVUNlysGg=;
        b=45qNF2xdVi8MdIdQf4aL+myLTgxrK530512T6mGuWDXuWyRfsDrtLBKt24GwI+dZtK
         ecqzh2+cyst2Mx6HCAI/lnMVuFTTi8/Jmyg+G2oTTkLFw5MBNXSnuG2+2x/cuk1Lbq0w
         L9k+xEsOmwOUB22q70m3/NUWLDERlH12tf59CcRzcWOP1g/yPhw6junr6V3n5xv9q/Vm
         3tg/HVVCMDpvC4lax6XFWInLIo8ZO74SzFtV6VnYrCW+OGTGM+6UHCmsYyUaRq2tIF+z
         3g9ZhCTK7brBlXTHNRjQBZh8ZDwHS2nm2fAIniptMKrULPYmTmoi+9rXmZoT+J2NwLLy
         muQg==
X-Gm-Message-State: ANoB5pkOW9ANYGkkeyfcKJ2XMh4bJ00xC0yuMDdLnR8qIzlS8RX0e1zE
	PQfK/ibWbgegI59RaLBRGMg=
X-Google-Smtp-Source: AA0mqf6foAvuv64vb+zdQVhIad9BChvylagP1dX5NL09miVDfVqvJUjgy1j4HCpuD07CEIIMwp8vDg==
X-Received: by 2002:aa7:c754:0:b0:46b:6096:a884 with SMTP id c20-20020aa7c754000000b0046b6096a884mr28674921eds.152.1670271218282;
        Mon, 05 Dec 2022 12:13:38 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906200a00b007ae243c3f05sm6448466ejo.189.2022.12.05.12.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:13:37 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, =?utf-8?B?QW5kcsOhcyBTemVtesWR?= <szemzo.andras@gmail.com>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: d1: Mark cpux clock as critical
Date: Mon, 05 Dec 2022 21:13:36 +0100
Message-ID: <4787189.31r3eYUQgx@kista>
In-Reply-To: <20221126191319.6404-5-samuel@sholland.org>
References: <20221126191319.6404-1-samuel@sholland.org> <20221126191319.6404-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sobota, 26. november 2022 ob 20:13:18 CET je Samuel Holland napisal(a):
> From: Andr=C3=A1s Szemz=C5=91 <szemzo.andras@gmail.com>
>=20
> Some SoCs in the D1 family feature ARM CPUs instead of a RISC-V CPU.
> In that case, the CPUs are driven from the 'cpux' clock, so it needs
> to be marked as critical.
>=20
> Signed-off-by: Andr=C3=A1s Szemz=C5=91 <szemzo.andras@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


