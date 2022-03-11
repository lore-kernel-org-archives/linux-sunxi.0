Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647877E
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Mar 2022 01:30:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 610125C01D8;
	Thu, 10 Mar 2022 20:30:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 10 Mar 2022 20:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=N3yUbIXcOWYIy8
	iWDAanOUdhHos+Ycre+7FQxXeBDyw=; b=tBW8JcE0U4TibzZQaO+EimM6wtzc5T
	iKIMAV+EgRDKsReAICVpGco2FzUkr4VU3byxtm5eLZcG5i2GJny4gyj9TTCIFsNH
	VkZsR0fLjjddSQ+oFf163hA+dGeBE4u/7/Oz9SeCXBAy4AmcCEsWbgbPdgCSZQh9
	A0WxpmXAoHZ1hCt3cmjcRWMfjrk0CvSwtz5Y+ZW1sYyaZybt/gXHz9zXrN2i95jp
	8cmzmzi1TCsjZcFo3Ng2A/nY8fNsqdR5qWSG8PB4vrH55cqwlARyCkgIeI2n7KKj
	sZPfNwRI2zSHjgCwAA8Nl6n/VAMKLGqsUC8XzpYRiSg2SxzBA6vTJImA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=N3yUbIXcOWYIy8iWDAanOUdhHos+Ycre+7FQxXeBD
	yw=; b=aK88Lmic4L4OweHihYXemhJ0rUwLRUGJTLm6q51xgTzwk4mxElcFdbIAN
	4O2A5cU/6QUdXeZxeUDoZVZAJm2rSKOJc7ROnsCBFJZdLoyrl4avtmQbfTf+KJ+9
	9ej4ZZHoOH3eJyoc8bUsOSOTpkth/fOjoD5hiPUAqZayJb40p4AMz4DDImAvvd0U
	aRd9IS12I5e7V7YeaYtcnzqQRG4hwyDQTzxTXzssZtcV3GLaMm39I3apEjQK3P4k
	J90FLyFmYAe9eQPZef7590GIRzrVDBgLgIpj6Jzo+ITgRoS7CYQYn9Vsr7O9qVGN
	IRoBYkgm5u7nhvEoe/6enMvxvvxjA==
X-ME-Sender: <xms:OqYqYsL5TUDP2eIEABn3Hjq__52hyCHQfzmPBtwxL43uyNcJYCrb7w>
    <xme:OqYqYsK_ZTKj-ntPD0g3MiB0lShosF3fhRbk--wG7K2SlHNlRmHRs41fZkI2tjnLu
    nJ7evmii5g_dAj_Jw>
X-ME-Received: <xmr:OqYqYstJ09my_8itjxW7Rgga-azRkUSKyOIaNpY8CuHh7cFpP3j17yT_3sfe_JQxMp32squGgFswZuGVT4FtbCoto_1Tv46yPJfc48YlV2UEqn6mFp1EFC2Jgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvuddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:OqYqYpY5Sum-VtXbrbB6UgSJ53atQNAc27Zn5fwwFoSoggVZNPzwwg>
    <xmx:OqYqYjYN42opvR6gjJhVS1vNNNy2UOxnaRX2gdNr2XMAoUBGBqDHLw>
    <xmx:OqYqYlDAOQN4OqIyjs8ioyU-yJGSxfOJkRbUXbFOCq6IA5lww6ukTQ>
    <xmx:OqYqYhCHAKjpB2lo3SGh5a6jA2DnZ-anaKV8KEiIy_gEsL1PDori2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 20:30:33 -0500 (EST)
Subject: Re: [PATCH 04/14] ARM: dts: suniv: F1C100: add clock and reset macros
To: Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-5-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <a8cc8e3c-2b18-cde1-3c10-e75863e12d74@sholland.org>
Date: Thu, 10 Mar 2022 19:30:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220307143421.1106209-5-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/7/22 8:34 AM, Andre Przywara wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Include clock and reset macros and replace magic numbers.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Samuel Holland <samuel@sholland.org>
