Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C026727AC48
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Apr 2026 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776632170; cv=none; b=BKHwVarnurmVoHuAvhLcsJHa679Kl8H9LugQM4YmMTOrP3guFE8PLznNEpMGWD8/UKahhki5POlanU+gm+jpLlpDP4ebCbAzyQWz5VjHyBO+kWIC60KSdEEAmFwet+lehZLckf2JVJPj65UNYKiZ5+Kpnpq6acPAxx2u/4o5dT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776632170; c=relaxed/simple;
	bh=10s7haxDAajQ345wnYTnCiGJYIwWQeORgzsvCDfqHlM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a2Gakd3np70OgvBgfPghAxpgJvYHEn74M1B5madRqY+MsxSxvXhTlP405FlVvY7lNlBa1QrLTbfiQnSEZuiIPUbHt5x5Mb2RRWjUwSvrX/FXeiimpPXXUqu7KzU0aPyPLqfX8gnJk3f42GdQ3pdVwtPtKbWSw/1A4UnNmYIvR7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MNtCF8tv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MNtCF8tv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A8481596;
	Sun, 19 Apr 2026 13:55:55 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A8483F915;
	Sun, 19 Apr 2026 13:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776632160; bh=10s7haxDAajQ345wnYTnCiGJYIwWQeORgzsvCDfqHlM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MNtCF8tvy8WdHuo8nDQCjkb6kVlS7Tlumm9GF9N22x7MmJE+MxVinmbK9IfyAHt4P
	 +OnWVARYj7m1U0Dmu392HZMkadjj0YDsE7jMoRmOMZJ/46dJbgzv8xk/3KV/bO8dRG
	 lZqbfLxDLDRtsE74r0JvPEOYF3cw+wT2k9Z+ljnk=
Date: Sun, 19 Apr 2026 22:55:39 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/4] Add hstimer support for H616 and T113-S3
Message-ID: <20260419225539.718367e0@ryzen.lan>
In-Reply-To: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 19 Apr 2026 14:46:06 +0200
Michal Piekos <michal.piekos@mmpsystems.pl> wrote:

Hi Michal,

> Add support for Allwinner H616 high speed timer in sun5i hstimer driver
> and describe corresponding nodes in dts for H616 and T113-S3.
> 
> H616 uses same model as existing driver except register shift compared
> to older variants. 
> 
> Added register layout abstraction in the driver, extended the binding
> with new compatibles and wired up dts nodes for H616 and T113-S3 which
> uses H616 as fallback compatible.

Can you say *why* we need this? IIUC Linux only ever uses one clock
source, and selects the (non-optional) Generic Timer (aka arch timer)
for that? So can you say what this hstimer clock source adds? I guess
higher resolution, but what is your use case, so why would you need the
200 MHz? And does this offset the higher access cost of an MMIO
access, compared to the arch timer's sysreg based access? Also, IIUC,
people would need to manually select this as the clocksource, why and
when would they do so? (Given they even know about it in the first
place).
Also the hstimer hasn't been used since the A20, so nobody seemed to
have missed it meanwhile?

Cheers,
Andre

> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> Michal Piekos (4):
>       dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and T113-S3
>       clocksource/drivers/sun5i: add H616 hstimer support
>       arm64: dts: allwinner: h616: add hstimer node
>       arm: dts: allwinner: t113s: add hstimer node
> 
>  .../timer/allwinner,sun5i-a13-hstimer.yaml         |  8 +++-
>  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 12 +++++
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  9 ++++
>  drivers/clocksource/timer-sun5i.c                  | 56 +++++++++++++++++++---
>  4 files changed, 78 insertions(+), 7 deletions(-)
> ---
> base-commit: faeab166167f5787719eb8683661fd41a3bb1514
> change-id: 20260413-h616-t113s-hstimer-62939948f91c
> 
> Best regards,

