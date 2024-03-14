Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEE273188
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 16:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710435055; cv=none; b=duBuCq3xrKBBFD0NcszY9R4aMgV2nJdqKg9UOtntdP4agueBoDwQQ9i9Us4+v6OkfnKnVXPEKKzXy2Xx7pm9rUozzEm0hdbURbZSQAYqBVyrPyWsj6UNh7Mhp0DpJXDxCMvaWmRWo16KTCPZRi8LICAUYme1Ys+y5GPtkHJ29E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710435055; c=relaxed/simple;
	bh=8/LHmabbFOa2irz28iyD2mUOsrRWs77lzjfbdo5vmdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lAm9fAALas5EpSCSRTln57hLXZkrI3PSIiiUZn+Sate29tL5repECHI//NLu0DVF0sG0WKNZ8azSWJqtAmkSdPQkRhvsrlRSDizKFF0n1M/Z2/+C+wRYLTc/A9Nqpebco7SY/WqAuQX5uslT3lsrcDfJZBOYyf2Yfq09+vkicDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByXcAaLP; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByXcAaLP"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a45ecef71deso135735266b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Mar 2024 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710435052; x=1711039852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2RYm1vaspI8Y3As/a7F8BfaRLfVKAt2m0ryDQAGWpA=;
        b=ByXcAaLPJm4vsekvBiS7UjA/F+hsx2GAjVwW2s9PHxKpp49ua+AWLTa2tY2ULqi2WE
         UVIG9fOTtKPkZKiHabPzPmdxs5csTbDCewDuBa3C2djypoAtB+9zEm8/Gl6gDJfJ+yOX
         qMNJRFKVq5hMx1XQrWZOjL+8pJzR/SbSg6ouKEIt+EEZz4wuUPwCihvIAsxg802AkvnP
         z7CriVUJGmGTCbZ89DWagst1+KVE7wPLjW6kfqFxubakUv+jZGCIWnGNPm8a0MfJCy5Q
         D6E5k9L80mdIpBN4vg2Oi2U4lk792EKxHglNvT7/VqX/dyrhxQqA8FkOBqslwEPMNfyA
         4qVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710435052; x=1711039852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2RYm1vaspI8Y3As/a7F8BfaRLfVKAt2m0ryDQAGWpA=;
        b=QZCe0ze0c4WytRjcBlqSrhhp6a4ghNJFdgPTUpcN0K7w98y6YMEyPdYty4Ykus8ZHA
         T65dGWfL+d+HUTiA4ktQ31BDbouEgaZVnJJU0/afBIc8/ESTe/sfCx/ZG6pgeA3qJuQq
         Zjx7osuagyMIT2zUOXKQ8hsDnJgpARBmM9IfR1jr+LBq9IDmAD8cWinMdIXGkXg0zmfk
         C9L87uCaGU2NmGtxVS1C+qrb1Q/DMM44UfIsnz5YUZbLe+K/PM77L7rUiGtBKnfrojGY
         6h2kyDfwEAeJmen1cUc2wBpu/ZcCJuYlHZbatamA9+rNlI7MsB/LQyotnIsG9q3YR3QA
         RotA==
X-Forwarded-Encrypted: i=1; AJvYcCUqgLI/IwMnwDLj+7G9NKy36GI/dLkib8bzODpVKa8HGzbWZIX4YIB1MgkHbEJ5Er7qYqRAaO2aXhTyPufq/VmFfLRq9tHroqq2eMA=
X-Gm-Message-State: AOJu0YyRKKpxV5pjWksCJF3jy+h8U9ChsD3McDMp/l02eCzUo7hbpp3X
	gY1HAIltMs6+dFme5x2+yiVbIWTD9SPrnBk3jrrIZq40lY9rEpu5
X-Google-Smtp-Source: AGHT+IFJKP6hw9ITWzKnemudaDXluZtn2m9/KXcvFV7zOjEAbqJJ2r6ERXAFkSkgobY7+7st62Fj/w==
X-Received: by 2002:a17:906:abcd:b0:a45:c8c8:7b99 with SMTP id kq13-20020a170906abcd00b00a45c8c87b99mr1326980ejb.31.1710435051518;
        Thu, 14 Mar 2024 09:50:51 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id b26-20020a170906039a00b00a4547925e3asm875284eja.141.2024.03.14.09.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 09:50:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Kamil Kasperski <ressetkk@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dts: arm64: sunxi: add initial support for t95 tv box
