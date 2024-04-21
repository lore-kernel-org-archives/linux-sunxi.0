Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEB7DDAA
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713687548; cv=none; b=VbQ0rh8TbEAyeYtLAQ/Ui9ZoyXdr/LjuGRg4tFNpUQgecqlF4Cf0lXPh9kJGn2g3y8SMjCmYtA/JYL3hoqo+ZtG5b+lM0Ie9oZeaTiLqwOHL/UqyqEHB6xsOSjCiTjSnosVaKWZZEgtz3kxEkyFa4IG03KJbykU65Hmrism7U1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713687548; c=relaxed/simple;
	bh=kKnK8BeozGS7jozkI8+/2KZo4CgSFX7t83/cLCiMias=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=oiWojIG+lCXMFdeoXIvKkECTTUvPyrrXmWPzkJSvHNxVM7jXe1kmR9at3nDDj1xnfL0MK35OSoiNaLfZ3AiNcynwibYSTjX7iaXFCP8fOk4gdvCKCqvluxyOL/WgRkncl+GLz6IK8yZMX3Iy+/hzThRmkSoNPbe+BLFjLRhYbZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=POKlyWmW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TmygOjU5; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="POKlyWmW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TmygOjU5"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6615911400DB;
	Sun, 21 Apr 2024 04:19:05 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Sun, 21 Apr 2024 04:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713687545; x=
	1713773945; bh=2udkxwxjds/VwDb1Q5OCc7vYBbu3kmBab9blMG5T6RM=; b=P
	OKlyWmW6Uk4hJQ1cjttq/Wy/yL1ye7QXl8vP87GB2xoLYrQaUiNl5IEOf3IybKob
	sdqnpowZzm5uGrWoLYWNrZmuIzmWIb4WJ2G0gYYC7SyognfLLRwjES/yN6llnoq8
	ff2CnJl6DaPUf8SOTxou9tEbDVi8keSWAcUgprlcn+3ZO6N5kbZX0qR7Rt9rXUlt
	lg0jyi8HMVjIpShWjUfzmdhc9YuRyyk2KapQV/x7lpbY4jmw8xUhZUVukOksj0A8
	pHPB4MKQcYtmUiR74CglW+5F0LEkN2jzFxhAiXb9JPNG8tS2WD8ZwRnCI1MhAcJX
	aP0fttqAXRmynYXjm1uyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713687545; x=1713773945; bh=2udkxwxjds/VwDb1Q5OCc7vYBbu3
	kmBab9blMG5T6RM=; b=TmygOjU5R70DML/qEdKIaOSZ2nk8RysPqBBRpUwLgDEb
	/u4DVz/c0W5BYKIs5dkz/E1Ag66j2kOv0K3s44Yj4MOxRhbrbNgF5CpBOTJGdb7i
	3ksIFz+fpE2R+myojNrGWyaFgKD24X1h7EDt6bW5Xar5oPb2tJyFewTpb/buI/kb
	cZnn8Xfrg5AO9cLKy4d4JOeMzybf8AsIDERZl2oYsa1/IokK+qoeNuoYYEtqrMKz
	N0uuFVceKNEH1r3JqEjOpdLJeScp0NXrQqft5rsYmM7oeyr5jzOHBhdli7oQPRiW
	/CmQdoFihHFKIAu8MrU5m1cQRKylFoKQM1+QgMPkHA==
X-ME-Sender: <xms:-MskZti4moEe00iCgWxqEQmFoipD-aa18R1cs7W9XIHRNQvun3hT2Q>
    <xme:-MskZiDgCDDGKJWbXAuzLbsmEkZgZlhaQJeF5fCBZbWAb_jgo34hSUgAraKdW2XhW
    pnteuLw9xf220ZY4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekjedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
    rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
    ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
    ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:-MskZtGFBMK7bUwr1L0knJoQlF5UPgkmgSye5gavvXkSD67Zi4wnZg>
    <xmx:-MskZiQstosdsInFGwBjNdJoE9tnh02i-hjdCOZsmB90u5Q68MmZxQ>
    <xmx:-MskZqznrE1dh9LmUzfkaw-SD7XqyWqG_nwFnHqzBTzgjR-ZwzX97w>
    <xmx:-MskZo7IOabcC690qQZMiLMwYlNjtkMntkA4xjI_nuqiwNhzdrpkmg>
    <xmx:-cskZued_oIakFzY1_wdHAn0dxiUVS126Jkufw_ggOEN0kU4BveNoBmQ>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C6192A618EB; Sun, 21 Apr 2024 04:19:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <9ed7fbbd-44dc-451d-a800-01bef205cebc@app.fastmail.com>
In-Reply-To: 
 <DM4PR05MB9229B7D4654478D28D1BC2B6A5132@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
 <20240420104354.334947-10-ryan@testtoast.com>
 <20240421020627.6d186f8f@minigeek.lan>
 <DM4PR05MB9229B7D4654478D28D1BC2B6A5132@DM4PR05MB9229.namprd05.prod.outlook.com>
Date: Sun, 21 Apr 2024 20:18:44 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Chris Morgan" <macromorgan@hotmail.com>,
 "Andre Przywara" <andre.przywara@arm.com>
Cc: "Chen-Yu Tsai" <wens@csie.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 4/5] arm64: dts: allwinner: h700: Add RG35XX-H DTS
Content-Type: text/plain



On Sun, 21 Apr 2024, at 3:09 PM, Chris Morgan wrote:

Thanks for the review and all the work on the regulators!

>> 
>> Is there any reason to not just use the existing gpio-keys node?
>> Either put a label on it in patch 2/5, and reference that below,
>> outside of the root node, or use an absolute path reference.
>
> I would also second just putting an alias and adding these to it.
> I myself as a preference tend to set the GPIO volume buttons as
> a seperate node only so I can enable key repeat on them, otherwise
> one node is best.
>
Thanks, have split the volume keys out and merged the thumbsticks into the existing node. 

>
> After extensive testing with a multimeter and fudging the regulator
> voltages up or down, I've been able to figure out the regulator
> assignments for each of the different power domains. Schematics would
> have helped, but sadly this had to be done the hard way. Based on
> past experience with Anbernic I would strongly suspect all devices
> have this assignment, but I know for sure my  35XXH does.
>
>         vcc-pa-supply = <&reg_cldo3>;
>         vcc-pc-supply = <&reg_cldo3>;
>         vcc-pe-supply = <&reg_cldo3>;
>         vcc-pf-supply = <&reg_cldo3>;
>         vcc-pg-supply = <&reg_aldo4>;
>         vcc-ph-supply = <&reg_cldo3>;
>         vcc-pi-supply = <&reg_cldo3>;
>
> On my board the reg_cldo3 is a constant 3.3v output, and the reg_aldo4
> is a constant 1.8v output.
>
Nice work! These work well in my testing.

>
> I haven't figured out the boost regulator yet, but for the host port
> I've been able to ascertain there's no less than 2 GPIO controlled
> regulators in play. PE5 must be driven high or the USB host port will
> not power on at all. If PE5 is driven high then the port kicks on, but
> at 3.3v. Once I also enable PI7 the port then reaches 4.6v. I'm not sure
> how to get it to a proper 5v yet, I'm still working that part out.
>
Thanks for working all that out, will hold off any other changes for now.

Ryan
