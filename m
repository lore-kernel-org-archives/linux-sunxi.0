Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADA7C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 21:09:01 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id n20so1649648ejh.0
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 13:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkV3X9GXNISVr95RvsMOWpzh7PTcA0hs92Aa8ymIN4k=;
        b=ITvI9ThwKivsIAMr1L2qSHaXSgSCtlwDqeDUQ98UQBIC4g/VjxXtwRMeolP8dRLXKy
         CXQ+HAfxZ2glMsF80+Xpki2Q3L0tCRVmICUaEGkPrlD7S6AYPVDMrv4sY+tfd6GTE+a+
         tb/T+y4c1htLNFPNNWKxe7eFTxv9m9K9ym9HA+tNiAW0X3XMVK8RvsOaLkun5RBX28e2
         8WPlyh/8kjUUSCn1Ct9sus4q020VbTHce3mEXHAsm1Q2tJgolLePeuEtGzQ+HiZyW8dc
         j8Spge156r9Sv/BQDt1lt3oPDc2okdVrjXWuVIRJWy1axnnPwmxhJU3CQrJn+yD0P4C0
         XVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkV3X9GXNISVr95RvsMOWpzh7PTcA0hs92Aa8ymIN4k=;
        b=h16EwUfsra1AaS/rsI5mG14MC5tWyWr2ih9qXktatiLr49Kc4+z+dQUCmBD1vWcZn6
         EYMVAQUVxoB9TNmQi9qJKwX3WjcKcV0f38IGpcbi8SX103q+8pxrsoiD4zzqkoOjbnHS
         iOhqzobkVVcNaUP8oO2hX3Z0gn4z0VFMJyPc+bDPaeReXKnkskKmU8mbPv/ZqCXwr4Bu
         C5bHMB8cMxjphbJwRpXFifjaoxaKI9F/znBFsUtm9BLTbgCxk6uECu/I2hYx441tbsDQ
         cLyL6V6YLSaEJ9CAfqomQLjGwt79mjM1JT6rY4bYUuk5lEiv0I5RRmk7BvsPSsp4DUYr
         XOHw==
X-Gm-Message-State: ANoB5pkFiIQWqukJReo1EwqIBwymQLLM3x7mLotLYXeiHgG5FxO0YvOV
	h42EQu2t6WNU1ak+248504A=
X-Google-Smtp-Source: AA0mqf5gvNpaIA94R363TaM2g/vZqD4VVMf9j6vXRWlST5Jrr0yvJ219+yx2Zi6eIrt20nsmEL7BrQ==
X-Received: by 2002:a17:907:a50a:b0:7c0:7902:885f with SMTP id vr10-20020a170907a50a00b007c07902885fmr12154855ejc.233.1670274540167;
        Mon, 05 Dec 2022 13:09:00 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id m14-20020a170906848e00b007c0a7286ac8sm6218533ejx.69.2022.12.05.13.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:08:59 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Tom Rini <trini@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, linux-sunxi@lists.linux.dev, u-boot@lists.denx.de
Subject: Re: [PATCH] sunxi: define SYS_MONITOR_LEN in Kconfig, not _defconfig
Date: Mon, 05 Dec 2022 22:08:59 +0100
Message-ID: <2089155.OBFZWjSADL@kista>
In-Reply-To: <20221123225117.18760-1-andre.przywara@arm.com>
References: <20221123225117.18760-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 23. november 2022 ob 23:51:17 CET je Andre Przywara napisal(a):
> Commit 08574ed339fb ("Convert CONFIG_SYS_MONITOR_LEN to Kconfig") moved
> the definition of said config variable from the common sunxi header to
> *every board's* defconfig.
> This is a platform choice, not board specific, so remove the variable
> from there, instead set the one value for all Allwinner boards in
> Kconfig.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


