Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C07723A2
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Apr 2023 06:37:42 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f19afc4f60so45868755e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Apr 2023 23:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682663860; x=1685255860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2hPJfkHwOMglypRlLa17iuea4E8kZcEfHcM/mkMmTk=;
        b=S50jWmRywWZJV1Ldix3O2ItgZ3RhzCpFP9Q94+60hOU+i6QcysdVe5I2RBCaUOd2zd
         fzk5db0CFe7L0e8rdBFsa1geH9bOyaCbzM4fE1c99XwOEO6QOGuPRVi6JRjtOkKYhVPD
         Q0Nndp7rm3gdlRHZakCo293FF2iA9nCG89jBItTnlUpk6xP0droMjJOKhfcKf0iKCcSU
         7w/X0mGaJNhA8RjLJAzz0J68OQxlChjqs376k0vfLiIXjGG8Lp7V0nS5MVBXPCTIPOKz
         eQ24o3MrOgr6EhPjE0uht3Kp1GPE5P2fQmivrgw6lqi7pVUnQ5SVkU5QZzqT7lowzCz7
         MaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682663860; x=1685255860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2hPJfkHwOMglypRlLa17iuea4E8kZcEfHcM/mkMmTk=;
        b=MABZJXYaRvcjn797wQntU9nJ8f2lMBzJZ6H6d3h0eJ4APINn0bQXN4Cn9IhoXSIWN1
         ANQef6PvP86ItIf17RKDJw5fXBtSyTmnhWCSDgpM0K2jMigcNdrul9HkBoXwCoCFUPoX
         vnhRazfxqvdE703m3y4XSNw40yRDYSaLswvVYgAWz78jrEKp6F+afd4eqr+nuGHONOsJ
         mAsJqWKVKxBXGiArjsuNVEafhfAG+pNRDQnADoFrupRSdfI8lrACf8fjPFu4gE7ycfYT
         JROyeiK0dVzmRIUwrY7PyZ6CtRMW/7NvCsfBIQy03+hbksAw6wVZCBW/IXkYn7PEexiD
         9eNA==
X-Gm-Message-State: AC+VfDzrjC+8EKS8gt0TJ5BwMuJhYCCQTWevvSCi5zgogWHKtqlzRk7C
	2ZcbLk1tWxOpA3rVo/8R8jU=
X-Google-Smtp-Source: ACHHUZ5wsHZpnVtwfiLHJxTt4l3u1glDD10pDMjsYggSlppqbtWEe4VE4xpX50ekINIV6eiaOxaLmQ==
X-Received: by 2002:a05:6000:1250:b0:2f4:d4a3:c252 with SMTP id j16-20020a056000125000b002f4d4a3c252mr2898009wrx.3.1682663860404;
        Thu, 27 Apr 2023 23:37:40 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id g18-20020adff3d2000000b002fb2782219esm20462965wrp.3.2023.04.27.23.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 23:37:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Beranek <me@crly.cz>, Maxime Ripard <maxime@cerno.tech>
Cc: Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Frank Oltmanns <frank@oltmanns.dev>, Icenowy Zheng <icenowy@aosc.io>,
 Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 3/7] arm64: dts: allwinner: a64: assign PLL_MIPI to CLK_TCON0
Date: Fri, 28 Apr 2023 08:37:38 +0200
Message-ID: <5667905.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <4o243jwhbdfw32s5gzsbn4nhinicliugo4gqhh55lwxbfxkvkh@2jofbkdavewn>
References:
 <20230427091611.99044-1-me@crly.cz> <20230427091611.99044-4-me@crly.cz>
 <4o243jwhbdfw32s5gzsbn4nhinicliugo4gqhh55lwxbfxkvkh@2jofbkdavewn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 27. april 2023 ob 11:27:11 CEST je Maxime Ripard napisal(=
a):
> On Thu, Apr 27, 2023 at 11:16:07AM +0200, Roman Beranek wrote:
> > Assign pll-mipi parent to tcon0's source clock via 'assigned-clocks'.
> >=20
> > Signed-off-by: Roman Beranek <me@crly.cz>
>=20
> Again, you should be doing it in the driver, not the device tree.

Agreed, fixing this in driver instead of DT is better as it allows kernel t=
o=20
work with older DTs and still have proper DSI output.

Best regards,
Jernej

>=20
> Maxime




