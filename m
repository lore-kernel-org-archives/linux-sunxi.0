Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5A240C5DD
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jun 2026 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008737; cv=none; b=Oft8w33F/lufUF17OapWBbUqTWDfsVR3z53behURQujmYTlIULuV/Rbrdgh7nYvjfFMhGtC7HqjznckTCCy/jWFEMOCrjSSreiUh7ZmypXJcrnEpC86TBl4Z5VO251nCfT/yLTJBBIxxAc9liPHiXqZ1AqgS6QyuTFe16zpFR+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008737; c=relaxed/simple;
	bh=/r+WTcxg/v4+c6CzD61XZv8A+8vyDIcgIPi1JGJfrzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROvzrSHXxAX29StUtYfFZ/bvgG+a5gBAGDqgT2O6WuKymj5xP79H8jkg5Lgwgg995Q7xjBPbPCBcpU1I8ZcvxpWs5siiDdxApKEGAzjh7hzyWPQAlleMcYQAPrQ3v47cpxhZW0hbgW1wJZAjV6h+IxYZsGxBaWzFnlIG3/IxJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5AMJ8BX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5AMJ8BX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A9F1F0089A
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jun 2026 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781008736;
	bh=JEzkvlBFFvYKUxV+2A69a6nCqpUbqrOObJ/AftXL8E0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=W5AMJ8BXLyS7hYvQYZS2SXfIrXt2JycaIQ+7d9SrPGm9LZxmU08PzNsdnEZbREmSx
	 b6ZgcCmEc+6daNrDyfqEVHTD+mRil0D5+ZB1AnvqC/071ygNFUOUqGLGe2FwBewiZe
	 NdxeG0R1Jm6B1auzzLvww07FBOhGWZlVfCZrSKGo+/cQuVANfL9m62yLAsjak5sF50
	 k0tlF7I5XPYgXE0lOIbKXGrNImOmuELP8rRNHpY7C0F2JKmeUv1q44c6CdM7TS+2ON
	 NlEaimbfcPv2YKgEcFzuZAHaWU1eEgs2YTXml30d+J9Yag0GJpeIYbLidCCHz+iP4d
	 a+NS81M6AigQw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa7a7ad4d3so4483159e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Jun 2026 05:38:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/XJfKQGGTeLmgIRN3hfTJ23wivmo2eMtjHIPUVOzFMk2F5Qo0TnG4am9xdXqbh9R8qxLKl8idQwtufgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLcYu8TzbqLvThVa0lJt9UpjpXz1KXHPLLcFUnwhlmknh85hyJ
	P15tAVgfVfPSExqxJBGhBbew1mYHtoKlh+sTnmYt+RvmnElNSz5Mnr/xBPdc4+dMKRpmST41Og3
	zOWFBm9CDclyXQCwMOp9CRzn3mMKSQ7U=
X-Received: by 2002:a05:6512:3347:b0:5a8:9f6f:3212 with SMTP id
 2adb3069b0e04-5aa87b88f32mr5272366e87.34.1781008734298; Tue, 09 Jun 2026
 05:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ah3ZAPLzh8ORGmpH@home.wens.tw> <20260609-mighty-excellent-shoebill-04d7fa@quoll>
 <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com> <98f3e864-3a9e-4f96-a633-0c0053ec35fb@kernel.org>
In-Reply-To: <98f3e864-3a9e-4f96-a633-0c0053ec35fb@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 9 Jun 2026 21:38:42 +0900
X-Gmail-Original-Message-ID: <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
X-Gm-Features: AVVi8Ccop8L6DDH-VT7ntRT5GDaoDpK71wx4lOBSA8i77A6ck-ulE7QwflSieZw
Message-ID: <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
To: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 8:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/06/2026 13:48, Chen-Yu Tsai wrote:
> > On Tue, Jun 9, 2026 at 8:43=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> >>> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f=
45e731:
> >>>
> >>>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tag=
s/sunxi-dt-for-7.2
> >>>
> >>> for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c247e56=
5f:
> >>>
> >>>   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:58 +0=
800)
> >>>
> >>>
> >>> As mentioned in the tag, this pull request contains a change that sho=
uld
> >>> be shared between the soc and clk trees. However since I don't have a=
ny
> >>> clk changes to send this cycle, I think it can just go through the so=
c
> >>> tree without any issues.
> >>
> >> But the clock driver change cannot be in the DTS branch. This should g=
o
> >> via clock tree even if it is one change. And definitely not via DTS
> >> branch.
> >
> > It is a shared change, because it moves two symbols from the driver's
> > private header to the public DT binding header. I don't see how this
> > can go through just the clk tree when one of the subsequent patches
> > uses those new symbols.
> >
> > "clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header"
> > is needed by "ARM: dts: sun8i: v3s: Add mbus node to represent the
> > interconnect".
> >
> > The other way to go about this is to use raw numbers first, then
> > another patch in the next cycle to switch the numbers to actual
> > macros. IMHO not worth the churn and headache.
>
> You can have a duplicated define.

I honestly did not know that it worked.

However, splitting what is effectively one logical change (*move*
something) into two patches just to be able to merge them through two
separate trees still seems wrong to me.

Would it help if Stephen gave an ack?


ChenYu
