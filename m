Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623731859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 21:01:31 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 2D5D132001C6;
	Sun,  8 Jan 2023 16:01:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 08 Jan 2023 16:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1673211689; x=
	1673298089; bh=UQuQ7xx4Fnh08xmJ6f/MRX3kagDOp8QM/xxCxW1tR5k=; b=a
	afDTqPD4C+2Oznrd4GCacVJVprJtvSlFv7wXJ9L4rgYpmaaO8nNBdYwhoaJmqNvJ
	1chXCelQCPFGnmBkoEkXZuN1tzoNgxJEdE6A6IBjIeGYIhPsckyLaH2WYfrBWnSE
	afTFLZ3Bim8oT22OjMXBsHcgxGja8ZCNCAFoxJsxJbSF6p57YyabZYfn0QqU5qr+
	YafUjJANzbE67QgO9UXpYngZH2vQTbUO9PGIQX9+agopE9cD0OMe5p6/vlfFaAYE
	Wnftr03GVg5TGtfZpiypw5f9nSAA9Wbr0DxhVu1CSPWIzec1F0coivsFR+AbVRyZ
	kOOrSORAOxcI4QvKWx62w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673211689; x=
	1673298089; bh=UQuQ7xx4Fnh08xmJ6f/MRX3kagDOp8QM/xxCxW1tR5k=; b=r
	pwpF8OB/fTgT9RZp1VOxaDz2CX6WzJWiRvx438IekDTdcnCGEs0hH0LfUu2n/yXx
	oU+vc+pOukpcFTAHeZQ6v82anmNa3DZRtbhqOB9XdgG9hF87RnvR7GD2FEHjoRGu
	kii13hp0KHxSoCmviolUnaRZAx9Ei/+qaCUTUt58OPQNRL32axW4AOnmF1WXXlUB
	QI6GBhWk89BX7Cf6IGAgKE4WxAwD7jwIwO57jwUeHD36wSwQjJbS1KwWumNnliTw
	hC1e966C+eHvhGh6FFeE789B+X/wQjKPfBl8+hhY1kdBShvgGA5cpN0z7oKg5I+r
	oiqxM7WSxIJWzvZ0xfY3A==
X-ME-Sender: <xms:KS-7YyFLc898dpzJqoGftoYZJD0tOJjMpyeVndfaV9qp7oUNqzDMvA>
    <xme:KS-7YzW_-BFpuOFxxWsssgdYW9gANziRR-xrMgzNo4dchh6f8n9igQoEAsyn94vNH
    9qnjmYzbN3dvgQLzA>
X-ME-Received: <xmr:KS-7Y8Jf71TmsEOYY4RCrzb7yiix5A318TM8dLvjj3w4eMZzzqZq5H7UmMgXF2C07aoyChbZguPaeUsmxSX_5yYbEdJIXJeiC2jgvIGwRCXgpH4bES94khi7rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggddugeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:KS-7Y8F9rwEgIDlv0PNEwGiQJL1nnWcXUqcY-1tr_WmxOel99487iA>
    <xmx:KS-7Y4W14-qaQncT8a54oblubuHZSiPDtP_XWyu4c3wvv-7qa8glfA>
    <xmx:KS-7Y_NjjMVJlqCdc_7FNRCX0scJuWl4m9eX1NehbidrpHuMHmyUMQ>
    <xmx:KS-7Y_Q09O159ZD05Vt200TJmOo-w_kN8xSQXUPxw8JaMVL4xe_EBQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jan 2023 16:01:28 -0500 (EST)
Message-ID: <d8a8f151-a161-a451-2b93-26835fc41692@sholland.org>
Date: Sun, 8 Jan 2023 15:01:28 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/3] sunxi: mmc: group non-DM specific functions
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20220713162145.95744-1-andre.przywara@arm.com>
 <20220713162145.95744-3-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20220713162145.95744-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/13/22 11:21, Andre Przywara wrote:
> As the SPL code for sunxi boards does not use the driver model, we have
> two mmc_ops structures, one for DM, one for non-DM. The actual hardware
> access code is shared, with the respective callback functions using that
> common code.
> 
> To make this more obvious and easier to read, reorder the functions to
> group them: we first have the common code, then the non-DM bits, and
> the proper DM implementation at the end.
> Also document this structure in the comment at the beginning of the file.
> 
> No functional change intended.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/mmc/sunxi_mmc.c | 117 +++++++++++++++++++++-------------------
>  1 file changed, 61 insertions(+), 56 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

