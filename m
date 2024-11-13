Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A83D15F40B
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Nov 2024 06:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731478230; cv=none; b=WJ/KBFPphmWAR6C5D8ftADajTSo+WYMUXVONy1O3uUHw+lZmkjLlGrYkmnoL/qtASpibf4uLu4E9Oa7MLpDNyq9HP2OSOkkxm4DfqbMq85LZAtfxWEl+l27Nf7qlgudrspXD5u3Me+CaedINAiyx2bluZsF9ik2wUwxoaCOI8+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731478230; c=relaxed/simple;
	bh=o8cEd4noyujbrkmjxRhJsldqQk5Rilrgqa5P4dcoowM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tNs2AsTKKV9GBXiX8HGsFuAeWZuH6NccTEAF30/Rbx3odEr4X4vVNzyE3/Uj1dFyBrkxNbyi2uUB/kL6iGHryazRo3cnBZkYchtWTeuDyBgM+Yilf6YG2IXcX90oj+1Av5hhJb7EO/cmlkxI4V9Mambxu5OKFlKIfWYMcSsgX2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=pvpYVg9n; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="pvpYVg9n"
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id AjT6txT19qvuoB6aBtyYLx; Wed, 13 Nov 2024 06:10:27 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id B6a7t2UBNWvXpB6a9tlJ7F; Wed, 13 Nov 2024 06:10:25 +0000
X-Authority-Analysis: v=2.4 cv=LtdZyWdc c=1 sm=1 tr=0 ts=673442d1
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10
 a=adFrNvAlZa_jBKZnjswA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IbJyGIYF+t0s5RGNOpKjoIQnVKjH/xfjQJ02Hcx//wY=; b=pvpYVg9n8DntXmS+V4Vhy7o/zg
	aVTxKkjoOoFC5l4vT2DaRXchYrg5e+NgcELmsYXFwZ/8tvXorckG02G3m/ZMQo7LSwr5aadnTKA2Z
	HhJgIF2WqWVig7Qml5Wdv8l2mVxyCciqQlCUXWYEE9x/eUXwBO4enSC/Uz+pJd4eLFSDBQL5WGUF/
	6O5KssYI37VXId88b/kKWzFa79gJLfA/N6biu5xFvGCJGLxky/BmVFf8dequ5Oghw++QvszrnRahU
	mLviAFI/XoH4IWSqklEPl1mT4Gzp2oJY57v+tCbvJR4UkQcjNGNgRRaULfFIMeimydocA1KXGEdJM
	UT+x9MiQ==;
