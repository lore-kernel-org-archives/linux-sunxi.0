Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158EB3176EE
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Mar 2026 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407840; cv=none; b=MQYn5OzrGxMCnLhxdx2A0AVbybfiw2VUTovVSlAwhTvFMue6qXbvnfOzBQnYGmRBfiKm6we7WgMadtc9dhcu/cUAZ2ZQXz5jJ672cVLH4wJC6ogTuzvTs6LqeW6Rz8Ra3Hu7W6zA+S5qB1biByQQtRId9Alve9vRK9fhTPn1JPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407840; c=relaxed/simple;
	bh=EM3MHGQyhj5OEfWj3f8jyWiMW9WgDNSB5O6K6ErqeNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZLJUkPp15ff6NTcEGWmiiF9b+LH6tUvTSmMKnhxUmSgsVDh6aq3k33W7ZXvbdCiROYrdn5lQk77B8atpWkv9feid7awgbBmJx7gSNVrG4mybhHgwzHYU1Rees7jlD0lOHDpEZMAcB+X78SgtqIhLCn8uCBXgwGv1ORKz/E9LNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VvoaKN1d; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VvoaKN1d"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2FE7A4E42664;
	Fri, 13 Mar 2026 13:17:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFCFA60027;
	Fri, 13 Mar 2026 13:17:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8601B10369EFA;
	Fri, 13 Mar 2026 14:17:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773407832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JOFoYAGJVyyk6xus0Z9WrQazmgihSHEPBTdXrGtZqcU=;
	b=VvoaKN1dElbt5A/ybhYmCk6wEI1Ngpxe3iW3oiNxdyeYLq1bqdTWhYNUJrTky/N5PLukYP
	+SX8Pxiy0Amwukf7dJZ0u1o3+9D+hjQri/gJIOkGvLzoeunqOR83EhbIwSNY4T1MfA2fpq
	OjmOjaa8OKvYpQP173AzLyfCYegCnyzfkYNCfLRi8p/Q2rq79ZosUn3F4oKIUPvVZCWtoR
	rW6a1Fdzan6FZ6YcGjglY+5bxobYNRmAVtVpYqAFHIWdMLbrf09qfKh6Z/59CMG/T6UzDS
	AHhAfsXlSebetCMmVajdULN7rrm8taDoo3nq/adst4SvEmeygDrg3B+PiH1DiQ==
Message-ID: <8d33c193-995c-4225-9998-8c81a2268065@bootlin.com>
Date: Fri, 13 Mar 2026 14:17:04 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mtd: rawnand: sunxi: introduce variable user data
 length
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>,
 Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
 <20260305100137.2558423-7-richard.genoud@bootlin.com>
 <87a4wdkt3y.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87a4wdkt3y.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 12/03/2026 à 15:41, Miquel Raynal a écrit :
> Hello Richard,
> 
> On 05/03/2026 at 11:01:37 +01, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
>> In Allwinner SoCs, user data can be added in OOB before each ECC data.
>> For older SoCs like A10, the user data size was the size of a register
>> (4 bytes) and was mandatory before each ECC step.
>> So, the A10 OOB Layout is:
>> [4Bytes USER_DATA_STEP0] [ECC_STEP0 bytes]
>> [4bytes USER_DATA_STEP1] [ECC_STEP1 bytes]
>> ...
>> NB: the BBM is stored at the beginning of the USER_DATA_STEP0.
>>
>> Now, for H6/H616 NAND flash controller, this user data can have a
>> different size for each step.
>> And the vendor has chosen a different layout from the one on A10, using
>> 8 bytes for step 0 and nothing for further steps:
>> [8bytes USER_DATA_STEP0] [ECC_STEP0 bytes] [ECC_STEP1 bytes]...
>> (Still with BBM stored at the beginning of the USER_DATA_STEP0)
> 
> I would rather be in favour of not following $(random vendor) firmware
> layout. Upstream, it makes probably more sense to just allow access to
> the maximum number of bytes that can be covered by the ECC engine, so I
> would rather be in favour of computing the maximum size that you can set
> for each step, without going over the OOB size.
Ok, I'll write an implementation for that.

Thanks !

> 
> Once this set up, I believe adapting the driver locally (out of tree) to
> match a specific vendor layout would be rather straightforward, as all
> the configuration pieces would already be in place.
> 
> Thanks,
> Miquèl



