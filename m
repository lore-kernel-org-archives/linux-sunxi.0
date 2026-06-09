Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490D327B353
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jun 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011588; cv=none; b=pR7g3R8TxQuZO9CLk3qNfXaE6FaxGpLnVQqafth71H3qp2t6n7csaZ+YBXA1uQyO+cnxIoqsq4I+WUFGdYTKUvIbfGmYMRaNxJzmlrlnfGlF2HsmFEG+MnyQ/Go4eCG1/BZ56Ijkfb+EmI06DF3oYHVOERYxM7g8tEXierCDakw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011588; c=relaxed/simple;
	bh=tokhUMJVgD1UL5Pa8n7L+Tlpe2ZzTjbuo75ZoeeqJes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPR55MlR/VxED3xzm+X/aLw+2ek7/WEhc7ZZbJb2gJB7mmfV3FDMxry/Cw9vw1bA/08vC54L0tumeC2jHROkQxgTmY/Y2qzUG86ZFrgJ4pnmpJg0avAk2BcdE+gCToLwSZC97nb5AA3DRAyZmaYL9979AMk2whWSBJL7STpDHa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FsAOq0B9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsAOq0B9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7671F00893
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jun 2026 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781011586;
	bh=7jeku2I21phSRJhXNQ/8/k0mAKNel37OuLRjgHhlZjs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=FsAOq0B9nb/kPXKrm18AZNB8bNM+17qDt7qtu4zr59+9256yIdnqgm5fFs1dFNV94
	 qQ24zkfg1PFGHD6OF9B6RXsOtCc3uRcxsXMHp1ZvWLncH7/CO/hnkcHxp6TJnuOfIA
	 esG6lp6tP+ZptVoK2K4nbzFexZaXGmeQAv/D6dGBcIf818pZ8QfbMLNMaUlpEAgW1o
	 waCisn6rzGUCjStmGEtmYJyNEsmuBHQ+na8C0nvks4ZfDdsL1T6mW7GSXWaNQKYIHl
	 OtiiiWZOMFtggY2bF8clvyRgLQopl8SgHKxmgSBAvLQ6+5CgnJjDJYQPlhV2QrFYQZ
	 RtQeo/cLovDWw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3965eab14cfso41491441fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Jun 2026 06:26:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ88OeCZcUMW8dv5BsqABM3FBmBbyoPykq9LcGRT/4QHeD9AVQ59EmLpkLQ+pt2lUsIPYt0dv4+NyEpYMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoHTTFImrK5OvW9ls2x0um1gUtFwlKyjspBN8qbzib6yaExl5N
	zltMuTey8tsgS1ghe5SFxhAT7Vw4WIRD7gFgjxfPL/00+U81xGu/j9rRPnG7+32lGl98D+o9lb4
	OqmVbqrgEgqwSClVT7qc067/yccW9U+g=
X-Received: by 2002:a2e:bea4:0:b0:396:76f9:ac7e with SMTP id
 38308e7fff4ca-397f77a914fmr7906071fa.18.1781011585140; Tue, 09 Jun 2026
 06:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ah3ZAPLzh8ORGmpH@home.wens.tw> <20260609-mighty-excellent-shoebill-04d7fa@quoll>
 <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com>
 <98f3e864-3a9e-4f96-a633-0c0053ec35fb@kernel.org> <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
 <e2bf1f8b-677e-4184-b752-26e987f29121@kernel.org>
In-Reply-To: <e2bf1f8b-677e-4184-b752-26e987f29121@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 9 Jun 2026 22:26:13 +0900
X-Gmail-Original-Message-ID: <CAGb2v654d6kj_CjWKtCGE+mLnSUBrQhywA9aCAGFhqh1SGQ1vg@mail.gmail.com>
X-Gm-Features: AVVi8Cd7Y5SiJ9fLWKz4u9swmJUU4oN4vwJk-SYibMTyRP_3Zg3Vog1ZYd_wLNg
Message-ID: <CAGb2v654d6kj_CjWKtCGE+mLnSUBrQhywA9aCAGFhqh1SGQ1vg@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Paul Kocialkowski <paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 10:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 09/06/2026 14:38, Chen-Yu Tsai wrote:
> > On Tue, Jun 9, 2026 at 8:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 09/06/2026 13:48, Chen-Yu Tsai wrote:
> >>> On Tue, Jun 9, 2026 at 8:43=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>
> >>>> On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> >>>>> The following changes since commit 254f49634ee16a731174d2ae34bc50bd=
5f45e731:
> >>>>>
> >>>>>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> >>>>>
> >>>>> are available in the Git repository at:
> >>>>>
> >>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git t=
ags/sunxi-dt-for-7.2
> >>>>>
> >>>>> for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c247e=
565f:
> >>>>>
> >>>>>   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:58 =
+0800)
> >>>>>
> >>>>>
> >>>>> As mentioned in the tag, this pull request contains a change that s=
hould
> >>>>> be shared between the soc and clk trees. However since I don't have=
 any
> >>>>> clk changes to send this cycle, I think it can just go through the =
soc
> >>>>> tree without any issues.
> >>>>
> >>>> But the clock driver change cannot be in the DTS branch. This should=
 go
> >>>> via clock tree even if it is one change. And definitely not via DTS
> >>>> branch.
> >>>
> >>> It is a shared change, because it moves two symbols from the driver's
> >>> private header to the public DT binding header. I don't see how this
> >>> can go through just the clk tree when one of the subsequent patches
> >>> uses those new symbols.
> >>>
> >>> "clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header=
"
> >>> is needed by "ARM: dts: sun8i: v3s: Add mbus node to represent the
> >>> interconnect".
> >>>
> >>> The other way to go about this is to use raw numbers first, then
> >>> another patch in the next cycle to switch the numbers to actual
> >>> macros. IMHO not worth the churn and headache.
> >>
> >> You can have a duplicated define.
> >
> > I honestly did not know that it worked.
> >
> > However, splitting what is effectively one logical change (*move*
> > something) into two patches just to be able to merge them through two
> > separate trees still seems wrong to me.
>
> It is not really one logical change. Defining a new ABI (binding header
> define) is considered one change. Merging binding change into driver
> commit breaks rule of splitting bindings from implementation.
>
> Second rule is that DTS branch CANNOT take driver changes. So if you do
> not want to adhere to the above rule you still cannot combine it into
> DTS branch.

Very well. I will drop the two changes and send a revised pull request.

Paul, can you redo the clk changes as requested in the next cycle?


Thanks
ChenYu
