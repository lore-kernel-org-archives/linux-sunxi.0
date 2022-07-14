Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB94A38
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 16:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC74C341CE
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657814778;
	bh=D+KyPbiZw/JOdUc0aKu3DvDfjfE78T1gy4PuRReGoqM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dQHUla8SroldZg4VLTB6S7a9X/MZZQltY/nnRWOiLKtgRo2SU7my69dRRMtNy2Ld7
	 TPpL66byNdxG5hXLp+B0X04DR7iTMsdxsfXrGf/IIh9Xgp6p79TnOfcdSps49woS/q
	 qQAWROQzG8oTnHmga/jrExZxHLb4EBPVfwI3UYa3Xou68H8DDowEPrFdcNcvkCoWog
	 AHAZ7I9JcGdgZl0VZ4SMEFxYel4Scbh9dr6TN25uTycmQYW+GuQoIgtR0DN7XWeCGN
	 yABGm2EmP4EWzknW0LGAL0Kta7UgY7jP+kkmfhzoKCZxJAnNWQd5xRDEjKJHZmhfL/
	 FqBauy/h2+sWA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31d7db3e6e5so21652677b3.11
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 09:06:17 -0700 (PDT)
X-Gm-Message-State: AJIora9ioNjUjKFgdWbcGaBdB4XwZJzDw9wNSn2F2HvcQQN0d2Yingfv
	ESyAngF7h5UMhKRD+MPbwnQyGqZgQo0Y4IBM7eM=
X-Google-Smtp-Source: AGRyM1sNGuMtM2ZDuvC2+WChABHFd+ogJnKciS+BxIRFFkfGIPQVDHU3G2Mh7D9zoSXkDef0M3km6+Y3IQk0B4ZeDIE=
X-Received: by 2002:a81:1e4d:0:b0:31c:86f1:95b1 with SMTP id
 e74-20020a811e4d000000b0031c86f195b1mr10435712ywe.42.1657814777011; Thu, 14
 Jul 2022 09:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YsheC0hgyJB9kPsS@kista.localdomain> <165781258677.3193274.3635616027978236662.b4-ty@arndb.de>
 <5838152.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <5838152.lOV4Wx5bFT@jernej-laptop>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 14 Jul 2022 18:06:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a14rwmwjEQJX-Z5tj_1-N1CBgf10Arx+e1=ufhTNk6Mzg@mail.gmail.com>
Message-ID: <CAK8P3a14rwmwjEQJX-Z5tj_1-N1CBgf10Arx+e1=ufhTNk6Mzg@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner config64 changes for 5.20
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 5:45 PM Jernej =C5=A0krabec <jernej.skrabec@gmail.c=
om> wrote:
> Dne =C4=8Detrtek, 14. julij 2022 ob 17:31:23 CEST je Arnd Bergmann napisa=
l(a):
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > On Fri, 8 Jul 2022 18:40:43 +0200, Jernej Skrabec wrote:
> > > Please pull following config64 changes for 5.20.
> > >
> > > Best regards,
> > > Jernej
> > >
> > > The following changes since commit
> f2906aa863381afb0015a9eb7fefad885d4e5a56:
> > >   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> > >
> > > [...]
> >
> > Merged into arm/defconfig, thanks!
> >
> > merge commit: 2b4b612638b8e87719f82ab7a9cda8925375eef6
> >
>
> Thanks! For the future, can I send changes to 32-bit and 64-bit configs i=
n
> single pull request?

Yes, definitely.

       Arnd
