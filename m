Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E6243F098
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867082; cv=none; b=CmDzzaLHy3MPw29ZBLrgwdt/RJmLWkVkPnYXDqXaXgHwMXbcDPUl04Fpfl+vrkluut7htAVingIYu62cThD8jHsl9wZgqiHFhjc+Ferf6JdJXfQJSOfn89XztoID2zDRQJpOGvb9J4yiPBY+RLW61gWwM2x4CxCXMFDW7djplGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867082; c=relaxed/simple;
	bh=VoUdY2wbXfgYmIGQ6+DYjO7uNq2p2ALCzG59zvHqoq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtZQa+fx72PEIzLPswgPTqv3tEJHlkhNXWDWimP5ZxgQjteuuGyHHc5qSKmW/ph0JPwsRGq3JX/1ARWNHLao+I2hwY0hwOdhjLUjossA/wGvcrBhoeUJVo8vULpQZ8j3EEw5MGrm/tSGThWpWRdeVBGdU4ZxvaYW1iXnu8pbKm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkcdQD2X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkcdQD2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA181F00AC4
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 18:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867081;
	bh=FikSavZljZZOAC3I+kpHBOLIYadBEAPg6f3CrNkkcDc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=MkcdQD2XTs2CHy1GrmSqZx33oVJSb9cBzXys9Br0JLtRXiOv+hCGQti21OQLIP1yA
	 kZK4EpG9ErpttoY0LXf5/NfIuAI7Yjm6fCsD+8oD6lIXs63mVyR0HwGMGkgon58vX6
	 NxGp5ze1hy1vlV1DWOosSrFM+5jbLBdFCNAwRxJQo3klcIUFMt94JlQHa5VNYRLNTN
	 AYD6w2yIP+rl3YsvzIlQQ0astb3SkjMQ94dK5LtZSfsGushbvL38pDhFzvlsR3irJI
	 XIU6NoZ7Pm7X9re0Mgbu/NXKovXlxgA4KeeT8tovdq3kiIMGzl/el+CQtapVl+noOi
	 G0UZCENVFJPYQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c74722e27so2730261fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 11:11:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro1AiSu92geKdIbqj1RjvgPWYtpxSx4BNtew5gzvDp6JKB1izFbxx9fzYlfdQmb6tkzbsAb5fvcckHoPA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1LRDflHn+qWiZTNPhDdLLJHSSlrBGjTIDeVKGTMjP70gx1eTM
	TkWl2ojTfCWHen+09IkAKVoTGBRyWxAaUYbovMgUfl/B6BrJV5y8/tBwlC/gSOVZFC7bk63wQno
	xgcRWrvrh/DIOk34BsidC24VMpb2BL1Q=
X-Received: by 2002:a05:651c:b08:b0:38e:8357:c5ae with SMTP id
 38308e7fff4ca-39fba35d196mr1683601fa.9.1785867079728; Tue, 04 Aug 2026
 11:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com> <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
 <20260803153519.262827-1-juanmanuellopezcarrillo@gmail.com> <CAGb2v64Ty3HkBbb5A=ZL6QUAVD6bugG0hcYykCmh-KUsVwzwRw@mail.gmail.com>
In-Reply-To: <CAGb2v64Ty3HkBbb5A=ZL6QUAVD6bugG0hcYykCmh-KUsVwzwRw@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 5 Aug 2026 02:11:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64bTO-uG=QrtVDfHF=qnGtF5LMitagD1zfNEYSAqOzvXQ@mail.gmail.com>
X-Gm-Features: AUfX_mwiL0nkLH-Wm-w7-N2txYVunL-uAPwAUoIXkwVJGRbj_F5IqUZJ_VioieY
Message-ID: <CAGb2v64bTO-uG=QrtVDfHF=qnGtF5LMitagD1zfNEYSAqOzvXQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: =?UTF-8?Q?Juan_Manuel_L=C3=B3pez_Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 11:51=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, Aug 3, 2026 at 11:37=E2=80=AFPM Juan Manuel L=C3=B3pez Carrillo
> <juanmanuellopezcarrillo@gmail.com> wrote:
> >
> > Hi Andre, Chen-Yu,
> >
> > > So can you please double check this?
> >
> > Checked on my Orange Pi 4A (T527, GMAC1, Motorcomm YT8531 PHY). You are=
 right:
> > PJ10 is not needed on this board.
> >
> > PJ10 function 5 is RGMII1-EPHY-25M, "25 MHz Output for GMAC PHY" in the=
 A523
> > manual v1.4. The RGMII1 bus itself is the other 15 pins (PJ0-PJ9, PJ11-=
PJ15),
> > which mainline already has. My claim came from a stale comment in my tr=
ee, from
> > when I was chasing the dead RX. It is gone now and my rgmii1 group matc=
hes
> > sunxi/for-next. The Tested-by I sent on 22 July was already measured on=
 plain
> > mainline without PJ10, so what revived RX here was your withstand fix a=
lone.
> >
> > > Those settings differ from what's in mainline. What are the results w=
ith
> > > those delays?
> >
> > Measured on the same board, DTB-only changes, TCP for 10 s per directio=
n:
> >
> >   A  mine (rgmii-rxid, MAC tx 100 / rx 0, PHY rx 1900 ps)
> >         TX 0.938-0.940   RX 0.929-0.930 Gbit/s
> >   B  mainline delays (rgmii-id, MAC tx 0 / rx 300, none on the PHY)
> >         TX 0.941   RX 0.929 Gbit/s
> >   C  the Ethernet path exactly as mainline has it
> >      (B, minus motorcomm,auto-sleep-disabled, minus PJ10)
> >         TX 0.941   RX 0.929 Gbit/s
> >
> > All three saturate the link, with rx_errs, rx_drop, tx_errs and tx_drop=
 at 0
> > over roughly 1.6 million packets each. So mine are just other values th=
at
> > work, and I am dropping them in favour of mainline's.
> >
> > > ethernet on the A523 has other problems. The performance is really ba=
d
> > > (even RX), and there are errors or packet drops.
> >
> > I do not see that on this board, not even with C, which is mainline's E=
thernet
> > DT unmodified. I also checked the YT8531 auto-sleep: the first packet a=
fter 5,
> > 10, 20, 30 and 45 s of silence came back in 0.21-0.24 ms, no losses.
> >
> > The kernel is my own 6.18-based tree, although stmmac and motorcomm.c a=
re
> > stock, and this is one board with one PHY. Chen-Yu, which board and whi=
ch MAC
> > are you seeing it on, and how do you measure it? If it is another board=
 or
> > GMAC0, I can try to reproduce it here.
>
> On my Orange Pi 4A, running iperf3 between it and another Orange Pi 5 Plu=
s
> (which has Intel PCIe NICs) as the server:

Correction, the Orange Pi 5 Plus has Realtek 2.5G NICs, not Intel.

>
>   - 4A as client: ~180 Mbps
>   - 4A as client but with reverse transfer (-R): ~520 Mbps
>
> Now if I do the same test between the Orange Pi 5 Plus and my virtual mac=
hine
> on an AMD AI 370 Pro based NAS, I can saturate the link up close to 2.5 G=
bps.
>
> If I use a H618-based Orange Pi Zero 3 as the client and the Orange Pi 5 =
Plus
> as the server:
>
>   - Zero 3: ~920 Mbps
>   - Zero 3 with reverse: ~280 Mbps
>
> And I think my Cubie A5E and Avaota A1 fared even worse.
>
>
> Something is definitely off. I don't know what though.
>
>
> ChenYu
