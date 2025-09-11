Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C25261B98
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 19:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757619014; cv=none; b=uEb9B/GqD8/6CxMR74T7K2nYrdNNmzh5Gnp2EpV6s1fwxAtrE46r+J5Rx90uNXh2FODDMpEmmsyK3X7UYUVCLWjO43XtcaqG+Mlgz5PEjO0OwBq7DOUaIjb7CoKGXOIC0uD1EJlKRfYl7T7XOQS70O2uJx7k7+p7QpEgF2/wUQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757619014; c=relaxed/simple;
	bh=2ZTvZ4Toekdanji1MrHOH8PV1rKV9LbVjmry3qyMjrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=A9N0mvFnX3pAb7RnnIGDytzkKE4mwHm263sk7b1JzcdVf3FcBdRrx5b6DdwVxZB43X2QJIIKOGlPcQtR6H1ceUhlvz8lFQ4Qs7xgw2qAhWlRmTd6u1AMP30xu8RlAhB4NVCSm42E5scQLopXz58rDxEF552MhbJ5FRm/dHpWuPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqBPVnyc; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqBPVnyc"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b52403c47b7so771249a12.0
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 12:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757619012; x=1758223812; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/43ZaldggGuBwtd/XIONWoQfznT+Agjk4Sb480kz5Oc=;
        b=fqBPVnycgLnLYITebcBTFfsgsB9mwSQ445TwgqF9DrTzzJq2Hv22m82joJp4YJQrhc
         Uvdw+Pwz174Inl/ea99dEtJO6rAxhD2kPOiMl/wuBmSznoURNq1pERhbuZRMGA27P/3K
         ywnBY5UthhV9WG9gvGZoBredZKFEbdCg2NakHEk6964ZrEaV8ZawludYJMNx9XWkVaWN
         wURbWL1vZo0mCcRRQoPsUafi9P2V2PcU620NV2NWL7YN28E5AYp1UGGi69r2g+Mbr6SB
         /j1NmvkO+LWTOn3vhnax+NkGiYYy7r3XcPALhIrRnQDBrBhu8bnNoVyxpot9NUIar5u+
         WJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757619012; x=1758223812;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/43ZaldggGuBwtd/XIONWoQfznT+Agjk4Sb480kz5Oc=;
        b=rqswhObtR8GQKYlCUqciic9N08wd5t+IJ18DaZKTsoly2PtbmnqvxWcvBEn7jMWKP9
         mQLpbeO+wG5CIz7a0VWye+h3KURryi/ESkA4do3fO636PTkm5RFOUnwBO6P4tbbmg7Aq
         gASFgXXoMjaWfG2T9ZCRNYPz/mJmlcVPaxUtfzb+60uxb9weP1FigvxmbGX6FAlFMNrc
         MB2coNxGF1/UEAJT7rJBxfG7lZYQo9/BajaebPmgiALIuYHgspYqd45mtFWkFDhF1SKd
         UVCTQJVO/p7a1vlk7zSHlQtnoITcxgoxEgjXCja1Z7wh3XucpReO+7WeRxNFUkXJ1nk/
         /Ehg==
X-Gm-Message-State: AOJu0YydqAioUznu3nUI3cGWDXQ5adDNDG4sYyIAgo2Qe51kzQhCZAMq
	Ke3mmRaQ0gYJ6wFeRT8AhPraRBOzuSCAHtrEZ62bYZoMvsgIePLkBgrCoVYh+S+PVdVwkjA9Gyk
	pXq3YFlPOQz2TIZT8DO2gOVPeZ2uHHUCoJ7E/
X-Gm-Gg: ASbGnct/s/cNADI/JTi3u/P3BCTYFoirXzDpwPJscJvb5I/6SDITXXBTLD0kMc6xjKp
	Ddm0cfHJ3cBtksVPdT9n9+/QQWsCeQsgp/Dyv8Ow7p8UctheBtuwFoVuJzzrIdJHgnkTTmPYWiu
	BFV3G0YT4RrEXt+1/Cxb+mmkAtnNxjVWwe/Xm5anA87maYgQrnuC33HZqi3kJmjoAMehbwpr8QH
	8/D5ae1BE9Ye0ZYg0QzJ8lA4r+LYHGnBW03VzOE73R4MhSVfQ==
X-Google-Smtp-Source: AGHT+IEdivGxonXLjpIGLF5gyJM12nMUyRYzEDqoelHxZeDz+cQr9fGqAEtOBUMcHntW757QUhzt+A7VfAirCeklOrU=
X-Received: by 2002:a17:90b:540c:b0:32b:d8a9:8725 with SMTP id
 98e67ed59e1d1-32dd1ee9e69mr4616329a91.18.1757619012251; Thu, 11 Sep 2025
 12:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADGuG04vCTWJNDj-fPaEO-dQmk_P_Z-E+AYbZBeYt+GJ8Dtqtg@mail.gmail.com>
 <DU0P190MB244572B5A5516B6BB3E053EEBC0EA@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
In-Reply-To: <DU0P190MB244572B5A5516B6BB3E053EEBC0EA@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Horv=C3=A1th_Csaba?= <horvathcsabalaszlo@gmail.com>
Date: Thu, 11 Sep 2025 21:29:36 +0200
X-Gm-Features: AS18NWDR_qWFyMBdfms7u8Pjb_CMd_Gul9U9JFwIp7AZe0vkJcTdTJrvp2rCCjk
Message-ID: <CADGuG04Bc8Dcv=GCZGsjkW7taS4VR0yTkp=BC9tC90HtkssVRw@mail.gmail.com>
Subject: Re: Colorly e708q1 and AXP20x support
To: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks!
Strange, as i tried to compile mainline kernel half a year ago, but it
had no support neither to display or the power chip. I don't even know
what needs to be selected in the config in order to get them working.
(Tried to compile numerous displays in it, but did not help.)
Also, the AXP22x is referenced in the dts, and in the guide, there are
some lines to add to the U-Boot config, but nothing to the kernel. And
of course, does not work.

So if anyone has any clue what to do (mostly what to compile in), i'll
be thankful - i have done some kernel compiling before, but not an
expert. Mostly not in devicetree objects. (It would be enough to have
a stock kernel and OS to boot, as the device will be only a character
display.)

Thanks :)

On Wed, Sep 10, 2025 at 6:33=E2=80=AFPM Subair Mullappilly <msubair@hotmail=
.com> wrote:
>
> Hi
>
> A31 has already upstream support,
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/arm/boot/dts/allwinner?h=3Dv6.17-rc5
>
> your tablet device tree is already there, use upstream kernel, and it
> has support for display,
>
> i never used a31 chip, but used r40,a20 etc..
>
> Subair
>
> On 9/10/25 20:24, Horv=C3=A1th Csaba wrote:
> > Hi,
> >
> > I'm building a wireless display on a Colorfly e708q1 tablet. This is
> > an A31s device, supported by Linux-Sunxi.
> > I have managed to install Arch and get Wifi with an 5.x (stock)
> > kernel, because with newer kernels compiled according to the guide at
> > https://linux-sunxi.org/Colorfly_e708q1 i had no display.  Debian also
> > works, but the device overheats, or freezes because of other cause.
> >
> > With this kernel, the only problem is that the AXP20x power controller
> > is not working, therefore the device is very hot. I could not find any
> > information about how to get the AXP working. Basically i have no BAT
> > device, or any trace of working power management in the /dev or /sys.
> >
> > Can someone please guide me how to get this working...?
> >
> > Thanks in advance :)
> >
> > Cs.
> >
