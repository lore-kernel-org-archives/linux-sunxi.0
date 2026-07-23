Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3F53EE1FC
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793597; cv=none; b=PdaKGtjvlghbGusYb7BnZ684CX+zM89I3y2M9uYooJOe9wJKR5DJQiQV+CGpd4JZ66Z4hC2mgPNlKG4HqHwInlikRqKsnU+0Km+6jtiDAsa67N2SjX7EGRsFIZVkDwsQhq3kA5xVwrumVCgAiE5maK21Rp6fDSy5rlOjjRH9H5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793597; c=relaxed/simple;
	bh=PZ9cLd5vXkqOcuFGnstrDDKPwunq3EKIElywadcD1Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7df7tv4rGOVSzHHxhdXr/dKxR28WffeGAunanaiAIAKOvUfIwjYy1u3RiawIf2QioHgl146tlKHuhQYfOBPYlwpBJMp5IadWZJDqaB0yXzwVCapK5rP8tH2WX0bw4PEmbpjPtmLWn5EZsVxlCyMWMMr51fZjin4qSKEPYmoFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=in8JzGId; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="in8JzGId"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B30E1477;
	Thu, 23 Jul 2026 00:59:51 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8916B3F66F;
	Thu, 23 Jul 2026 00:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784793595; bh=PZ9cLd5vXkqOcuFGnstrDDKPwunq3EKIElywadcD1Iw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=in8JzGId0LC6dWY2LG9U0bwdrm9y2fF3m1ARSmEluWsmMdrRWnb+EKMBXrBI7dxOD
	 LKpuBQq2q3TL14hNjQRo/UF8UTKHsIQOssMkZQoD002FPpztu3NxCdBqE+8jQ/MDuI
	 noaTYFrjxhlkfG/oUs7w2cvZcojS5yIHdjen7lxg=
Message-ID: <f28ea754-5b13-4bf4-a3a6-585605f38ff1@arm.com>
Date: Thu, 23 Jul 2026 09:59:53 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] media: rc: sunxi-cir: support the A523/H728/T527
 IR receiver
To: Justin Suess <utilityemal77@gmail.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Sashiko <sashiko-bot@kernel.org>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Justin,

thanks for the update, but ...

On 7/23/26 01:36, Justin Suess wrote:
> Hi,
> 
> Quick series respin for easier application.

please try to avoid that. Leave *at least* 24 hours between revisions, 
to give all reviewers at least a chance to look at the series. Otherwise 
they might get frustrated if they started reviewing a series, and get 
ambushed by an updated version in the middle of the process.
And in this case here you are probably waiting for a DT maintainer 
review still.
Also maintainers can fix up minor issues when doing the merge, so there 
is no pressing need to send a whole new series for just a minor hiccup 
or just for adding the tags.

> This series adds support for the CIR receiver on the
> Allwinner A523/T527/H728 family (sun55i).
> 
> One-line function name change s_cir -> s_cir_rx at Andre's
> suggestion, with his patch for the Avaota A1 applied on top
> for convenience.

Thanks for taking that in, but please note that you would need add your 
Signed-off-by: on top of the author's in this case, to document the flow 
of patches, and for legal reasons.

Nothing worth to a respin again ;-), just wait for the DT approval and 
for what Chen-Yu suggests.

Cheers,
Andre

> v2: https://lore.kernel.org/linux-sunxi/20260722201717.2205609-1-utilityemal77@gmail.com/
> v1: https://lore.kernel.org/linux-sunxi/20260702214750.3428694-1-utilityemal77@gmail.com/
> 
> Andre Przywara (1):
>    arm64: dts: allwinner: a523: enable IR on the Avaota A1
> 
> Justin Suess (3):
>    media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
>    arm64: dts: allwinner: a523: add IR receiver nodes
>    arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
> 
>   .../media/allwinner,sun4i-a10-ir.yaml         |  8 +++--
>   .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 35 +++++++++++++++++++
>   .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
>   .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  6 ++++
>   4 files changed, 52 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f

