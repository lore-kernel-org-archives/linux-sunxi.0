Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94F2BD18
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Jul 2024 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720946913; cv=none; b=XvaVe9xJ/YQiPzio+ibqsx6z4My9G6rTjWJARsG9+KfBsV1paX3GyZ9dJCDgtcJ8/E76K0HOM4cFVLCyY9Xyk/ud1EskOFiESg0YbQM+2M5p6qXbyOGfN5kaLlR2OQE+ebCUMwGOMZ+f3ABBLcQkoiVkd/IO73BQzSlsLMguWy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720946913; c=relaxed/simple;
	bh=WTqUODSOxuqYOcK/UVm++azp/N034rVFuT2xF2W3IKM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=nSpPp2YjOM6xEHWgB9pUBkBDyGF6X4OanyYGq+Ue859gChK5BSuNFXcLNxiDibXF0KwRXvbkCW1TWkZsa3ZD/Sboe2q1Bz8NNqMYJUoiGRGDXT11DR33aZotQLntJ8xolQjp3RQcdV0l+II40PSQLyW/rFtGFPksjRKFCIcw//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=G783+MMD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z2N9/S45; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="G783+MMD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z2N9/S45"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id E7097114264C;
	Sun, 14 Jul 2024 04:48:29 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Sun, 14 Jul 2024 04:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720946909; x=
	1721033309; bh=r6wcnXOeTaMcTRf12KBeh5Qn82oL85PkY45PDXwULFE=; b=G
	783+MMDplXMI/7Dwm+iWV8MFQ0iz2kBo+kaL/Jy2HaUV3LMFmGbtrQf7QEhjJdO7
	dhOjjis5odIHb0t5iHDTNpcuBF3JIXxWOvOVibeQnF4ERorAcqHaGT1JAznAOqkz
	4bo+ZMjuRJv6e9eWINrrhF3QA3NaTL8eNtGLRERYp4Kt3r6hz8K6efQPV9j7poz5
	efni0Q98npCBiyHWDs0HRtCrtJS3JBrqsiLayO2yASAoISRik8Hz3/i2gMavk3Nj
	719EvPLkIgE3X5Gi/CBk8TzvkvhO5bagwDMraOwe8wMaxRpvlkGGGWchP2sa+ed/
	jYFSHgH8n9QwUBMFXQ1Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720946909; x=1721033309; bh=r6wcnXOeTaMcTRf12KBeh5Qn82oL
	85PkY45PDXwULFE=; b=Z2N9/S45n7ltZAhU4mP1h5BNzVfwvPJ8kyS74U8Wim4t
	E5ewWcYSyxsbQwNok4DUCMlfAfe7Y/H2jNE1YSIF51KK6eXAgMQWp2SlCUb8pffW
	gHMoFBML5yE6WNS99kbEHclUCynXLwtO2BicYOSgjHKZ/1nW2ArXIcRmjw0/HXNl
	UqGk95Jw7/Vt8t5pzo3WPt/TWHLQ4f5+Jp5XX6l9zyCAOPDt3SvJqDDxob3Dk3vs
	04ye6qXSKybCbrvqfdTK86OfzYUSFbPqMHg7l2gL7L0xQgVs/Wt6sQSVyx59ja1P
	q/YMVMzZm5GZ/f6QCpLz5yC836JZ4xbe3EMG6PdnVA==
X-ME-Sender: <xms:3JCTZj87NjR9p1bEzkrOTytOjkDG50SfuusZejyOMCKCJOy5G82vdA>
    <xme:3JCTZvvvW3x8ORd8pAGmE6PgMmTFlmLP3fH0sun1BT7vggPZAypfitjUnzc8wfSZh
    vK5buKGpoqmYcLOOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgedtgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfthigr
    nhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehvdevieegudejueefgeffhefhffevudfhieejgfdtffetlefgteeu
    veeiudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:3JCTZhAIhWlkifT1tohIkG_OGIQjSkugkKpaAxmV8btSGFlWuJgxIw>
    <xmx:3JCTZvc6hgYxgGiMGXfgTbDY0V5EzY8mV5sABKNjoioizT1iAVwlIw>
    <xmx:3JCTZoPJGCo7hYttvM2prFt3nmcR42FEFXjdKWYwXu_sdvfd8qBakw>
    <xmx:3JCTZhkbRBFQYEg9VyBotK-DBMWiFtRVGte_us6OaOFlpE6Rrer75Q>
    <xmx:3ZCTZkkysLdBCmxc8r9byzlAQmGtO7ISVhP7mze-F_TUBZaOJAZFpvdo>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 55F08A60078; Sun, 14 Jul 2024 04:48:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <9a9daf47-0313-49cd-b87d-1e6e94781ab7@app.fastmail.com>
In-Reply-To: <20240711105256.61d1f00e@donnerap.manchester.arm.com>
References: <20240710231718.106894-1-macroalpha82@gmail.com>
 <20240710231718.106894-4-macroalpha82@gmail.com>
 <20240711105256.61d1f00e@donnerap.manchester.arm.com>
Date: Sun, 14 Jul 2024 20:48:08 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 "Maxime Ripard" <mripard@kernel.org>, "Samuel Holland" <samuel@sholland.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Chen-Yu Tsai" <wens@csie.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Chris Morgan" <macromorgan@hotmail.com>,
 "Philippe Simons" <simons.philippe@gmail.com>
Subject: Re: [PATCH V3 3/4] arm64: dts: allwinner: h616: Change RG35XX Series from
 r_rsb to r_i2c
Content-Type: text/plain



On Thu, 11 Jul 2024, at 9:52 PM, Andre Przywara wrote:
> On Wed, 10 Jul 2024 18:17:17 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
>
> Hi,
>
>> From: Chris Morgan <macromorgan@hotmail.com>
>> 
>> Change the Anbernic RG35XX series to use the r_i2c bus for the PMIC
>> instead of the r_rsb bus. This is to keep the device tree consistent
>> as there are at least 3 devices (the RG35XX-SP, RG28XX, and RG40XX-H)
>> that have an external RTC on the r_i2c bus.
>
> The change itself looks alright, but I would like to see some Tested-by:s
> from people with those Allwinner Anbernic devices, since the change affects
> all of them.
>
>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>

Tested on RG35XX-H and RG35XX-Plus devices, confirmed AXP717 detected and configured using I2C bus by both kernel and u-boot. 

Also note this change corrects reboot behaviour on battery-based devices, where the AXP717 is not reset (and so remains in RSB mode) and is unable to be addressed by the u-boot SPL driver (which is I2C-only) on restart. Using I2C for all accesses prevents this behaviour.

Tested-by: Ryan Walklin <ryan@testtoast.com>

Regards,

Ryan
