Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFAC40681A
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784759707; cv=none; b=ZzMxDwjk580AhRgZmNoAkMezgEujEybBFytJjyrOYX2y8Xk9liMfeDv9nd5mpd/3cKkUH5EUD70nIrfxKHrYpHRhd9fU/fJGdk92JaSqYbipi8CJBO9RVJ+EAQM2qmcRvFCX3sSvSFMofmmlNYX/85Ed3nxBhZLT1X/gD9X8UrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784759707; c=relaxed/simple;
	bh=+zDJ7KLhhR+L+X9r/DA6AC2Lf372VvSm+QWFUxozOwA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OQyTfztuJGpQNsEEJMJpvK7wpGe/bI57EiL4wmd7/EJd+6VhqhF8apTOTZHj8uEWbpq7deMB9k3IG1ORTaUfRBxBvRE2CpDDqipls9c6/k8dSxG6LGJjt+BPufY5Q3rL9hktR7PBxoqNfihp+2uMDwBaJnMGkat3lTDDzSS/yMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oiWFDpuF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oiWFDpuF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA9CF168F;
	Wed, 22 Jul 2026 15:35:01 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 409FE3F86F;
	Wed, 22 Jul 2026 15:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784759705; bh=+zDJ7KLhhR+L+X9r/DA6AC2Lf372VvSm+QWFUxozOwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oiWFDpuF5h9pwDpPeb15VijbnoV2ZHGWRK70PUU+bzkZdDpUv0IT+teFxshkBiS0+
	 ZhY9Rq1AgzBRHKgAx9chfa1nRPQnjUlvuGsU8U31oNJcmNJ9MN+e+j1AM/J35tNy6u
	 VXkTmR0cLi5bORUQVR5v56UVJHRsILMJgSCd+WtA=
Date: Thu, 23 Jul 2026 00:31:15 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 0/3] media: rc: sunxi-cir: support the A523/H728/T527
 IR receiver
Message-ID: <20260723003115.3087bf3e@ryzen.lan>
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jul 2026 16:17:14 -0400
Justin Suess <utilityemal77@gmail.com> wrote:

Hi Justin,

> Sorry for the delay,

no worries, thanks for the update.

> This is v2 of the series that adds support for the CIR
> receiver found in the Allwinner A523/T527/H728 family (sun55i).
> 
> Unlike the previous version of the series, this version has no driver changes,
> and just uses a fallback compatible and enables the receiver.
> 
> Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
> came in the box (using NEC keymap). Was able to press buttons and
> get readings from lirc / ir-keytable again.

this all looks good to me. As mentioned on the individual patches, I
tested this on two boards here. I sent a patch [1] to enable IR on the
Avaota board, which goes on top of this series.

[1]
https://lore.kernel.org/linux-sunxi/20260722222627.14138-1-andre.przywara@arm.com/T/#u
 
> The series is (re)based on tag v7.2-rc4 on mainline.

Please base your submissions on -rc1, that simplifies merging/rebasing
for the maintainers, because then all new patches have the same base.
Not a particular problem for this series, since everything still applies
cleanly, but keep that in mind for future submissions.

Cheers,
Andre

> 
> Justin Suess (3):
>   media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
>   arm64: dts: allwinner: a523: add IR receiver nodes
>   arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
> 
>  .../media/allwinner,sun4i-a10-ir.yaml         |  8 ++++--
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
>  .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
>  3 files changed, 39 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f