Date: Thu, 14 Mar 2024 17:50:49 +0100
Message-ID: <4331305.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <55eda2c6-1bca-463d-a908-1887543a47a5@gmail.com>
References:
 <20240311174750.6428-1-ressetkk@gmail.com> <8344274.T7Z3S40VBb@jernej-laptop>
 <55eda2c6-1bca-463d-a908-1887543a47a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 14. marec 2024 ob 01:19:28 CET je Kamil Kasperski napisal=
(a):
> Hi Jernej, Andre!

Please no top posting as per rules.

>=20
> Thanks for the reply. My board has a name "H616-T95MAX-AXP313A-v3.0".

Ok, we for sure need to integrate this somehow to compatible string, since
there are at least two incompatible versions.

>=20
> I believe these boards are two different revisions and the one with=20
> AXP313A is a newer one, besides incorrectly label as v3.0. Sharing=20
> common configuration between boxes is also a good idea but for this=20
> specific configuration I would be cautious. From my experience with this=
=20
> board the default configuration for X96 Mate is not working at all. I=20
> suspect because of the PMIC and DRAM differences.
>=20
> Memory installed in X96 Mate is DDR3L and in mine T95 it's DDR3, hynix=20
> H5TQ2G43BFR, that requires 1.5V to operate.

PMIC is important difference, yes, but not DRAM. DDR3L is completely compat=
ible
with DDR3. It just additionally supports lower voltages. Additionally, Linux
doesn't care about DRAM type and all. It's firmware responsibility to prope=
rly
initialize it.

Best regards,
Jernej

>=20
> The rest of configuration for both boards, like HDMI, MMC, EPHY and=20
> audio codec seems to be the same across almost all H616-based boxes that=
=20
> I've researched.
>=20
>=20
> Moreover please let me update the patches and send v2 that aligns with=20
> mainline branch. I've incorrectly assumed to use sunxi fork instead of=20
> master. Sorry!
>=20
> W dniu 13.03.2024 o 19:00, Jernej =C5=A0krabec pisze:
> > Dne sreda, 13. marec 2024 ob 18:38:08 CET je Andre Przywara napisal(a):
> >> On Wed, 13 Mar 2024 18:25:14 +0100
> >> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
> >>
> >>> Hi Kamil!
> >>>
> >>> Dne ponedeljek, 11. marec 2024 ob 18:47:47 CET je Kamil Kasperski nap=
isal(a):
> >>>> T95 is a most commonly known for being a box with a pre-installed ma=
lware.
> >>>> It uses Allwinner H616 and comes with eMMC and DDR3 memory.
> >>>> This device comes with two versions - one with AXP305 PMIC and anoth=
er with AXP313 PMIC.
> >>> I have this board and it always felt like a clone of X96 Mate, which =
is
> >>> already supported in kernel, except for broken sd card detection. Wou=
ld it
> >>> make sense to unify those two boards and just overwrite or update par=
ts here
> >>> that are not the same?
> >> I think the box you have is an older one, with the AXP305? IIUC, this =
is
> >> about a newer revision with the AXP313. There are quite some differenc=
es
> >> between the two PMICs, though it might still make sense to share the D=
Ts,
> >> see the OrangePi Zero[23].
> > Right, mine is with AXP305. It has "T95MAX v4.0" printed on PCB.
> >
> > Kamil, does your board also have "MAX" mentioned somewhere?
> >
> > Best regards,
> > Jernej
> >
> >> Cheers,
> >> Andre
> >>
> >>>> Kamil Kasperski (3):
> >>>>    dt-bindings: vendor-prefixes: sunxi: add T95 to vendor-prefixes
> >>>>    dt-bindings: arm: sunxi: add t95 compatible string to list of kno=
wn
> >>>>      boards
> >>>>    dts: arm64: sunxi: add initial support for T95 AXP313 tv box
> >>>>
> >>>>   .../devicetree/bindings/arm/sunxi.yaml        |   5 +
> >>>>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >>>>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >>>>   .../dts/allwinner/sun50i-h616-t95-axp313.dts  | 138 ++++++++++++++=
++++
> >>>>   4 files changed, 146 insertions(+)
> >>>>   create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-t95-a=
xp313.dts
> >>>>
> >>>>   =20
> >>>
> >>>
> >>>
> >>>
> >>
> >
> >
> >
>=20




