Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A901036606E
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703812; cv=none; b=bt5tTN8N9UrTbWTai+Cyz2kXC2Nbzz3ozhmoswb0quRn6Y9Ax7j6309jfM6HUv4P9rMdLmergRwC0Q0HB4I3VEnuHEDc//OqAP2eMP5K4TzYb/ogDofi4AupoOds8atSMZdITMGEyd1JuhLvCtwQctKAZj3PFMHpOP5nIpGEhQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703812; c=relaxed/simple;
	bh=839+nzH4okvwdDk+k8ZaAg5k9wsWxAATZcpVf8bWMJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXeraA66/Cz1wJmfBD0x447ISUfTVNXxbX1p65iGQA09CX1Cq6m1oEYbw3lPbFz8w64/0MJOwBcchq76apJMvezgMe8WD/GfuvfuuYDFraF+KQjc0HhbTxZohC2F9/+AyI8Ubm+3NbDSzZbFsiO0jOZXrZVDrp/NNN0u9ThJcLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bXK1gu6J; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bXK1gu6J"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 33EC04E42566;
	Thu,  5 Mar 2026 09:43:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3A955FDEB;
	Thu,  5 Mar 2026 09:43:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CF8F103697F1;
	Thu,  5 Mar 2026 10:43:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772703808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sb47bLopwDRLC5J3uAYZg0LFklpkyKvQunefwmeTams=;
	b=bXK1gu6J7ay7a68D7nPXR5xQVhLiZacnJbh1I8p2gZN0vPfoA531M2Gbc0LCIezghjQNOW
	H+Ro4ekCByLVmspDgNulHKjWBokdS+IxN+3o2XSFe55qW+xSiGZCCyreXbg89CwlnK50bc
	tX4KHC2uitPqueFNnhdLLJMDXbmgtxGdrWHko5gksW/Z6ghDSJY7eNc/nW2Nk3SwBeqx4q
	IIh2A1U5ybayI80OJ/fk8nElwnvGUdyCP5e7JaljnjNX3foSJ/TFPfR5lN0Wi70qvGKjPY
	6TlESW/0auIYXl7znkgKolv3sYAkQXPIrtD/B38fDX/Ucct6cOespDUAV5QmMw==
Message-ID: <c3676b98-a0d2-402a-8d6e-8eb0325d32ef@bootlin.com>
Date: Thu, 5 Mar 2026 10:43:24 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 James Hilliard <j.hilliard@upstreamdata.ca>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-4-richard.genoud@bootlin.com>
 <1947198.tdWV9SEqCh@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <1947198.tdWV9SEqCh@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 21/02/2026 à 10:21, Jernej Škrabec a écrit :
> Dne petek, 20. februar 2026 ob 17:10:08 Srednjeevropski standardni čas je Richard Genoud napisal(a):
>> BBM is part of USER_DATA section, so we should remove it twice
>>
>> This was working ok because we are on the safe size, advertising that
>> there was 2 bytes less available than reality.
> 
> Missing "in" before "reality".
ok

> 
>>
>> But we can't change old platforms, since it may lead to a different ECC
>> strength, so, introduce a legacy flag for old platforms, and switch the
>> new platforms to the correct count.
> 
> There aren't any users of H6/H616 driver, right? If it would be, ECC strength
> can't be changed, since it can impact systems, which already use it.
AFAIK, the only users for now would be on whatsminer boards and are not 
impacted by this (the ECC strength won't change from 32 to 40bits on 
those boards).
(Adding James in Cc, as he may know more on the subject)

> 
> Best regards,
> Jernej
> 
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   drivers/mtd/nand/raw/sunxi_nand.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
>> index 9c6e0625e34f..99d305bbda53 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -281,6 +281,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
>>    * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
>>    * @has_ecc_clk:	If the controller needs an ECC clock.
>>    * @has_mbus_clk:	If the controller needs a mbus clock.
>> + * @legacy_max_strength:If the maximize strength function was off by 2 bytes
>> + *			NB: this should not be used in new controllers
>>    * @reg_io_data:	I/O data register
>>    * @reg_ecc_err_cnt:	ECC error counter register
>>    * @reg_user_data:	User data register
>> @@ -310,6 +312,7 @@ struct sunxi_nfc_caps {
>>   	bool has_ecc_block_512;
>>   	bool has_ecc_clk;
>>   	bool has_mbus_clk;
>> +	bool legacy_max_strength;
>>   	unsigned int reg_io_data;
>>   	unsigned int reg_ecc_err_cnt;
>>   	unsigned int reg_user_data;
>> @@ -1811,10 +1814,22 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
>>   		ecc->size = 1024;
>>   		nsectors = mtd->writesize / ecc->size;
>>   
>> -		/* Reserve 2 bytes for the BBM */
>> -		bytes = (mtd->oobsize - 2) / nsectors;
>> +		/*
>> +		 * The 2 BBM bytes should not be removed from the grand total,
>> +		 * because they are part of the USER_DATA_SZ.
>> +		 * But we can't modify that for older platform since it may
>> +		 * result in a stronger ECC at the end, and break the
>> +		 * compatibility.
>> +		 */
>> +		if (nfc->caps->legacy_max_strength)
>> +			bytes = (mtd->oobsize - 2) / nsectors;
>> +		else
>> +			bytes = mtd->oobsize / nsectors;
>>   
>> -		/* 4 non-ECC bytes are added before each ECC bytes section */
>> +		/*
>> +		 * USER_DATA_SZ non-ECC bytes are added before each ECC bytes
>> +		 * section, they contain the 2 BBM bytes
>> +		 */
>>   		bytes -= USER_DATA_SZ;
>>   
>>   		/* and bytes has to be even. */
>> @@ -2379,6 +2394,7 @@ static const u8 sunxi_user_data_len_h6[] = {
>>   
>>   static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
>>   	.has_ecc_block_512 = true,
>> +	.legacy_max_strength = true,
>>   	.reg_io_data = NFC_REG_A10_IO_DATA,
>>   	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
>>   	.reg_user_data = NFC_REG_A10_USER_DATA,
>> @@ -2400,6 +2416,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
>>   static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
>>   	.has_mdma = true,
>>   	.has_ecc_block_512 = true,
>> +	.legacy_max_strength = true,
>>   	.reg_io_data = NFC_REG_A23_IO_DATA,
>>   	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
>>   	.reg_user_data = NFC_REG_A10_USER_DATA,
>>
> 
> 
> 
> 


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
