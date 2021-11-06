Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760529CA
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Nov 2021 03:10:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id BFEDD5C0166;
	Fri,  5 Nov 2021 23:10:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 05 Nov 2021 23:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=1
	dyN6SpkiOI773PJJM9yMWuisA+KK6dwSgoItNkaosY=; b=o70qo8LDG33HaVkot
	XNHFtii/zQCF6HO1Ms66zvM8yTCV1UKGLSMDSugjbCh/ict5ibZbs/FK+i/CsE4m
	Y4mYROyDpJp6ObB0KSSOo1UHBEvq72PmR2KqLss/NxTn8/oZTDu8fA9oBAXzk64v
	YhVEgVFAAVJ6N0HZ//+C9t0+quX9m/Zm05n5CnIWBK5JzjU/2F0OT1HsZw55Ln/a
	YYGr5tKVRlPmunALq94mKfb4sYU+QCdCDRyoFKu7i5hDvBDu3WG2dDH0grvfJlfr
	zXrvqFGnCSal3zqHmlz9z6E6OPbgOViK8WxhTaiCrzndbbSy+aVahKVPaPgCKYxj
	wqKHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=1dyN6SpkiOI773PJJM9yMWuisA+KK6dwSgoItNkao
	sY=; b=JH8l600GJPpee+L7BSDw9G4DFLJmyReJEweWaXX1SO0F/sd/rSNj19OOJ
	k7IodrpYh+QfWy+wwu0NDegUv50cfAGB6PDnJrrBM37dSROcni1fo1rW64xpV2S+
	Q+SCBvTzIJOhrxa804HJ8ZklXsr3jGFdzmwGlygci7SAsVds4rY+0vEQE8OBHeqT
	0NaPuVeudzRlcI22Cer+U2hPEppGYs1AGyZ8RzQVvtXsdtiyVRYfGmnSsixUnHA9
	guk4A8or502CE0hyVqGw1NUnC0UcU8sopOvNHxQySusibhJ5L0+CrLcxwvzS/3HT
	DSZgZ4zsQsOH2eDhCgkhge41+gigw==
X-ME-Sender: <xms:DvKFYVvIgX9VWE0rMmYtKgiQkb7bakfhOYe1oRbRqfhwdAjU29os5g>
    <xme:DvKFYecsHsrjFyNbAMC_9HvD22X33jShYSIqDZtElN4cX4_PUp5WNDVPbzxpKoOQ8
    5HSRomt-czFCXRpqw>
X-ME-Received: <xmr:DvKFYYwAhdnOOFIsRzTZ2oVTWQUOqkCu9lyPMpDS5KAT7OhEUefTnDFzrLtCjTgSY70AwAEyNunscDX-meDjumVnxsc4IMSiyyTmPA7IT5PANsqpZllaWDVNag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdejgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:DvKFYcNvEkqCcR7WznFuhQc6gxBBGPrJOPjejAgCxiteFCAVNxxNtA>
    <xmx:DvKFYV-MSnjpB4tyyTftnWzNiae3Zb22yESO-J4guoxuUiFhlVKGsg>
    <xmx:DvKFYcW6VXwWaSCVDBealS_kXg_IiTDmCUiPL-yN3XEhWMannq_t6g>
    <xmx:D_KFYRZKiUkmd9b2pd-g6HeXwMb7cgmPVKf4haCQbJBuFiZXFTyMVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 23:10:06 -0400 (EDT)
Subject: Re: [RFC PATCH 11/13] mmc: sunxi: add support for R329 MMC controller
To: Icenowy Zheng <icenowy@sipeed.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20210722063015.421923-1-icenowy@sipeed.com>
 <20210722063015.421923-12-icenowy@sipeed.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <76e9786b-aabb-f21b-e63a-fe070825fcb4@sholland.org>
Date: Fri, 5 Nov 2021 22:10:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210722063015.421923-12-icenowy@sipeed.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/22/21 1:30 AM, Icenowy Zheng wrote:
> R329 SoC has similar MMC controllers with previous Allwinner SoCs.
> 
> Add support for it by adding its compatible string.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>

It really is that simple; as far as I can tell, the other checks are
covered by CONFIG_SUN50I_GEN_H6.

Reviewed-by: Samuel Holland <samuel@sholland.org>

> ---
>  drivers/mmc/sunxi_mmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index 6b809c001f..59cc28794d 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -734,6 +734,7 @@ static const struct udevice_id sunxi_mmc_ids[] = {
>  	{ .compatible = "allwinner,sun50i-h6-emmc" },
>  	{ .compatible = "allwinner,sun50i-a100-mmc" },
>  	{ .compatible = "allwinner,sun50i-a100-emmc" },
> +	{ .compatible = "allwinner,sun50i-r329-mmc" },
>  	{ /* sentinel */ }
>  };
>  
> 

