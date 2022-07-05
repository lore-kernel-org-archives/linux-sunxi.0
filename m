Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B806E6020
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 20:08:38 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id li14so1604000ejb.2
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 13:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pIq36v8wbs/crdsFluPW/o6PUn4dC6+CyT1Mue/r6HA=;
        b=Re0vVY2AKXjk6ch8pHfO7eao4ier7bJy84tNV8N6GCRRrhgwN/x20kkMDp1IpXTbGO
         F+RJhCcSc1d3eOGS545ZeziJ2RGUB5rYLZHkptxK9NukD1lfjc5Gd8z8TGYt+G4fmWGJ
         gHaDvuaMxe/wjwXO6MJ+ReoVMw7dW+YY2+szBr/8t+Tr371rYaAYtyCvLoRp8r1R8Vk7
         j88rOH/wz5+/PbJ1eMXVTjIks/Ej0zFYJTR54Xfhr/gB4mcvukIwUhp/rJwQfXK71y3W
         n+HffrFmF6Ey+8EXBIqBcFWCwgdDI/3gmb0ub6Yp2u2vPn2euVcrcRfs+fKDMrdAURbC
         j/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pIq36v8wbs/crdsFluPW/o6PUn4dC6+CyT1Mue/r6HA=;
        b=ASCQFhao6sAP633QKJ/w6sTdQvQZPys5gmya4OT8mgynDbInvyX4WohSc5B/CoJPMI
         2OYMLjwhkmW3K/C1zd+cBaFb81hDWAandYJzc6rw9H53sm5CqMqXUSBvBYdQzAK1YFTH
         j0SPj8NhVignooKx5Xg28KRQXVb4vmM+5fjT9Aq/jfio1v/YCWrtfH1CY6KVagtYwr1a
         BLNXbqCjf67ccUbWJnqnmJDg0FCIHhVpRvQ6bIVOBwxh9kNpIVk6eyJgzHg4SyZWKp0K
         M3sXRuW0Tv9vqNrQ5yad6h/5sZzDAbRsYg00Q1EojXCLtPDqjFREoAVgnNMuZgELI/BN
         kMZw==
X-Gm-Message-State: AJIora+iKLRK3nwxcqYKFNt2RISDZfJFxIZre2qPTT2ZKKAYURrtQwqB
	silIznr44zoPAZbAoL3gW+0=
X-Google-Smtp-Source: AGRyM1tlIP9NshOHw7mRD90hBXUoaOn6/U4K+d/MSfl75EZRSgK1+016xvOMN3dBGdMuomvHtlViEQ==
X-Received: by 2002:a17:907:7fa5:b0:726:935b:2faa with SMTP id qk37-20020a1709077fa500b00726935b2faamr36914434ejc.17.1657051717095;
        Tue, 05 Jul 2022 13:08:37 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00437d3e6c4c7sm13944635edb.53.2022.07.05.13.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:08:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] soc: sunxi: mbus: Only build the driver on ARM/ARM64
Date: Tue, 05 Jul 2022 22:08:35 +0200
Message-ID: <2156179.72vocr9iq0@kista>
In-Reply-To: <8122293.NyiUUSuA9g@jernej-laptop>
References: <20220702032520.22129-1-samuel@sholland.org> <8122293.NyiUUSuA9g@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sobota, 02. julij 2022 ob 21:12:04 CEST je Jernej =C5=A0krabec napisal(=
a):
> Dne sobota, 02. julij 2022 ob 05:25:20 CEST je Samuel Holland napisal(a):
> > This driver exists as a workaround for old devicetrees which are missing
> > interconnects properties, so it is only useful for those specific
> > platforms, which all happen to be ARM or ARM64.
> >=20
> > This solves the issue that the driver fails to build on RISC-V, where
> > PHYS_OFFSET is not defined.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!
=20
Best regards,
Jernej


