Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18033207
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Jan 2023 19:39:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 8129D32000E5;
	Sat, 21 Jan 2023 14:39:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 21 Jan 2023 14:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1674329941; x=
	1674416341; bh=Y0FXAS+fNZAdvuWj2AlNbu+6c9SFOJKM5yH3EktJpKQ=; b=Y
	hSmlT4NyEKViwJ2VTwTZdkY2Kp4t1d1ftwBkQK1Pe/2a3ZS4E3Pj+zNM8doy28/s
	y9JfYQjT029dcDPNcXaBdjT54pxZTP/0pY/WHMBUxIYWuXkxiDtTfmss4YPt2VRt
	hd0sCmwPfPGBM3FQZa7gDjyYwmN4spW5Nr0wIEMLsddVYMM6iMRO0axmB2n1uHio
	FQxT/r8hx10DKi+A2lgedUGqKYsFS/bJ+5oWByddK6MIi0kbi6Lkh90GSesyXnBS
	PdaEreeNgVOjIjXhsUeVDYig3Bws0F5Te+c2MOc0p0Zp0SNS7gmnGxNjHtQ46/gQ
	GpWA5yIjjNczid1SQQYLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674329941; x=
	1674416341; bh=Y0FXAS+fNZAdvuWj2AlNbu+6c9SFOJKM5yH3EktJpKQ=; b=b
	7wB4X8mebSDh+0IAGsvjLMxDmu2rO8EVW9r9/B9cb7ctJm8Q4iuybZ4MUu8PyocG
	MpVpW9Y7qF5b2h9s4gjbi+M83rhAeG7EFAYGi44TViIRwy73f3DhELQSahVrWQ47
	kgBCFSVKLQ33NaqJTCMUFf/2RoVMV/UudKxH41XSAJox7tJ4r560fkcuL1yrXllj
	2b7H5jGvyjOFtJQ3oqoJ2V7gemrjZSvmcjxULCWWVCAK73xxyuDrD0SoEmoSi4OV
	d4UxKNNSUWlqDM9ivetAmOkEc1O3EUCqvlXwh+Kc686aeZ0iUXZESvY6/QUWDLGV
	kdFmM7AmqjHTOroQV166Q==
X-ME-Sender: <xms:VD_MY4A3c8X2VVU50RqAK-J7XSPTBScOEaWnxi_-t-hwl8TZMx3Omw>
    <xme:VD_MY6i94Qcnvw8rhX8D5onZlos2rLvHxVZQ4_ZRwVrrmLtnGQ00hw0a5yn-4P-gR
    H49FQ4xzz7ntFpAdQ>
X-ME-Received: <xmr:VD_MY7kIw6lI3MlEzyUz0DrgKkGi-p9w4jjFMX-PfCz_z59ErGynZmpnFPTGBVy0APmAKHec9AzdzzdobRZuBuQmpMJpu8LLIIP_ROOGfVzpJLonlfhqQ-oa3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddugedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeel
    leeftdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:VD_MY-xYUD_O3U2slMr5bk5qCH3tk6zFYIKaRrGfgyy-GANSSMqotg>
    <xmx:VD_MY9So7QLzQdCN-O4uGiJJyalGYPzJ1GE6ekOv7S48nX15yo0Paw>
    <xmx:VD_MY5b2NcEKaPtmWjUxFNpv4W_XMvK79UUo2HTBPMxdVPQ3grldTQ>
    <xmx:VT_MY4d87cuNtS34-CVwv8W1PaMheXixOVYLTTvXUcQK5ahfPV1TdQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Jan 2023 14:38:59 -0500 (EST)
Message-ID: <4cd16d82-3fee-b8fd-07d7-f5afa2a7b48b@sholland.org>
Date: Sat, 21 Jan 2023 13:39:01 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] sunxi: eMMC: support TOC0 on boot partitions
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20230121015121.20150-1-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230121015121.20150-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/20/23 19:51, Andre Przywara wrote:
> To determine whether we have been booted from an eMMC boot partition, we
> replay some of the checks that the BROM must have done to successfully
> load the SPL. This involves a checksum check, which currently relies on
> the SPL being wrapped in an "eGON" header.
> 
> If a board has secure boot enabled, the BROM will only accept the "TOC0"
> format, which is internally very different, but uses the same
> checksumming algorithm. Actually the only difference for calculating the
> checksum is that the size of the SPL is stored at a different offset.
> 
> Do a header check to determine whether we deal with an eGON or TOC0
> format, then set the SPL size accordingly. The rest of the code is
> unchanged.
> 
> This fixes booting from an eMMC boot partition on devices with secure
> boot enabled, like the Remix Mini PC.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Changelog v2 .. v1:
> - use struct members instead of indexing buffer array
> 
>  arch/arm/mach-sunxi/board.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>

