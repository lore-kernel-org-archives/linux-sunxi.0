Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14171859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 21:03:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id A4B8732001C6;
	Sun,  8 Jan 2023 16:03:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 08 Jan 2023 16:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1673211794; x=
	1673298194; bh=N6sMNjIWFzbfAmxmsj7w/np8M6rVoqo+55Ota/Tj/5g=; b=P
	qa6NFbJyW5tATdGsSXp4023niHQhI5yadtsjWGdIjki4iFOiFwiWze2DKjVAEuFp
	O5A6q3nNbRbkQeZ7Vwm9dElSwFuO31y/iCzo0GHyw5YzpE07GEkVQizO2QxeVQO6
	6Ta1DreqD68FFBdW6fhijwCx+WMq3PpZKuP98NZcJaJR+7UEdk/FI+K/3CW2TvFd
	BCpuSPsokkwS/tdTGb1kKRF5l2++LG3QeOWpb4KFAjjauReK9UEiKw5tbGlWd83Z
	mirbOGbCKFFvp46jeO9MaUHWF0eTRQjag+Fyt1ZydnYmNVKXHNBvrcnqrIJzoBRu
	vju9frmvTNYvQz94XkmgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673211794; x=
	1673298194; bh=N6sMNjIWFzbfAmxmsj7w/np8M6rVoqo+55Ota/Tj/5g=; b=j
	oBhhDhF5N1ZLd0WkDcceHrj3ugAggrK2zaayvaok92K83eSq79MW/SVQlQ9InNvs
	NnB1mkkZ3gtbJ56b/JO3usyJaXHBRa88UnqLdG3phzRDgU8bcu4JHSmOzGwlnuax
	S02h3WetsngPBfZvFe3j4mKyii2SWsYLK8fHOVybcqOWMDOfSU6Y4Ls5SevKi4hs
	UWTzTubpzZTUzWs2DE2+7OBpr2OxtJMVVuRrs2f6l/CpooJZ2qrIyAjG70jwgHDt
	FAzVTeAc3O7fkKCwPnHQJXRTwQZZSrf5W2yn0dMuSLLj/bAbxZisak6Uyb6W2vTM
	mBHSrgKClj5nwqqDmPa8w==
X-ME-Sender: <xms:ki-7YwyU3obb8_oyWyFwpjjJwi85NqOjzeoaHDHg4VOFA6fWGZPibA>
    <xme:ki-7Y0TtzZDmjmv1Jptd3tohAosG-t8P5An55XmpV3NEc5ch_S0qcW5LHxYR0egH3
    L5ao8q53bEQZxYTKg>
X-ME-Received: <xmr:ki-7YyV26VSc1H0A0Zb2e-W4S1I7uTfYYu4CEOOQtNp1reX-2HoKt02DqYdf5lVY1gWj1ozhCksyvDv3H-KW_Npfgm6RQk_KRbqAy4J6VZu7goR_63JbeDRUQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggddugeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ki-7Y-j3iyxhiUx5kcblSr1hL1C5q1yIFzIw4mbOloJdMhhfoihYdw>
    <xmx:ki-7YyDCdq4Mqz2dqe1v4BYVbJBzLnivkp_wsa4K8FP4lm36c_6BxQ>
    <xmx:ki-7Y_IDYDE7qToL2PMgEm62eN2r2BJ0s5uVpbDWTesWoLc5EzAplg>
    <xmx:ki-7Y9M1dsU4MEQ89KUQnGrWcF40420CLAuXMi26mYbm5N53o3Gz4w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jan 2023 16:03:13 -0500 (EST)
Message-ID: <89b970a2-c8ac-63bb-a0a2-095daabdc00b@sholland.org>
Date: Sun, 8 Jan 2023 15:03:13 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 3/3] sunxi: remove CONFIG_MMC?_CD_PIN
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20220713162145.95744-1-andre.przywara@arm.com>
 <20220713162145.95744-4-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20220713162145.95744-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/13/22 11:21, Andre Przywara wrote:
> For legacy reasons we were defining the card detect GPIO for all sunxi
> boards in each board's defconfig.
> There is actually no need for a card-detect check in the SPL code (which
> consequently has been removed already), and also in U-Boot proper we
> have DM code to query the CD GPIO name from the device tree.
> 
> That means we don't have any user of that information left, so can
> remove the definitions from the defconfigs.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/mach-sunxi/Kconfig                  | 27 --------------------

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

