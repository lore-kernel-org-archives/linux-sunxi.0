Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A03EB81D
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jun 2026 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005713; cv=none; b=CVdK+vnPVqmC8Yo2IBcwJ1GT4r0gTjSzrJ6vuu3xwrtUayyVut56UDh18FrfUULt/1F1ZpJBuyCB0VC1ouJo+Wig3RDZo76+s1pJnyzBuHK9bK0Wsb43G0yRO2sc3Utuli3ps290LTo66lCMJktT8uqslp+Lehfi4gp1NAbefFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005713; c=relaxed/simple;
	bh=cY8C1DuzDsjJ3gDJqSkziJHtiW3ma9geQETt7bhGXyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrMwxiwPHpMwceFDiHO/PeaL2pJKHdP0fmggqwIH8vR21ybbVXgZ95881uf3oHC6E4ALmfM59Y+lwBetSgGk8Wk4lW/rP0B24db/Q3NqRcNiRxoNqmdQippSs0C1ke44I9kuEVOs/ueS73wo4KVOXwgAxUa/dresWnj8mLZ2FgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YebtZ3Rq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YebtZ3Rq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE31E1F00893
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jun 2026 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781005712;
	bh=8letKVTX9hNzpm/6EzAg1nRrooRLvfpVgQ+GnYYjMQY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=YebtZ3Rqlnmo/sHNQ0U75sTLrXNbrSWH68R1cGT2QTEARlpoNb4BDCrFpNvVn44N5
	 ybLzDIe/3ee+1E2e3J5UlO/rk9ADqPgAMFyoZlJB36kSmiFIuqFO8qu/1HNGmOBwor
	 /t1VzoGZpZ8XQY2t83DmhDTXhso3bNYMDtfml4S6/6HibdIHIr72tRwhbgtw/Cphcj
	 4DncdCsYWSxPVUDYhkq0bOEoLQXtRpXuxVyZkHLoRpEeyCVIEWa/Yf9ox3fvE+Rt96
	 9XSOSEdyjihJHEicyY8N24bAGT8UA2c3/0mkR8c+jStAQr2CkKzVuEsGDXgpl70ZsZ
	 gG4H/vek+pWtA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39697a4e16cso51028901fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Jun 2026 04:48:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9jjxX91btbR4Jz7xBdYAhHZRXG1jQPUbmlbxWKYSlH/oaoBnuE8aApclf6fE33CsKr4QcR2q8i+gy9rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxEa3XDkH5oBUXH4iHJ3sbgTCgpC0ANEA/1MH9parbMAvPJGXz
	bvUnnFgf8Rz0YcNz5ZX2ZvdTzaMnY1I7xx27I8f2RkLiasJoMvnmEEutUagVij8yzuabSCsp+da
	PH/cEeNLR1M2Gu5Picg/KxFSYSS999qU=
X-Received: by 2002:a2e:be2a:0:b0:396:a77d:210d with SMTP id
 38308e7fff4ca-397f76fc095mr6358901fa.7.1781005710235; Tue, 09 Jun 2026
 04:48:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ah3ZAPLzh8ORGmpH@home.wens.tw> <20260609-mighty-excellent-shoebill-04d7fa@quoll>
In-Reply-To: <20260609-mighty-excellent-shoebill-04d7fa@quoll>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 9 Jun 2026 20:48:14 +0900
X-Gmail-Original-Message-ID: <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com>
X-Gm-Features: AVVi8CfgpRUT0LSxSlMDKOy2NI7ybB5lvzBRW7huka_cDgtqrOHRbP6ahpPHR0w
Message-ID: <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 8:43=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> > The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45=
e731:
> >
> >   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/=
sunxi-dt-for-7.2
> >
> > for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c247e565f=
:
> >
> >   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:58 +080=
0)
> >
> >
> > As mentioned in the tag, this pull request contains a change that shoul=
d
> > be shared between the soc and clk trees. However since I don't have any
> > clk changes to send this cycle, I think it can just go through the soc
> > tree without any issues.
>
> But the clock driver change cannot be in the DTS branch. This should go
> via clock tree even if it is one change. And definitely not via DTS
> branch.

It is a shared change, because it moves two symbols from the driver's
private header to the public DT binding header. I don't see how this
can go through just the clk tree when one of the subsequent patches
uses those new symbols.

"clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header"
is needed by "ARM: dts: sun8i: v3s: Add mbus node to represent the
interconnect".

The other way to go about this is to use raw numbers first, then
another patch in the next cycle to switch the numbers to actual
macros. IMHO not worth the churn and headache.


ChenYu
