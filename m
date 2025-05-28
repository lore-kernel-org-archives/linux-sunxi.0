Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ABF1F1537
	for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748453136; cv=none; b=Qsjfq4CHa2RugUS12LFw/nbwVBtjcjRfpmfITAPBsKvO59GbhqcthrOSMhbwlfy8S6bZWkhBX6h6VAUOrFmLxKFAYFvxQGisN7WlFoPCWMWzttrQ2kOPXNSL/z+ilAHbCsjOmQXvRvPRaiUy8HRT04ShQRR5R5d3ME+FJst7ikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748453136; c=relaxed/simple;
	bh=/OzUyuVqnOB7miLFV37uZy05en+YqG3p0V1Vv2/8lTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqvKphxCs1HEdDEuelCY7LbSpv/Hbnbz3bD5g4inxmkmg4YVuWwfYBVwpCWv9Mz8/R5z88x8gjDeODRRAK1+AV6ox8Qomk5s6gfQHDQEvGX0AOnB/a2HzyhI6isnoKo4bn4XGZwnVdXeVoDt21cBN6khTBXPcTEaFwByC/EfMe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrSpalFO; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrSpalFO"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6faa60c983fso1173876d6.2
        for <linux-sunxi@lists.linux.dev>; Wed, 28 May 2025 10:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748453134; x=1749057934; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OzUyuVqnOB7miLFV37uZy05en+YqG3p0V1Vv2/8lTk=;
        b=DrSpalFOh1r0YmuylWyeslY8QblltXzpF9Zd05SMJ8RbSN2uI6qjBbGPUPHaqcR6fi
         21dscPjFgL9hQ+3lJ/f9LcNAcCjqeYsXR0LkeSHRVYoUpA+Iz2zCyaDx6fPSdqoVATH2
         Is/xmrKqbNrMlpyrl9vwwB0CvtX6zmXk4YDbaOKgYGv8PrXcQ9T36G4uMTQdkcnBv287
         610LhcRuGhJjbrCTfJzvOTQL7UOtHGKEpgewTGZ9UjiwUbGKnOGzgZ1QHh57QGsOu7jU
         vbBHfrdu4Y0KVzIyZmaEcYJv2klIwqR8f3zrCaXv+yVcJRZycUaflhQY4fxpMAYZJlvZ
         kN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748453134; x=1749057934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OzUyuVqnOB7miLFV37uZy05en+YqG3p0V1Vv2/8lTk=;
        b=mRrAbAvL4MCXNbtbw9Yd4mjwdO54JerOpZPT78/vwUGOO67gm4JhDM1SBsnfwt+2SY
         RcC8qIS5sbWWbzomkkB77PX+9tNMMEsyYvTT9fAMOjai3VWZa2mpPKZLgeNG1+hXeJTy
         PTVaOHjgBZeixsT1KASMIvgN7LTkokjgWh6Sd+J+UW4/6CsS6nohU4qthtf/FiU+/fkX
         pO9oklNbnoRjNA22lTpFs5FtkMxl78SZdnvMT3nPtJyQBRl6ooNGqNGEQR2wLJgfAUkv
         bCYXDrKHRRN2Y29KBGDkkNAOHJlxIUl1y5bQWRZQvklTkWazyS1PLBJmjeDgVgOi7Xi8
         tdGg==
X-Forwarded-Encrypted: i=1; AJvYcCVb5xiE572om7pecvOYAOJCzxrjlyVprVDHZhJQwtN2By3HQw0I44oOqEK59eFyARvgeZDoUPdRxrUEkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEKgebfQXg6BCxrBnN2m6Poh5honsg1jRTygFl5swV2qdcd63I
	b6ANA/KHya5mC20RTs0nHYxQor0tma2u0r7cwkqmAE5XB9pAzl8JhZfIq4S+WCy3I5bZC+XMN8C
	fhuMi7XGE4jXo7deSoERwxYsQ6n8LJDk=
X-Gm-Gg: ASbGncsRg41Mx7KiPVqjxhQgNMd7pqWCLIV4SWde4d05IN5so160OUZukmmX1TvPLSP
	IIzbe9FpdW0pT5t0bMx+rX8csgLWrdV97XR+xt0UcdiKUfDRNLHENL9Kee86oSBnEN2xQmQHORX
	zVZ0euJGBli8Hz/zQyttI883mBcwlDguJAmw==
