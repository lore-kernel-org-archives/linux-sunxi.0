Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B9262F
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Jul 2022 09:44:50 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 9411622239;
	Sat, 16 Jul 2022 11:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657964688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PFmP/Rr8fzwWcTss+FmGkFnGfEeJujXpyOeGsJcQUTA=;
	b=s8conBUmb9JGXwwVjZrki9huq/w0u3VoszbNJxKt88UipHZLbE53o3m38UfYtUEqqcUjlj
	Kzdux7F7BY49G1fPWWBtkG/QJC0ADnQF11Na7M6UiZluRGFsCFMxvErZnwr5jSN/uscV2M
	QDqvc8ORq4lWyHiBi3LgKVTs+nIQbnU=
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Sat, 16 Jul 2022 11:44:48 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Pratyush Yadav <p.yadav@ti.com>, linux-sunxi@lists.linux.dev, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
In-Reply-To: <20220716093850.GL17705@kitsune.suse.cz>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
 <d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
 <20220714205529.GE17705@kitsune.suse.cz>
 <33abf7b84860049c4a22605578303ff2@walle.cc>
 <20220714220744.GF17705@kitsune.suse.cz>
 <20220715092017.2ftoyzm22i4amrbt@ti.com>
 <20220716082027.GK17705@kitsune.suse.cz>
 <c6955eed3a445f4b87920fe0d47e7230@walle.cc>
 <20220716093850.GL17705@kitsune.suse.cz>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <50ec7bf33d8eca5eb68a079f7bcc12b7@walle.cc>
X-Sender: michael@walle.cc

Am 2022-07-16 11:38, schrieb Michal Suchánek:
> On Sat, Jul 16, 2022 at 11:30:12AM +0200, Michael Walle wrote:
>> Am 2022-07-16 10:20, schrieb Michal Suchánek:
>> 
>> > > So if DT says there isn't a flash on a specific CS when there is, then
>> > > DT should be fixed to describe the flash, and then we can probe it.
>> > > You
>> > > both seem to be saying the same thing here, and I agree.
>> >
>> > The disagreement is about the situation when there is sometimes a flash
>> > chip.
>> 
>> No. The disagreement is what should happen if the DT says there is
>> a device but there isn't. Which right now is an error and it should
>> stay that way. Your hardware description says there is a flash
>> but it cannot be probed, so it is an error. What about a board
>> which has an actual error and the flash isn't responding? You
>> trade one use case for another.
> 
> And what if you have a SATA controller with a bad cable?
> 
> Or a bad connection to a mmc card?

Again. You don't tell the kernel via the DT that there is an
MMC card nor that there is a SATA SDD. In contrast to SPI-NOR..


> Then the kernel also does not say there is an error and simply does not
> see the device.
> 
> This is normal. Not all devices that can potentially exist do exist. It
> is up to the user to decide if it's an error that the device is 
> missing.
> 
>> Also I've looked at the PHY subsystem and there, if a PHY is described
>> in the DT but isn't there, the following error will be printed:
>>   dev_err(&mdio->dev, "MDIO device at address %d is missing.\n", 
>> addr);
>> 
>> And that is for a bus which can even be automatically be
>> probed/detected.
> 
> If there is no use case for having a card with unpopulated PHY then it
> makes sense.
> 
> Here we do have a use case so the comparison is moot.

And what use case is that? You are just demoting an error
to an info. Apparently you just want to see that error
go away, there is no change in functionality.

-michael
