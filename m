Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301BE33C9
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 11:42:32 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so4585683a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Aug 2023 04:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691322150; x=1691926950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HumppwNUn3TA8YpQ0fQzm7WpQytFg98rX1E8vNluGYU=;
        b=COX4FRzPg5Df7S7scGkL1a1jxSkgE4lsLMpzoAKRInM2N2donpYwiXDjSi/uGQQJdm
         wnKu5zkOi4+z2eDvgysSiv8+wnzUSluY4wQ5tf23SqJnRh34l9MsjY0f81HXTwdimI/K
         GW8UQJRJil0ochVBGECpvNlVOUpC2TpR46BNRdtqybtoE/quddDakVx+BSAAn7/1Sdlz
         XZkfNvlLlGjfuEjcvAlf6iTnTjcI9tIHvIk9iB2wzLyKG0GKDLCon/LnZE/cu205nyvc
         ZpUbvtf3cSHF9m1L8NZHvlpkWXujyLx4Z8+cLnkrtFr4Tat+wekNAvvveNMSRtuJZOmO
         bM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691322150; x=1691926950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HumppwNUn3TA8YpQ0fQzm7WpQytFg98rX1E8vNluGYU=;
        b=GKSSLQKY+vjKhdZC7prW9xRkT+34+wzWrsNKJZ/ncusfqxHHGQ3Yz3EbsQ+Ers99HT
         lTPFpcxWzJdFDdTVj6OpDGMNCgo14zBBDV2/73UhmtNHsO7Fk0QvbKz6yNknS+IXAoQq
         O8NCSGibbwb2hsfYZZTqoBy1hk23GV2prRzfNttTfPfZr6HAxt49E7oyLgZtuSwhATgY
         0BYVk9c+zZMeiTV4ugZTUerCCcXd6QJTV9acgWwIb2MZRBCLleAZZi96vhMb/fdt148I
         YJcemF6atlLyr0VJj2CRnEvoD2vuwl9qdo4SxD+G6Gc4IIWi/Hdwi4GNL+lcpUbFFmcM
         MuTA==
X-Gm-Message-State: AOJu0YzxOQfD1AnZ6WUVZDUYbolwj5kvSGlQSWx8OOjyh7QTgbaQ5GDm
	9vQw0gGdu1hhk8t8vJaWrTc=
X-Google-Smtp-Source: AGHT+IEEg3PkfDxHcETaO7LHnXNw+qJwjWb90KaZ3707q9E0qH0cZ2HLszMui/vhh35dCWWOEYUkRQ==
X-Received: by 2002:a50:fc12:0:b0:522:c0ea:15d with SMTP id i18-20020a50fc12000000b00522c0ea015dmr4929062edr.41.1691322150093;
        Sun, 06 Aug 2023 04:42:30 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id d2-20020a056402516200b0052275deb475sm3787539ede.23.2023.08.06.04.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 04:42:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: John Watts <contact@jookia.org>
Cc: Maksim Kiselev <bigunclemax@gmail.com>, aou@eecs.berkeley.edu,
 conor+dt@kernel.org, davem@davemloft.net, devicetree@vger.kernel.org,
 edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, mkl@pengutronix.de, netdev@vger.kernel.org,
 pabeni@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org, samuel@sholland.org, wens@csie.org, wg@grandegger.com
Subject:
 Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Date: Sun, 06 Aug 2023 13:42:28 +0200
Message-ID: <4848155.31r3eYUQgx@jernej-laptop>
In-Reply-To: <ZM8-yfRVscYjxp2p@titan>
References:
 <20230721221552.1973203-4-contact@jookia.org>
 <2690764.mvXUDI8C0e@jernej-laptop> <ZM8-yfRVscYjxp2p@titan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 06. avgust 2023 ob 08:33:45 CEST je John Watts napisal(a):
> On Sat, Aug 05, 2023 at 07:49:51PM +0200, Jernej =C5=A0krabec wrote:
> > Dne sobota, 05. avgust 2023 ob 18:51:53 CEST je John Watts napisal(a):
> > > On Sat, Aug 05, 2023 at 07:40:52PM +0300, Maksim Kiselev wrote:
> > > > Hi John, Jernej
> > > > Should we also keep a pinctrl nodes itself in alphabetical order?
> > > > I mean placing a CAN nodes before `clk_pg11_pin` node?
> > > > Looks like the other nodes sorted in this way...
> > >=20
> > > Good catch. Now that you mention it, the device tree nodes are sorted
> > > by memory order too! These should be after i2c3.
> > >=20
> > > It looks like I might need to do a patch to re-order those too.
> >=20
> > It would be better if DT patches are dropped from netdev tree and then
> > post
> > new versions.
> >=20
> > Best regards,
> > Jernej
>=20
> Agreed. Is there a way to request that? Or will the maintainer just read
> this?

Hopefully it will.

Best regards,
Jernej




