Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435901;
	b=3+GV3Trx8JGBvJIDSFwsXpfrlpm0yW1GgQPwFRXIKF+cP2n1N8+wQpb+kD5oeQfRESYk
	 bT9BQ7eqsCW+Vmsed2ZeshhuiTkuqc8ALSQaLILi5I60gTW67sPAnR35PiA4VI0vEKz3Q
	 8OduWbvXJNyC98b8nXYZXyPWXnq9n3dyQGUSOpzAoFqIPTYJfOhLCXvgDqlEG2PE7Ildq
	 YLWkTK4zLeTuuKcHyrADf0ubZj40fmYKvWWPPJ/V8/3A8bKxvHC0jf5sWZ1HDSReW+llP
	 fUTI38XwEeaRZTrsUQD6+1CmVTMXcS+F6mB8+b0y8SCVXhqi7rAZbrtnnf/CwDZOCEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435901;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ys650cAde3Q0UZPCkuSKgdoYQBhDD7kH4x34+Y7aDk4=;
	b=GQRYctF6gjCJk9xu0Sl8RH3T/i8zpzwmDuN2V73xkvbG9eQfUpzXD0bdMVaI9H38Dn97
	 eYt5bvcx9VpY4Spa59YPGF9O/OvLgTdGPFEzM/qZafR5tMdPqX8z5IncDkrZ2PpvUZUE2
	 NZSGlxtOQ4HcZEyfNvbNbxf5bFZk/lt35OB/piK8TazWkIfHU4w8td25qn8TpkVfTSiuU
	 SjVmhvdJXV1a2dMBdE1vbRa3I6SVC0CiscTq1DnyfgTOt4+NXxfegPm62AaKIGJUdDEDW
	 TxnCDSC6woRnbjUnOVo9boHWy6IcVaxflgDyQEP8OB7W4HkdIugrFzTb2RsWGVBnKxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=upi0++HA;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5C1606A31E
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 12:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=upi0++HA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F092143D;
	Mon, 23 Nov 2026 04:11:37 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F38793F882;
	Mon, 23 Nov 2026 04:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795435899; bh=IXJlhkOu02PMLJhAmFQG3suYsDUBwjTHBtjb3rIawWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=upi0++HA2QQxKi3l/eDto4HMDostHb/auc9eIJQt4fBdzYPGzQRfCHEz+vl/NlpzT
	 lNuooRR/vLYiLvR8RrRDrnBCKnBuz4xEy5w+1cpBTy6V4FPWHFt/xLu+HwM+nvkRiQ
	 ChyjiRsOhlqi87WQfkg7lR0nkKUVgDSmKcqGVbbs=
Message-ID: <374d9bf5-5c91-4f93-aa25-f0666802e153@arm.com>
Date: Mon, 23 Nov 2026 13:11:37 +0100
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Enzo Adriano <enzo.adriano.code@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
 <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/23/26 12:15, Vinicius Pedrosa wrote:
> On Sat, Nov 21, 2026 at 12:14 AM Chen-Yu Tsai <wens@kernel.org> wrote:
>> There seem to be 3 revisions of A7Z. Which one are you targeting? Or are
>> there no differences as far as the OS is concerned?
> 
> I'm targeting V1.11, which is the board I have and tested.

I think we should aim to support both variants with one DT. I don't 
think it's nice to expect users to pick the right version. The board I 
have is v1.10, and it's about a year old. I think there is an even 
earlier batch, having been sent out in summer of 2025.

I think the DT can be made compatible with both v1.10 and v1.11, and 
probably even v2.00 later:

> I compared the published schematics. V1.10 differs from V1.11 in two
> places relevant to this DT:
> 
> On V1.10, BLDOIN comes from SWOUT2 and CLDOIN from PS. V1.11 uses a
> separate SY8089 step-down regulator at 2.4 V for both.

Both SWOUT2 and PS are always-on, and this SY8089 regulator seems to 
have no enable control as well. So the DT dependencies should be only 
cosmetic. So it shouldn't hurt keeping the regulator, just adding a 
comment about the v1.10 not having it.

> V1.11 adds a 10k external pull-up (R59) to the microSD card-detect line,
> which V1.10 doesn't have.

Argh, on the v1.10 I need to enable the internal pull-down(!) to make 
the switch work. So I guess it connects to Vdd internally if an SD card 
is in? In the v1.11 schematic it looks like D1 and D2 form the two sides 
of the switch, and the other side (D2) is connected to GND. So the 
switch trigger is probably inverted?
When I leave the pull register bits at 0, the readout is inconsistent 
(goes to high when a card is inserted, but stays there when removed).

I wonder if this works anyway with using both the internal pull-down and 
potentially external pull-up resistors? As one would win over the other?
Can you try how your board behaves with:
         cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;

Let's hope this works ...

Cheers,
Andre

> So the power supplies and card-detect configuration would need changes
> for V1.10.
> 
>  From the V2.00 schematic, the parts covered by this DT (PMIC, microSD,
> LED and UART) appear unchanged from V1.11. V2.00 adds MIPI DSI, a second
> CSI connector and a backlight driver, none of which are described here.
> 
> Would you prefer keeping this DT for V1.11 (and V2.00), with a separate
> DT for V1.10 if needed, or splitting the revision-specific parts now?


> I also saw Andre's review of Enzo's v4 [1]. I'll apply the relevant
> changes to this DT, including removing the MMC alias and revisiting the
> regulator descriptions and constraints. I'll wait for Enzo's v5, test on
> my V1.11 board and send a v2 with those changes and the LED patch
> squashed into the board DT, as Krzysztof requested.
> 
> [1] https://lore.kernel.org/all/20261122003932.568c099c@ryzen.lan/
> 
> Thanks,
> Vinicius

