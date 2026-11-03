Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719980;
	b=i1zs8BqT2HpXR7Mum8ungSCMiTSOS5BtP7IUWHfE3BdE/FAbHNDSpFll7F6Gdp0TBd1m
	 b6PE09xIpI2UEQSuQ483NcZVF/wpDtKo8WR81Y/yuhD+6LtQe7kaVtiNgTnj2OLpiMOf3
	 lpW1jn9hkgW8uWnDX9QdBKJvG10+ntcDAn6EgY+xb6AT6rhHAPIhmYGbYHdLETv4HEBVu
	 A7v5s+Lm18xPnl46xpwz+zCWjmvA2zpsaroSSkVhy8wumNdCRrNzRLlYCE/G3PFWjchOs
	 ncLzZg2rixf4pOA8lY0usb0QaSsSCc6+3QrsBmR+wXagieda1rL9B+N+ZeikKz7ggzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719980;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mdSDaylEDCP6bzikHn/xkO4FCQje+FbG1kF5jyDEpv4=;
	b=kI5UMYu3Th8vj0431wVbpG1gNQbbO/a0ns32d6srCNEdWHWujm1e3ZaLb6SQWElk3cT1
	 qzvX+niuFkCmGBaHx+fTWN76gxRPScgb3Us3L3pipEyD5eu2jNr4P8lJ7RPi4R2nqWLNB
	 sc2VRvhn5RbuR4FZd60cLj6KrDfJYsKM2DM1tvezah5y+VruVL+M961Cbb74OKG1c1FtU
	 uDA/HRY26UYVCSX+YaHnCqdMmh6TTd8PKNV+QEQd/f8vtP7StEjshVEpAY3LVBkHdncUl
	 Xjd4uGka7xtRgBuJPCu9fMpWPEYGnUk5gWqBA6RtcddvBFoBG1o7KI06J/ku3qiXxbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dr4LZMbS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90CD606D815
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dr4LZMbS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A431F00A1D
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719979;
	bh=mdSDaylEDCP6bzikHn/xkO4FCQje+FbG1kF5jyDEpv4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=dr4LZMbSEBAFmcA/cUbDDc1IenIMbDNdgmj4oDHTMRsIsJpkiJiF/5BwAu2R3Rl/K
	 u5LyhW1Wo9kblTPSl4Tbrr+U6RidpLtEsSSiPI5QoPZaT/L6xZA1FE8kiiAj/wAui0
	 UCY6rkOADElUv5wzSGJXn3Hr5qlECvbbhUlpXvhO8ICmiDlfqs5HigdVU3xHGoi1U5
	 jSCFd2xqJNEH4C5dDqi/OCsYUv4AaAH55yHBjNQhNWFxgqtsv1MwTBNcniSxUdHQQv
	 4DEOK9ZD7r9hLtI+THxSexWJGIXSvRC8On55nHwJMszAWkqzEWedB2+6a6ojBATVXY
	 H38miYnvtQq/Q==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b19e291cc6so4362376eaf.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 07:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwl3R6cdtDyXUXtQ5dDYhhFRRRkDNNT03aUVZq9LBnWp0X3N6WwwbbgXHn2mhoIsxVDPmh6z/iwoo4b7Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8jevT0EtwyMLsv/y47qySS1yN3jATzPrKhEsl2hMp3iRgJHVK0
	2/Lvf7q8Qni9mDRFMTHGDDgj9BChlJ21HIMuXqAm365zkIqraRsjqiK5I/V1+WwuvYAwJmrIALT
	5iiVGTGtoFLIFDaEcitaUtrY3YXzGHeU=
X-Received: by 2002:a05:6808:c413:b0:4f3:e98f:fa0b with SMTP id
 5614622812f47-5640d9718e6mr9621332b6e.5.1793719978745; Tue, 03 Nov 2026
 07:32:58 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
 <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com> <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
In-Reply-To: <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 3 Nov 2026 23:32:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
X-Gm-Features: AclHuK9qbh-5u1j8zW4quirRvqcSTHBVHOecOsdol74xKAQ-eozqfaINKue7um4
Message-ID: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: Rajan Yadav <rajanyadav0307@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:47=E2=80=AFPM Rajan Yadav <rajanyadav0307@gmail.c=
om> wrote:
>
> On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> > Does the downstream BSP have this? It would be nice if we could port
> > it over. Then you can properly use the power allocator and/or the
> > schedutil governor.
>
> Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient =3D <190>
> on cpu0, and sustainable-power =3D <1200> on the CPU thermal zone.
>
> The energy model uses the OPP voltages, and Andre points out that the
> current OPPs are A100-only and don't fit the A133. So I'd like to fix
> the OPPs first, and then add the coefficient as a follow-up, tested with
> the power allocator on the K5C. Is that okay with you?

That works.
