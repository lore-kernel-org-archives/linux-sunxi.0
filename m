Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C82BA4D
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 14:39:45 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso2316035e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Aug 2023 07:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691159983; x=1691764783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/keJTTgc2oKYX00bfWRy8iHTbGm3dqXm1dsaxhchcPc=;
        b=KvfYSC7CEGPj1YKXYXG8g17C2CnIly55fHMe4Bh/zvSSV8wQcCvIDANJDAg7EFYs4k
         Rgxq2Sa7zYSYpyWedo5/COPTTpFMxQYLDBQI7zXnifk11g5RpHYI/SSkODB7BPR1kNpu
         RH7IzSbez5tb7/fYj4Hgo4DtniyoeeUIIFaHyRMwuZrj7tw3vyB9o/43BIuP0FLOgz58
         9JAc9SwqVHqix78jPoFsov0VCFE2WP8aO4cJsRZj8iN8yy74PjUZeWOM2cdpy/zy6HP9
         dK7t/LUbhrN2i4Rd2ji/MrW/GO4Vl88dDHD+/PEvM3S7rmZO5ja3j96DAqugQMhrowPi
         hbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691159983; x=1691764783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/keJTTgc2oKYX00bfWRy8iHTbGm3dqXm1dsaxhchcPc=;
        b=ag5fi0ow26sz+B7ptpZjjTz1lG3QE1MjKJj1CVmp70665/y+3A7wgcj1jYQ/krems2
         ssYu17LgKZswx2brVAku11ywiZdr9sedSo02KnKULLKLvs+x6Awz9zOmG7szjBE0hZtE
         MRJBiVQeMunL0cRx0tsqca7+1lL5tWtC+8FQ8jK01nMsVx6V+zFpEVu5YZHAqiOj6Tc0
         UHPRpRJvTIVfUGkQACaekUnx8qUCH6HRxnthxXw16HGexfxBDpuIUIGlFuF6J0XMmAwz
         y5wbyhElqK8YvbVydhMc9+x7pTwv9UjZx6XQ5jVuMgEJUgC2oYjQa2OUXtS5AIBBjzA0
         dLPA==
X-Gm-Message-State: AOJu0YxKSrmcb8nv/tdx7GYTRWirTqx6gjC8Tk3k3qM+L899qCt87EFN
	oCaIyfussQhhbvNJVD1FqoHp4BVilcdSVg==
X-Google-Smtp-Source: AGHT+IF3frUwbfH0b36TWheEdo2zyf2bWjXefALR0x/pFUcE5xwHRR11pBKFVe1FSUbK1lZJev7c/w==
X-Received: by 2002:a7b:cc95:0:b0:3fc:3f31:4233 with SMTP id p21-20020a7bcc95000000b003fc3f314233mr1884635wma.38.1691159983036;
        Fri, 04 Aug 2023 07:39:43 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id f22-20020a1cc916000000b003fbc9d178a8sm6834019wmb.4.2023.08.04.07.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:39:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: John Watts <contact@jookia.org>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maksim Kiselev <bigunclemax@gmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mkl@pengutronix.de
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Date: Fri, 04 Aug 2023 16:39:41 +0200
Message-ID: <5696365.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <ZMyZ5kZSiiJHtdeS@titan>
References:
 <20230731023701.2581713-1-contact@jookia.org>
 <3248110.44csPzL39Z@jernej-laptop> <ZMyZ5kZSiiJHtdeS@titan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne petek, 04. avgust 2023 ob 08:25:42 CEST je John Watts napisal(a):
> On Thu, Aug 03, 2023 at 10:59:30PM +0200, Jernej =C5=A0krabec wrote:
> > pinctrl-names and pinctrl-0 are usually at the top. However, since there
> > is no hard rule (I've seen it mixed), I'm fine with it.
>=20
> Happy to change if needed.

If you don't mind, please do.

>=20
> > Since original DT node entry goes through netdev tree, this should be
> > picked there or it can be dropped there and I pick both patches or I can
> > pick patch for later kernel version.
>=20
> Do I have to do something based on this, like resend my patch?

Nothing on your side.

Marc, since you took original patch through netdev tree, what is your decis=
ion=20
here?

Best regards,
Jernej

>=20
> > Best regards,
> > Jernej
>=20
> John