X-Google-Smtp-Source: AGHT+IER5qx1DwG+fJoBcyq/OD8RJi4KmfX7CsQR2aaR2iNxoMBecCu9w8+lxoiC4pk7miaSH11257NF0qW83P2oVoA=
X-Received: by 2002:a05:6214:20e5:b0:6e8:9dc9:1c03 with SMTP id
 6a1803df08f44-6fa9d290768mr317566926d6.21.1748453133588; Wed, 28 May 2025
 10:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk> <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch> <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
In-Reply-To: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 11:25:20 -0600
X-Gm-Features: AX0GCFveR1vAlsAT85LmMrDh-cWJLkLNiCTzyzcFYtPEIKrvDRjHUdM3zbS3iJQ
Message-ID: <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: wens@csie.org, Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 8:12=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Wed, May 28, 2025 at 9:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > On Wed, May 28, 2025 at 05:57:38AM -0600, James Hilliard wrote:
> > > On Wed, May 28, 2025 at 1:53=E2=80=AFAM Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> > > > > On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@lunn.=
ch> wrote:
> > > > > >
> > > > > > > Sure, that may make sense to do as well, but I still don't se=
e
> > > > > > > how that impacts the need to runtime select the PHY which
> > > > > > > is configured for the correct MFD.
> > > > > >
> > > > > > If you know what variant you have, you only include the one PHY=
 you
> > > > > > actually have, and phy-handle points to it, just as normal. No =
runtime
> > > > > > selection.
> > > > >
> > > > > Oh, so here's the issue, we have both PHY variants, older hardwar=
e
> > > > > generally has AC200 PHY's while newer ships AC300 PHY's, but
> > > > > when I surveyed our deployed hardware using these boards many
> > > > > systems of similar age would randomly mix AC200 and AC300 PHY's.
> > > > >
> > > > > It appears there was a fairly long transition period where both v=
ariants
> > > > > were being shipped.
> > > >
> > > > Given that DT is supposed to describe the hardware that is being ru=
n on,
> > > > it should _describe_ _the_ _hardware_ that the kernel is being run =
on.
> > > >
> > > > That means not enumerating all possibilities in DT and then having =
magic
> > > > in the kernel to select the right variant. That means having a corr=
ect
> > > > description in DT for the kernel to use.
> > >
> > > The approach I'm using is IMO quite similar to say other hardware
> > > variant runtime detection DT features like this:
> > > https://github.com/torvalds/linux/commit/157ce8f381efe264933e9366db82=
8d845bade3a1
> >
> > That is for things link a HAT on a RPi. It is something which is easy
> > to replace, and is expected to be replaced.
>
> Actually it's for second sourced components that are modules _within_
> the device (a tablet or a laptop) that get swapped in at the factory.
> Definitely not something easy to replace and not expected to be replaced
> by the end user.

Yeah, to me it seems like the PHY situation is similar, it's not replaceabl=
e
due to being copackaged, it seems the vendor just switched over to a
second source for the PHY partway through the production run without
distinguishing different SoC variants with new model numbers.

Keep in mind stmmac itself implements mdio PHY scanning already,
which is a form of runtime PHY autodetection, so I don't really see
how doing nvmem/efuse based PHY autodetection is all that different
from that as both are forms of PHY runtime autodetection.

https://github.com/torvalds/linux/blob/v6.15/drivers/net/ethernet/stmicro/s=
tmmac/stmmac_mdio.c#L646-L673

> The other thing is that there are no distinguishing identifiers for a
> device tree match for the swap-in variants at the board / device level.
> Though I do have something that does DT fixups in the kernel for IDs
> passed over by the firmware. There are other reasons for this arrangement=
,
> one being that the firmware is not easily upgradable.
>
> ChenYu
>
> > You are talking about some form of chiplet like component within the
> > SoC package. It is not easy to replace, and not expected to be
> > replaced.
> >
> > Different uses cases altogether.
> >
> > What i think we will end up with is the base SoC .dtsi file, and two
> > additional .dtsi files describing the two PHY variants.

I think having a single PHY .dtsi for both here is ideal if we can
do runtime detection, since it's difficult to know which potential
variants of PHY various devices shipped with, in our case we
have access to enough hardware to determine that we have
both variants but for other devices most developers will likely
only have access to one PHY variant even if hardware at various
points in time may have shipped with both variants.

IMO without runtime detection this will likely be a major footgun
for anyone trying to add ethernet support to H616 boards as they
will have difficulty testing on hardware they don't have. If we provide
a single .dtsi that implements the autodetection correctly then they
will simply be able to include that and the hardware will then likely
function on both variants automatically by including the single .dtsi
file.

Requiring the bootloader to modify the DT adds a good bit of
complexity and will be difficult for most developers to test as
many will not have access to hardware with both PHY variants.
