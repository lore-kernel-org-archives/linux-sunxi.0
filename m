Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0508570
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 13:51:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4CCBB5C00D0;
	Tue, 30 Mar 2021 09:51:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 30 Mar 2021 09:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=x
	Prf5dqwfCzTGwPlr5YLFZb2MB8XBjvhKZNXE1q44fg=; b=cr3hiNsWZuDTMdtPg
	wuRj+9DbjzeiYW4ZrBpCEuwD0KfpDrAvfwsW/QsmyW6bErc7oWDj1v2eHET6ivml
	54Otf56dN4+0zVw3GU79ynPsOdR53ZzZHOA8/NJApqtxj1XYkfB7krNddRM5b3+i
	hVMfyUy299Fov7GC8z7gAvpRFongp743UyLdq7pBpYIdhlMZfpv1hW+zzxWwwZZM
	+C2Q+R9wZkGr4jjStTaRhdB9L3Ka67qB7/rxN2fAl3Knv1c0hzv50kD82LJ135JY
	fGm/4MsRHIDcnz0V9VdCU79uPFM0uuImeyxWpylQelMdTs9aoDd6IpnzTgWT4AF3
	0m+rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=xPrf5dqwfCzTGwPlr5YLFZb2MB8XBjvhKZNXE1q44
	fg=; b=YxiGZ0jJ5GR0XSh6fshbZloR6yWaR8ha8X/ek89nGUYb9fpOT+ceLEhJ9
	/BBFNm5hWYxskpOwv2NkcT2OVcNZssE+oVYmEQqTSH3Z34dA15ZiJNNORNYGvRYs
	uSGDeyqOyfp7kwHfvLS1NdRNiizZ2wfBmB/DS9zkyVmQ9hu96v3QW7tF662dW1iJ
	o0BL1kh9pK5iH3GlkYKx1xusQMYBMz8f0SEzPEFZmGHwx5NMxrKCLL01PVqS72I7
	aUKgU9+ZP0sfGZbl1nMNF/QrJKSg21XfM+/TMzxe6NabUSRnG1HvPywXbHBwg1yl
	wUOTp1oPnedbpL+WTiND7G4hDH5Ow==
X-ME-Sender: <xms:9SxjYNmOhJrPWrQpEj8MoAU9AbYnfYZDkUQN65IfWwtczMBiLQnn3w>
    <xme:9SxjYI3kyQjvFSAqp-b-4fZZV213v28a-_G4XnJ5Azd2e7hn4eUsveNr1LOpgVbqh
    kEEq6zFTC3bDJWKJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepvdehieduvdekkedvfedtgeegfffgkeffgfffgfdthfekieevtdet
    kefhffejffejnecuffhomhgrihhnpehtrhhushhtvggufhhirhhmfigrrhgvrdhorhhgne
    cukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:9SxjYDpWqRAFrwxR_E263tcAqjZH6824DJRLZmJJBF7Yb6twUWG5kQ>
    <xmx:9SxjYNk-7Umx0Rp7gyDe_xYEGJQr1T6j5bbOJW9bVWjGZ_CbUcQMbQ>
    <xmx:9SxjYL18yvrBVYVDcc9-3HqVwGHSnHVnWsEeLuYYErKTwGPOSX0uBg>
    <xmx:9yxjYL_IiBp2DGjuvmkSXLIkSVgKF1aM9H6Bth01b7BTrvIanzp1PA>
Received: from [192.168.50.169] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1FE7A240066;
	Tue, 30 Mar 2021 09:51:49 -0400 (EDT)
Subject: Re: [PATCH 2/2] sunxi: dts: H616: Drop reserved-memory node
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>, U-Boot-Denx <u-boot@lists.denx.de>,
 linux-sunxi <linux-sunxi@googlegroups.com>, linux-sunxi@lists.linux.dev
References: <20210330130122.3915-1-andre.przywara@arm.com>
 <20210330130122.3915-3-andre.przywara@arm.com>
 <CAMty3ZDpETzmE=1CRo2d3yT4FN0nSi7p+pvf8cLjBSwfu7Kpkg@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <912b7c69-fdac-8e2d-9d52-b28141beb299@sholland.org>
Date: Tue, 30 Mar 2021 08:51:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZDpETzmE=1CRo2d3yT4FN0nSi7p+pvf8cLjBSwfu7Kpkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/30/21 8:28 AM, Jagan Teki wrote:
> On Tue, Mar 30, 2021 at 6:31 PM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> Trusted Firmware now adds the /reserved-memory subnode to the DT at
>> runtime[1], putting in the right values.
>>
>> Drop our hard-coded version, as this might clash with the actual values
>> (which have also changed), and rely on TF-A to add the node.
>>
>> [1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7770
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>

>> ---
>>  arch/arm/dts/sun50i-h616.dtsi | 12 ------------
>>  1 file changed, 12 deletions(-)
>>
>> diff --git a/arch/arm/dts/sun50i-h616.dtsi b/arch/arm/dts/sun50i-h616.dtsi
>> index 953e8fac20f..dd4d2f31111 100644
>> --- a/arch/arm/dts/sun50i-h616.dtsi
>> +++ b/arch/arm/dts/sun50i-h616.dtsi
>> @@ -51,18 +51,6 @@
>>                 };
>>         };
>>
>> -       reserved-memory {
>> -               #address-cells = <2>;
>> -               #size-cells = <2>;
>> -               ranges;
>> -
>> -               /* 512KiB reserved for ARM Trusted Firmware (BL31) */
>> -               secmon_reserved: secmon@40000000 {
>> -                       reg = <0x0 0x40000000 0x0 0x80000>;
>> -                       no-map;
>> -               };
>> -       };
>> -
> 
> As said always. it's better to not touch Linux dts files. If the same
> fix same available in Linux add SHA1 on the commit message otherwise
> keep /delete-node on -u-boot.dtsi. This how we are maintaining sofar
> at least on sunxi.

This file has not yet been added to the Linux tree, so that rule does not apply
in this case.

Cheers,
Samuel

> Jagan.
> 