Received: from [122.165.245.213] (port=35314 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tB6a2-003Pv5-1e;
	Wed, 13 Nov 2024 11:40:18 +0530
Message-ID: <2ef6afa0-2756-493b-83a4-62e73a8e2af9@linumiz.com>
Date: Wed, 13 Nov 2024 11:40:14 +0530
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
To: John Watts <contact@jookia.org>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan> <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
 <Zy4c9BFcrz2JVU6k@titan> <ZzNCsFiAiACFrQhE@titan>
 <f0d5b314-cfcc-4856-8d6e-09e437c075ec@linumiz.com> <ZzPluoI7xSTwhNcm@titan>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <ZzPluoI7xSTwhNcm@titan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tB6a2-003Pv5-1e
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:35314
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIIciahf4NcwjyB8WDDaAMvabj1dVxGlhewrjhVGM2lS+Sq0TuH1HtUoQeOXNc4Z+RCS/Ad11RQOE97wqSjMwwADtX102adUNjOtsI9o/jKeePprsSpo
 Tk4tpUV7w7w2F1AvYO2s6vTH0kzqf0hvMJDWFafqCgt2Of2k4sHynIQlmnYDqUfhCq97DPk2R4LmkYbfmOS3z3Ua2HLwEOOov7c=

On 11/13/24 5:03 AM, John Watts wrote:
> Hi there,
> 
> On Tue, Nov 12, 2024 at 10:43:44PM +0530, Parthiban wrote:
>> #define TCON_TOP_PORT_DE0_MSK                   GENMASK(1, 0)
>> #define TCON_TOP_PORT_DE1_MSK                   GENMASK(5, 4)
>>
>> references towards DE0 and DE1 is for DE itself, not the mixers in the
>> current implementation.
> 
> So the datasheet says it's for DE0/DE1 but the Allwinner driver and mainline
> driver assume it's for mixers. There's a conflation between mixer and DE in

No, Mixers in upstream refers to RT-Mixers inside the DE. It's only the
quirk for R40/D1 setting the DE ports using mixer numbering.

> this case, especially because everywhere mixer1 is used on the A133 it is
> switched to DE1. I'm also unaware of the R40 having two DEs which kind of
> confirms this might be a typo. If anyone has actually tested the second output
> of this it would help find out if it actually means DE1 or mixer1.

Gave a quick try, but display went blue. My current assumption is that it's
called INDEPENDENT DE, so DE1 <-> LCD1 is the only possibility. Yet to try
that pipeline.

> 
>> Handling for mixer0 <-> lcd1 and mixer1 <-> lcd0 also needs to set
>> DE2TCON_MUX in de clock, which is missing now.
> 
> Hmm. Are you sure? Looking at the Allwinner drivers it has the method
> de_top_set_de2tcon_mux in
> drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_v33x/de330/de_top.c
> which I think means it's for DE3? But I don't see it called anywhere?

Missing in the upstream. 

> 
> This might be worth discussing in the DE3 patchset.
> 
>> sun8i_tcon_top_set_hdmi_src for R40 already sets these values via quirks.
>> i.e controlling the port muxing. Also D1 quirks is same as R40. So the
>> original changes to make the DE1 point to TVx can also done in this quirk
>> without hardcoded value?
> 
> In this case I'm using an LCD which isn't HDMI, so I'm not too sure how much
> this would help. Having it as a quirk also seems a bit overkill if this is a
> general preventative fix, especially since Allwinner doesn't seem to test their
> functionality. Relying on it seems like a mistake in this case.
> 
> My other thought is that when sun8i_tcon_top_de_config is called it could do
> something. But I'm not sure what that something would actually be, given it may
> be called twice in an (I assume) unknown order.
> 
> Say, if mixer1 is set as TV0 and and mixer0 is set as TV1 we would try to set mixer1
> first, see that mixer0 is already set to TV0 then ... error? Even though the
> final configuration doesn't have any conflicts.
> 
> I was thinking something like this for my next patch:
> 
> 	/*
> 	 * Make sure that by default DE0 and DE1 are set to different outputs,
> 	 * otherwise we get a strange tinting or unusable display on the T113.
> 	*/
> 	reg = readl(regs + TCON_TOP_PORT_SEL_REG);
> 	reg &= ~TCON_TOP_PORT_DE0_MSK;
> 	reg |= FIELD_PREP(TCON_TOP_PORT_DE0_MSK, 0);
> 	reg &= ~TCON_TOP_PORT_DE1_MSK;
> 	reg |= FIELD_PREP(TCON_TOP_PORT_DE1_MSK, 1);
> 	writel(reg, regs + TCON_TOP_PORT_SEL_REG);
> 
> Perhaps this could be hidden behind a quirk? I would have to check to see which
> chips have this behaviour, I'm not sure if it's a bug specific to the T113 or
> D1/T113 or R40 too.
> 
> Also noting at the top of the file that DE0 and DE1 mean mixer0 and mixer1
> might be good to reduce confusion.
> 
> What do you think? :)

So far there is no real user for DE1 in upstream. DE_PORT_SELECT_REG value for
DE1 can be negate of DE0, so that they won't conflict or cause timing issues.

Also DE_PORT_SELECT_REG mentions only about TV and LCD muxing, but missing HDMI,
DSI and so.

Otherwise, if I get DE1 working in A133, I will try to add quirk to set DE0 and
DE1 port mapping in that case to respective connector.

Thanks,
Parthiban

> 
>> Thanks,
>> Parthiban
> 
> Thanks for your input!
> 
> John Watts

