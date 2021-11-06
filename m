Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E9A2C9A
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Nov 2021 03:22:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 64C385C00F5;
	Fri,  5 Nov 2021 23:22:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 05 Nov 2021 23:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	to:cc:references:from:subject:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=v
	fHZYgfD3RWUkA0Mw2l9ruceirgieSFU4L5y9Vfg/Bk=; b=ee5+bp+CUTZgTQs1+
	f0RkYpBRMG1CsiTS0Ll66I511aNpanjzY2Rh5PNWwhbiYCb4eKckwFnKI/WrTPak
	iuwtZUlza6e96ug+fbz+TEa0aWZtEk5aAlamefVH5UV3VHnIln2ESuLC9PYWDR6W
	UxE2htIV+VPAzzbzR4Z2SivTjlvIFMCQmtY77gq/pa+gUAH6VKDJPzMUqY4ltXko
	/rgACAUS3FdUKg7aDPU6das0dlNgSHvminEJj7AlF0gJcqNOF25llTGe67tnXTNi
	WIxhu6YkowYeXnlIXm/cN+Ad5ui/vBhQO2jE6XOMuI3NrIwb3GJhrF6sJH3L/cOD
	CIeYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=vfHZYgfD3RWUkA0Mw2l9ruceirgieSFU4L5y9Vfg/
	Bk=; b=SLCwKL/Ge9enB5Z8TSNXBVqeVeVPJLENWphKNIUgLEY9nT+qVVaMi9TMD
	TCtLZEGJDKwNeVhAMWg7eUEXm+SDIpwHZQvz2Ik24iNEpzt1/+Dn4dQP3Y/syAGJ
	Y0UCyLTC0UoyGMbJSsfmne36xJ5vKhFzS3vgZGY4GMdO0IoeE4e/qAWXsRvrAK2P
	pUA1FgVMfJQBymp4BX1eQLIhmMNgHCcVFti/GLmQEbuN/IePZFP2Q4S3Ftzc6sQK
	LMPPdPjmp9CFdyYXVSjlWewu3RXvNvhlXzUjJ5O6o6kN6VDf5cclHPcR/vcPbk8S
	mI7N9CVTvX8sFejOAsP0KnEzO8y7g==
X-ME-Sender: <xms:9fSFYTZzp7cxu-wJLV29vhxrNyPwmnbTaaWu8PvniNhNv7FD-S9UcQ>
    <xme:9fSFYSaujPUd9aKBfArXrbs2nXk3cUlp_KWenKofeOYr5GBKfCr6mQ5AtYj2pYmYj
    jHljiFXEEGs0S_6nA>
X-ME-Received: <xmr:9fSFYV-ixGdNikFrquP7JJehBnYwilLYTdD-lVzEGl49yxLrBAtbcF1oX4XnmpEQLewaft1IGjDbsVgxtAqwv8V8R9YvmoiY3tVc0iCzUrIwnkqSagyIrLpz2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdejgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefvfhfhuffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeeuhfffgeetgeekjedugeekieffgfejffffjeeltedtuedvgefgheel
    heejveevieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:9fSFYZroES_hHwEfWLl6TCbpuHMXy5OypzTnl3HvScUW-ibxuw5xUw>
    <xmx:9fSFYeop1ldqE-fSkZkvj3CKtgO4s5oofKFcNRGCwjiHV9kieqIhrA>
    <xmx:9fSFYfSwduAoogtONKQYkU7Is9C1mCzfkgfpLXPRNQBeceVxrS5djQ>
    <xmx:9vSFYRXBIKwc5e-lqWy5UPOsB4qaU1hrjxZPQP1S6QhstUQRtbLAgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 23:22:29 -0400 (EDT)
To: Icenowy Zheng <icenowy@sipeed.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20210722063015.421923-1-icenowy@sipeed.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 00/13] Add support for Allwinner R329
Message-ID: <a275734d-62a0-a06b-2985-3d6bb3e16b22@sholland.org>
Date: Fri, 5 Nov 2021 22:22:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/22/21 1:30 AM, Icenowy Zheng wrote:
> This patchset adds Allwinner R329 support to U-Boot.
> 
> First, some code refactors happen for SoCs w/o SCP/MMC2.
> 
> Then the basical support for R329 come as several parts (memory map,
> clocks, pinmux, DRAM, final Kconfig option).
> 
> Then, as the RFC part of this patchset, some device tree related
> changes.
> 
> Finally it comes the defconfig file for a R329 board, Sipeed Maix IIA
> Dock.

I was able to boot into Linux on my MaixSense, but I also needed the top
patch from your branch here:

https://github.com/sipeed/u-boot/commits/r329-wip

Otherwise, U-Boot complained that $kernel_addr_r overlapped reserved memory.

> This patchset is RFC mainly because of the DT-related part, as no DT
> binding is mainlined in Linux now (it's still WIP). All other patches
> are ready for being reviewed and, if proper, merged.
Yes, I would like to have the Kconfig available so I can support R329 in
my pinctrl series.

Regards,
Samuel
