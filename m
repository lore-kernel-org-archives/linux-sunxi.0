Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB6F7C
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Mar 2022 04:20:24 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id A2B095C019B;
	Mon, 28 Mar 2022 00:20:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 28 Mar 2022 00:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=fP1j9Qg+r22YhM
	4fk/jwjYBecMIvk/Iffut9uXlaw/Y=; b=deWgfx+tPcQtZlf1a2TvGAlXBHDJ/c
	LNeJQB3Urt5ezLMfjQFpB68H6TiqHtjD58bCEc0n5zwisz5JF8JtyTu2Z80MMI7t
	4hKS/ckmFyujgaFXt1ET8+Pl6VPFvDqAWmdjab1OLYYlSe//qZheQUTT9lpe8giM
	+mp5vEOz14iEKtwApvz0pEu5+gNKeUL8BGn4KvOh2rpqIP8r/4VY7YvPDMimTmEE
	IOmB4kruTrsZpSORkl15NQO0Z0DSxwzYRMSvG4+vqxjVveamV4RhYNWL9FWJ0B2i
	Hzy8l2Bv7+0bXq/epUpiaNvW1Qrgt4r7+Nb8lMcb1lrGLtkYis7nSeXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=fP1j9Qg+r22YhM4fk/jwjYBecMIvk/Iffut9uXlaw
	/Y=; b=YvIiHrsm115nBCEbjVKx/qH4PHo2AbpcaLu7xjSTvfwyWOLappB0vACi6
	2WPVCaX6aFbRoQNX4M0xrDVyJ1yvHZMlgPbJyuWM2sXaex49ZbVIjCvCjOYkkhAA
	3dJCgaIZMpyezDgEpMo9+lDexM9jSW0+GGkPZwBuRKsaB9itxFMJJik2ppMpGGPH
	/jVboPBJBAIRwWs+ofb2UhaKk6bY3tOTWDem5GCELl9al0TfaYKPPCGCXGh5kVq2
	b2xVbP7N1K2b3CT2Kymjrp+L7dilxUMVc2r4/5LtzDpwM2vkHRleO49I1+NfoKtb
	NuT5KKGXsJ0psUJfRTMtVZlSAZW6Q==
X-ME-Sender: <xms:hzdBYnlYPu8641ykdBGVKymiE7Dk30eBv513Vo7CnnWPjE2idK1ODA>
    <xme:hzdBYq19iqZg7BFDXqiiYFlTCSHLlnhvL0ky5PNAwSMXSluzNfL0JzyuzGukStASr
    SXo38btdk_4QM-PzQ>
X-ME-Received: <xmr:hzdBYtpIvS4fvxK07fFlZ-6FEacn5Kc86TycD_nGz2GvX2PmUpk51KSm9OkHt4076RuImB9o3ftRXWbOazM8NYE8lJlZImsXJvOC5zBIXN5keLrc_pPZ-Tthzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:hzdBYvlM52_1_BDTRH8dhT2FAJtqOIONzygANrD_kpf6gZbLsYTEVg>
    <xmx:hzdBYl1Ac5SmfFGqV7GqCqdAx0RbABILy6hJ7V0MlMuyp72IjJBwQw>
    <xmx:hzdBYuuRiD2jKZr8qK_v4Tq0TUAPTz0iJ_vXSuBNxjEUhqDfwbbXVA>
    <xmx:hzdBYmv14i078R_ZCFRXxFDOoOKir9bwPAS6OnTzgScVmnHq_KMkTQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 00:20:22 -0400 (EDT)
Subject: Re: [PATCH v2 06/12] ARM: dts: suniv: F1C100: fix CPU node
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mesih Kilinc <mesihkilinc@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Jesse Taube <mr.bossman075@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220317162349.739636-1-andre.przywara@arm.com>
 <20220317162349.739636-7-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <2d01754a-5d3b-bdb3-d447-65267207bed9@sholland.org>
Date: Sun, 27 Mar 2022 23:20:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220317162349.739636-7-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/17/22 11:23 AM, Andre Przywara wrote:
> The /cpu node in the f1c100s.dtsi is not spec compliant, it's missing
> the reg property, and the corresponding address and size cells
> properties.
> 
> Add them to make the bindings check pass.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Samuel Holland <samuel@sholland.org>
